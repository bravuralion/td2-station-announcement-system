Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$filename = "$env:APPDATA\TD2-AN.wav"
$resourceRegion = "westeurope"
$apiKey = ""
$ttsUrl = "https://$resourceRegion.tts.speech.microsoft.com/cognitiveservices/v1"

$fontFactor = 2
$defaultFont = [System.Windows.Forms.Control]::DefaultFont
$newFont = New-Object System.Drawing.Font($defaultFont.FontFamily, ($defaultFont.Size * $fontFactor))

# Hashtable
$categoriesNames = @{
    'APM' = 'osobowy';
    'EIE' = 'express';
    'EIJ' = 'express';
    'EIS' = 'express';
    'MPE' = 'pospieszny';
    'MPJ' = 'pospieszny';
    'MPS' = 'pospieszny';
    'RPE' = 'osobowy przyspieszony';
    'RPJ' = 'osobowy przyspieszony';
    'RPS' = 'osobowy przyspieszony';
    'RPM' = 'osobowy przyspieszony';
    'ROE' = 'osobowy';
    'ROJ' = 'osobowy';
    'ROS' = 'osobowy';
}
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition
$iconPath = Join-Path $scriptPath "logo.ico"

$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Announcement Generator 3.0"
$mainForm.Width = 750
$mainForm.Height = 600
$mainForm.Font = $newFont
$mainForm.Icon = New-Object System.Drawing.Icon($iconPath)
$mainForm.AutoSize = $true

$trackLabel = New-Object System.Windows.Forms.Label
$trackLabel.Text = "Track:"
$trackLabel.Location = New-Object System.Drawing.Point(10, 140)
$trackLabel.AutoSize = $true
$mainForm.Controls.Add($trackLabel)

$trackDropdown = New-Object System.Windows.Forms.ComboBox
$trackDropdown.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$trackDropdown.Location = New-Object System.Drawing.Point(10, 200)
$trackDropdown.Width = 400
1..600 | ForEach-Object { $trackDropdown.Items.Add($_) }
$mainForm.Controls.Add($trackDropdown)

$trainLabel = New-Object System.Windows.Forms.Label
$trainLabel.Text = "Train:"
$trainLabel.Location = New-Object System.Drawing.Point(10, 250)
$trainLabel.AutoSize = $true
$mainForm.Controls.Add($trainLabel)

$trainDropdown = New-Object System.Windows.Forms.ComboBox
$trainDropdown.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$trainDropdown.Location = New-Object System.Drawing.Point(10, 310)
$trainDropdown.Width = 400
$mainForm.Controls.Add($trainDropdown)

$stationLabel = New-Object System.Windows.Forms.Label
$stationLabel.Text = "Station:"
$stationLabel.Location = New-Object System.Drawing.Point(10, 20)
$stationLabel.AutoSize = $true
$mainForm.Controls.Add($stationLabel)

$stationDropdown = New-Object System.Windows.Forms.ComboBox
$stationDropdown.DropDownStyle = [System.Windows.Forms.ComboBoxStyle]::DropDownList
$stationDropdown.Location = New-Object System.Drawing.Point(10, 80)
$stationDropdown.Width = 400
$mainForm.Controls.Add($stationDropdown)

$response = Invoke-RestMethod -Uri "https://spythere.pl/api/getSceneries"
$stationNames = $response | ForEach-Object { $_.Name } | Sort-Object
$stationDropdown.Items.AddRange($stationNames)

# Checkbox für Auto-Update
$autoUpdateCheckbox = New-Object System.Windows.Forms.CheckBox
$autoUpdateCheckbox.Text = "Auto Update"
$autoUpdateCheckbox.Location = New-Object System.Drawing.Point(450, 320)
$autoUpdateCheckbox.AutoSize = $true
$mainForm.Controls.Add($autoUpdateCheckbox)

# Checkbox für Verspätungen
$delayCheckbox = New-Object System.Windows.Forms.CheckBox
$delayCheckbox.Text = "Delays"
$delayCheckbox.Location = New-Object System.Drawing.Point(450, 360) 
$delayCheckbox.AutoSize = $true
$mainForm.Controls.Add($delayCheckbox)

$audioCheckbox = New-Object System.Windows.Forms.CheckBox
$audioCheckbox.Text = "Play Audio"
$audioCheckbox.Location = New-Object System.Drawing.Point(450, 400) 
$audioCheckbox.AutoSize = $true
$mainForm.Controls.Add($audioCheckbox)

