Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$fontFactor = 2
$defaultFont = [System.Windows.Forms.Control]::DefaultFont
$newFont = New-Object System.Drawing.Font($defaultFont.FontFamily, ($defaultFont.Size * $fontFactor))

# Hashtable for the categories
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

$mainForm = New-Object System.Windows.Forms.Form
$mainForm.Text = "Announcement Generator"
$mainForm.Width = 750
$mainForm.Height = 600
$mainForm.Font = $newFont

$trackLabel = New-Object System.Windows.Forms.Label
$trackLabel.Text = "Track:"
$trackLabel.Location = New-Object System.Drawing.Point(10, 140)
$trackLabel.AutoSize = $true
$mainForm.Controls.Add($trackLabel)

$trackDropdown = New-Object System.Windows.Forms.ComboBox
$trackDropdown.Location = New-Object System.Drawing.Point(10, 200)
$trackDropdown.Width = 400
1..600 | ForEach-Object { $trackDropdown.Items.Add($_) }
$mainForm.Controls.Add($trackDropdown)

$checkBox = New-Object System.Windows.Forms.CheckBox
$checkBox.Text = "Is ending"
$checkBox.Location = New-Object System.Drawing.Point(10, 250)
$checkBox.Width = 200
$checkBox.height = 40
$mainForm.Controls.Add($checkBox)

$passingThroughCheckBox = New-Object System.Windows.Forms.CheckBox
$passingThroughCheckBox.Text = "passing through"
$passingThroughCheckBox.Location = New-Object System.Drawing.Point(10, 300)
$passingThroughCheckBox.Width = 300
$passingThroughCheckBox.height = 40
$mainForm.Controls.Add($passingThroughCheckBox)

$trainLabel = New-Object System.Windows.Forms.Label
$trainLabel.Text = "Train:"
$trainLabel.Location = New-Object System.Drawing.Point(10, 350)
$trainLabel.AutoSize = $true
$mainForm.Controls.Add($trainLabel)

# Dropdown für die Zugauswahl
$trainDropdown = New-Object System.Windows.Forms.ComboBox
$trainDropdown.Location = New-Object System.Drawing.Point(10, 400)
$trainDropdown.Width = 400
$mainForm.Controls.Add($trainDropdown)

# Neues Label für die Bahnhofsauswahl
$stationLabel = New-Object System.Windows.Forms.Label
$stationLabel.Text = "Station:"
$stationLabel.Location = New-Object System.Drawing.Point(10, 20)
$stationLabel.AutoSize = $true
$mainForm.Controls.Add($stationLabel)

# Dropdown für die Bahnhofsauswahl
$stationDropdown = New-Object System.Windows.Forms.ComboBox
$stationDropdown.Location = New-Object System.Drawing.Point(10, 80)
$stationDropdown.Width = 400
$mainForm.Controls.Add($stationDropdown)

$response = Invoke-RestMethod -Uri "https://spythere.pl/api/getSceneries"
$stationNames = $response | ForEach-Object { $_.Name } | Sort-Object
$stationDropdown.Items.AddRange($stationNames)

# Button zum Aktualisieren der Stationen und Züge
$updateButton = New-Object System.Windows.Forms.Button
$updateButton.Text = "Update Trains"
$updateButton.Location = New-Object System.Drawing.Point(450, 320)
$updateButton.Width = 250
$updateButton.Height = 60
$updateButton.Add_Click({
    # Aktualisieren der Stationsliste
    $response = Invoke-RestMethod -Uri "https://spythere.pl/api/getSceneries"
    $stationNames = $response | ForEach-Object { $_.Name } | Sort-Object
    $selectedStation = $stationDropdown.SelectedItem
    $stationDropdown.Items.Clear()
    $stationDropdown.Items.AddRange($stationNames)
    if ($stationNames -contains $selectedStation) {
        $stationDropdown.SelectedItem = $selectedStation
    }

    # Aktualisieren der Zugliste, wenn eine Station ausgewählt wurde
    if ($stationDropdown.SelectedItem) {
        $selectedStationName = $stationDropdown.SelectedItem
        $trainsResponse = Invoke-RestMethod -Uri "https://spythere.pl/api/getActiveTrainList"
        $relevantTrains = $trainsResponse | Where-Object { $_.currentStationName -eq $selectedStationName }
        $trainNumbers = $relevantTrains | ForEach-Object { $_.trainNo }
        $trainDropdown.Items.Clear()
        $trainDropdown.Items.AddRange($trainNumbers)
    }
})
$mainForm.Controls.Add($updateButton)

$generateButton = New-Object System.Windows.Forms.Button
$generateButton.Text = "Generate"
$generateButton.Location = New-Object System.Drawing.Point(450, 390)
$generateButton.Width = 250
$generateButton.Height = 60
$generateButton.Add_Click({
    if ($stationDropdown.SelectedItem -and $trainDropdown.SelectedItem) {
        $selectedStationName = $stationDropdown.SelectedItem
        $selectedTrainNo = $trainDropdown.SelectedItem

        $trainsResponse = Invoke-RestMethod -Uri "https://spythere.pl/api/getActiveTrainList"
        $selectedTrain = $trainsResponse | Where-Object { $_.trainNo -eq $selectedTrainNo }
        $stopDetails = ($selectedTrain.timetable.stopList | Where-Object { $_.stopNameRAW -eq $selectedStationName })

        if ($stopDetails.stopType -like "*ph*") {
            $departureTime = Get-Date "1970-01-01 00:00:00Z"
            Write-Host "Timestamp: $($stopDetails.departureTimestamp)"

            $departureTime = $departureTime.AddSeconds($stopDetails.departureTimestamp / 1000).AddHours(1)

             $startStation = $selectedTrain.timetable.stopList[0].stopNameRAW
             $endStation = $selectedTrain.timetable.stopList[-1].stopNameRAW

            # Erstellen Sie die Ankündigung mit den extrahierten Daten
            $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), The Train from $startStation to $endStation is arriving. The planned Departure is $($departureTime.ToString('HH:mm'))."

        } else {
            $announcement = "Dieser Zug fährt nur durch die Station $selectedStationName."
        }
        [System.Windows.Forms.MessageBox]::Show($announcement)
    } else {
        [System.Windows.Forms.MessageBox]::Show("Bitte wählen Sie sowohl eine Station als auch einen Zug aus.")
    }

})
$mainForm.Controls.Add($generateButton)
$mainForm.ShowDialog()