$languageSelectionLabel = New-Object System.Windows.Forms.Label
$languageSelectionLabel.Text = "Language:"
$languageSelectionLabel.Location = New-Object System.Drawing.Point(450, 20)
$languageSelectionLabel.AutoSize = $true
$mainForm.Controls.Add($languageSelectionLabel)

$languageSelection = New-Object System.Windows.Forms.CheckedListBox
$languageSelection.Items.Add("English", $true)
$languageSelection.Items.Add("Polish", $true)
$languageSelection.Items.Add("German", $true)
$languageSelection.Location = New-Object System.Drawing.Point(450, 80)
$languageSelection.Width = 250
$languageSelection.Height = 150
$mainForm.Controls.Add($languageSelection)

$gongLabel = New-Object System.Windows.Forms.Label
$gongLabel.Text = "Gong:"
$gongLabel.Location = New-Object System.Drawing.Point(450, 220)
$gongLabel.AutoSize = $true
$mainForm.Controls.Add($gongLabel)

$gongButton = New-Object System.Windows.Forms.Button
$gongButton.Text = "Choose .wav"
$gongButton.Location = New-Object System.Drawing.Point(450, 270)
$gongButton.Width = 220
$gongButton.height = 50
$gongButton.Add_Click({
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.Filter = "WAV Files (*.wav)|*.wav"
    $openFileDialog.Title = "Select a WAV File"
    if ($openFileDialog.ShowDialog() -eq "OK") {
        $script:gong = $openFileDialog.FileName
    }
})
$mainForm.Controls.Add($gongButton)

$logConsole = New-Object System.Windows.Forms.TextBox
$logConsole.Location = New-Object System.Drawing.Point(10, 510)
$logConsole.Width = 690
$logConsole.Height = 80
$logConsole.Multiline = $true
$logConsole.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$logConsole.ReadOnly = $true
$mainForm.Controls.Add($logConsole)

# Timer für Auto-Update
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 30000 # 30 Sekunden
$timer.Add_Tick({
    if ($autoUpdateCheckbox.Checked) {
        if ($stationDropdown.SelectedItem) {
            $selectedStationName = $stationDropdown.SelectedItem
            $trainsResponse = Invoke-RestMethod -Uri "https://spythere.pl/api/getActiveTrainList"
            $relevantTrains = $trainsResponse | Where-Object { $_.currentStationName -eq $selectedStationName }
            $trainNumbers = $relevantTrains | ForEach-Object { $_.trainNo }
            $trainDropdown.Items.Clear()
            $trainDropdown.SelectedItem = $null
            if ($trainNumbers.Count -eq 0) {
                $trainDropdown.Items.Add("Kein Zug aktuell in dieser Station")
            } else {
                $trainDropdown.Items.AddRange($trainNumbers)
            }
        }
    }
})

$updateButton = New-Object System.Windows.Forms.Button
$updateButton.Text = "Update Trains"
$updateButton.Location = New-Object System.Drawing.Point(10, 440)
$updateButton.Width = 250
$updateButton.Height = 60
$updateButton.Add_Click({

    if ($stationDropdown.SelectedItem) {
        $selectedStationName = $stationDropdown.SelectedItem
        $trainsResponse = Invoke-RestMethod -Uri "https://spythere.pl/api/getActiveTrainList"
        $relevantTrains = $trainsResponse | Where-Object { $_.currentStationName -eq $selectedStationName }
        $trainNumbers = $relevantTrains | ForEach-Object { $_.trainNo }
        $trainDropdown.Items.Clear()
        $trainDropdown.SelectedItem = $null
        $trainDropdown.Items.AddRange($trainNumbers)
    }
})
$mainForm.Controls.Add($updateButton)

$generateButton = New-Object System.Windows.Forms.Button
$generateButton.Text = "Generate"
$generateButton.Location = New-Object System.Drawing.Point(450, 440)
$generateButton.Width = 250
$generateButton.Height = 60
$generateButton.Add_Click({
    if ($stationDropdown.SelectedItem -and $trainDropdown.SelectedItem -and $trackDropDown.SelectedItem) {
        $selectedStationName = $stationDropdown.SelectedItem
        $selectedTrainNo = $trainDropdown.SelectedItem

        $trainsResponse = Invoke-RestMethod -Uri "https://spythere.pl/api/getActiveTrainList"
        $selectedTrain = $trainsResponse | Where-Object { $_.trainNo -eq $selectedTrainNo }
        $stopDetails = ($selectedTrain.timetable.stopList | Where-Object { $_.stopNameRAW -like "*$selectedStationName" -and $_.mainStop -eq $True })
        if ($stopDetails -eq $null) {
            $mainStationName = ($selectedStationName -split ' ')
            $stopDetails = ($selectedTrain.timetable.stopList | Where-Object { $_.stopNameRAW -like "*$mainStationName" -and $_.mainStop -eq $True })
        }
        if ($stopDetails -eq $null) {
            $mainStationName = ($selectedStationName -split ' ')[-1]
            $stopDetails = ($selectedTrain.timetable.stopList | Where-Object { $_.stopNameRAW -like "*$mainStationName" -and $_.mainStop -eq $True })
        }

        #For Debugging
        #write-host "Stoplist:"
        #write-host $selectedTrain.timetable.stopList
        #write-host "Station Name: $selectedStationName"
        #write-host "Stop Type:"
        #write-host $stopDetails.stopType

        $startStation = $selectedTrain.timetable.stopList[0].stopNameRAW
        $endStation = $selectedTrain.timetable.stopList[-1].stopNameRAW

        if ($stopDetails.stopType -like "*ph*" -and $stopDetails.terminatesHere -eq $false) {

            $departureTime = Get-Date "1970-01-01 00:00:00Z"
            $departureTime = $departureTime.AddSeconds($stopDetails.departureTimestamp / 1000).AddHours(1)

            $arrivalTime = Get-Date "1970-01-01 00:00:00Z"
            $arrivalTime = $arrivalTime.AddSeconds($stopDetails.arrivalTimestamp / 1000).AddHours(1)
            
            if ($delayCheckbox.Checked -and $stopDetails.departureDelay -gt 5) {

                $delayMinutes = $stopDetails.departureDelay
                $announcementEN = "*STATION ANNOUNCEMENT* The $($categoriesNames[$selectedTrain.timetable.category]) from station $startStation to station $endStation, scheduled arrival $($arrivalTime.ToString('HH:mm')), will arrive approximately $delayMinutes minutes late at platform $($trackDropdown.SelectedItem). The delay is subject to change. Please pay attention to announcements."
                $announcementAEN = "The $($categoriesNames[$selectedTrain.timetable.category]) from station $startStation to station $endStation, scheduled arrival $($arrivalTime.ToString('HH:mm')), will arrive approximately $delayMinutes minutes late at platform $($trackDropdown.SelectedItem). The delay is subject to change. Please pay attention to announcements."
                $announcementDE = "*Bahnhofsdurchsage* Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation, geplante Ankunft $($arrivalTime.ToString('HH:mm')), wird voraussichtlich mit einer Verspätung von $delayMinutes Minuten auf Gleis $($trackDropdown.SelectedItem) eintreffen. Die Verspätung kann sich noch verändern. Bitte beachten Sie die Ansagen."
                $announcementADE = "Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation, geplante Ankunft $($arrivalTime.ToString('HH:mm')), wird voraussichtlich mit einer Verspätung von $delayMinutes Minuten auf Gleis $($trackDropdown.SelectedItem) eintreffen. Die Verspätung kann sich noch verändern. Bitte beachten Sie die Ansagen."
                $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor $($trackDropdown.SelectedItem), planowy przyjazd $($arrivalTime.ToString('HH:mm')), przyjedzie z opóźnieniem około $delayMinutes minut. Opóźnienie może ulec zmianie. Prosimy o zwracanie uwagi na komunikaty."
                $announcementAPL = "Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor $($trackDropdown.SelectedItem), planowy przyjazd $($arrivalTime.ToString('HH:mm')), przyjedzie z opóźnieniem około $delayMinutes minut. Opóźnienie może ulec zmianie. Prosimy o zwracanie uwagi na komunikaty."
                AddToLog "Generating announcement."
                GenerateAndDisplayAnnouncement -announcementEN $announcementEN -announcementPL $announcementPL -announcementDE $announcementDE
                
                return
            }
            else {
        
                $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), The $($categoriesNames[$selectedTrain.timetable.category]) from $startStation to $endStation is arriving. The planned Departure is $($departureTime.ToString('HH:mm'))."
                $announcementAEN = "Attention at track $($trackDropdown.SelectedItem), The $($categoriesNames[$selectedTrain.timetable.category]) from $startStation to $endStation is arriving. The planned Departure is $($departureTime.ToString('HH:mm'))."
                $announcementDE = "*Bahnhofsdurchsage* Achtung am Gleis $($trackDropdown.SelectedItem), Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation fährt ein. Die planmässige Abfahrt ist um $($departureTime.ToString('HH:mm'))."
                $announcementADE = "Achtung am Gleis $($trackDropdown.SelectedItem), Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation fährt ein. Die planmässige Abfahrt ist um $($departureTime.ToString('HH:mm'))."
                $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor $($trackDropdown.SelectedItem), Planowy odjazd pociągu o godzinie $($departureTime.ToString('HH:mm'))."
                $announcementAPL = "Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor $($trackDropdown.SelectedItem), Planowy odjazd pociągu o godzinie $($departureTime.ToString('HH:mm'))."
                AddToLog "Generating announcement."
                GenerateAndDisplayAnnouncement -announcementEN $announcementEN -announcementPL $announcementPL -announcementDE $announcementDE
                
                return

            }
        } 
        if ($stopDetails.terminatesHere -eq $true) {
           
            $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), the $($categoriesNames[$selectedTrain.timetable.category]) from $startStation is arriving. This train ends here, please do not board the train."
            $announcementAEN = "Attention at track $($trackDropdown.SelectedItem), the $($categoriesNames[$selectedTrain.timetable.category]) from $startStation is arriving. This train ends here, please do not board the train."
            $announcementDE = "*Bahnhofsdurchsage* Achtung am Gleis $($trackDropdown.SelectedItem), der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation fährt ein. Dieser Zug endet hier, bitte nicht einsteigen."
            $announcementADE = "Achtung am Gleis $($trackDropdown.SelectedItem), der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation fährt ein. Dieser Zug endet hier, bitte nicht einsteigen."
            $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga na tor $($trackDropdown.SelectedItem), przyjedzie Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation. Pociąg kończy bieg. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."
            $announcementAPL = "Uwaga na tor $($trackDropdown.SelectedItem), przyjedzie Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation. Pociąg kończy bieg. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."

        }
        else {

             $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), A train is passing through. Please stand back."
             $announcementAEN = "Attention at track $($trackDropdown.SelectedItem), A train is passing through. Please stand back."
             $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Na tor $($trackDropdown.SelectedItem) wjedzie pociąg bez zatrzymania. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."
             $announcementAPL = "Uwaga! Na tor $($trackDropdown.SelectedItem) wjedzie pociąg bez zatrzymania. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."
             $announcementDE = "*Bahnhofsdurchsage* Achtung am Gleis $($trackDropdown.SelectedItem), Zugdurchfahrt. Zurückbleiben bitte."
             $announcementADE = "Achtung am Gleis $($trackDropdown.SelectedItem), Zugdurchfahrt. Zurückbleiben bitte."
             
                
        }
        AddToLog "Generating announcement."
        GenerateAndDisplayAnnouncement -announcementEN $announcementEN -announcementPL $announcementPL -announcementDE $announcementDE

    } 
    else {
        [System.Windows.Forms.MessageBox]::Show("Please select all: a station, track and train.")
    }

})

function AddToLog {
    param (
        [Parameter(Mandatory=$true)]
        [string]$message
    )
    $logConsole.AppendText("$(Get-Date -Format "HH:mm:ss"): $message`r`n")
}

function ConvertTimeForAudio {
    param (
        [DateTime]$time
    )

    $hours = $time.Hour
    $minutes = $time.Minute

    return "$hours Uhr $minutes "
}

function Get-WavDuration {
    param (
        [string]$wavPath
    )

    $fileStream = [System.IO.File]::OpenRead($wavPath)
    $binaryReader = New-Object System.IO.BinaryReader($fileStream)

    # Skip the first 22 bytes of the WAV header
    $binaryReader.BaseStream.Position = 22

    # Read the number of channels (2 bytes)
    $channels = $binaryReader.ReadUInt16()

    # Read the sample rate (4 bytes)
    $sampleRate = $binaryReader.ReadUInt32()

    # Skip the next 6 bytes
    $binaryReader.BaseStream.Position += 6

    # Read the block align (2 bytes)
    $blockAlign = $binaryReader.ReadUInt16()

    # Skip to byte 40 to get the data size (4 bytes)
    $binaryReader.BaseStream.Position = 40
    $dataSize = $binaryReader.ReadUInt32()

    $binaryReader.Close()
    $fileStream.Close()

    # Calculate the duration in seconds
    $durationInSeconds = $dataSize / ($sampleRate * $channels * $blockAlign / 8)

    AddToLog "WAF Duration: $durationInSeconds"
    return $durationInSeconds
}

function ConvertTextToSpeech {
    param (
        [Parameter(Mandatory=$true)]
        [string]$text,
        [Parameter(Mandatory=$true)]
        [string]$language
    )
    AddToLog "Text for Audio: $text"
    if ($language -eq "German" -and $text -match '(\d{2}:\d{2})') {
        $text = $text -replace '(\d{2}:\d{2})', (ConvertTimeForAudio -time (Get-Date $matches[1]))
        AddToLog "Text for German Audio after Time Update: $text"
    }
    # Header für die Anfrage
    $headers = @{
        "Ocp-Apim-Subscription-Key" = $apiKey
        "Content-Type" = "application/ssml+xml"
        "X-Microsoft-OutputFormat" = "riff-16khz-16bit-mono-pcm"
        "User-Agent" = "PowerShell"
    }

    # SSML-Body für die Anfrage basierend auf der gewählten Sprache
    switch ($language) {
        "English" {
            $voiceName = "en-US-JessaNeural"
            $lang = "en-US"
        }
        "Polish" {
            $voiceName = "pl-PL-AgnieszkaNeural"
            $lang = "pl-PL"
        }
        "German" {
            $voiceName = "de-DE-KatjaNeural"
            $lang = "de-DE"
        }
    }

    $bodyString = @"
<speak version='1.0' xml:lang='$lang'>
    <voice xml:lang='$lang' xml:gender='Female' name='$voiceName'>
        $text
    </voice>
</speak>
"@

    $bodyBytes = [System.Text.Encoding]::UTF8.GetBytes($bodyString)
    $response = Invoke-WebRequest -Uri $ttsUrl -Method Post -Headers $headers -Body $bodyBytes
    [System.IO.File]::WriteAllBytes($filename, $response.Content)

    $Song = New-Object System.Media.SoundPlayer
    $Song.SoundLocation = $filename
    $Song.Play()
    $timeout = Get-WavDuration -wavPath $filename
    Start-Sleep -Seconds $timeout
}

function GenerateAndDisplayAnnouncement {
    param (
        [string]$announcementEN,
        [string]$announcementPL,
        [string]$announcementDE
    )

    $combinedAnnouncement = ""
    $Song = New-Object System.Media.SoundPlayer
    if ($script:gong -and $audioCheckbox.Checked) {
        AddToLog "WAF selected, playing Gong."
        $Song.SoundLocation = $gong
        $Song.Play()
        $timeout = Get-WavDuration -wavPath $gong
        Start-Sleep -Seconds $timeout
    }

    if ($languageSelection.GetItemChecked(0)) { 
        $combinedAnnouncement += "$announcementEN "
        if ($audioCheckbox.Checked) {
            AddToLog "Generating Audio announcement."
            ConvertTextToSpeech -text $announcementAEN -language "English"
        }
    }
    if ($languageSelection.GetItemChecked(1)) { 
        $combinedAnnouncement += "$announcementPL "
        if ($audioCheckbox.Checked) {
            AddToLog "Generating Audio announcement."
            ConvertTextToSpeech -text $announcementAPL -language "Polish"
        }
    }
    if ($languageSelection.GetItemChecked(2)) {  # Überprüfen, ob "Deutsch" ausgewählt ist
        $combinedAnnouncement += "$announcementDE "
        if ($audioCheckbox.Checked) {
            AddToLog "Generating Audio announcement."
            ConvertTextToSpeech -text $announcementADE -language "German"
        }
    }

    $combinedAnnouncement | Set-Clipboard
    [System.Windows.Forms.MessageBox]::Show("The following text has been copied to your clipboard:`n`n$combinedAnnouncement")
    AddToLog "Job complete"
}

$timer.Start()
$mainForm.Controls.Add($generateButton)
$mainForm.ShowDialog()