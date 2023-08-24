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

$categoriesLabel = New-Object System.Windows.Forms.Label
$categoriesLabel.Text = "Train Type:"
$categoriesLabel.Location = New-Object System.Drawing.Point(10, 20)
$categoriesLabel.AutoSize = $true
$mainForm.Controls.Add($categoriesLabel)

$categoriesDropdown = New-Object System.Windows.Forms.ComboBox
$categoriesDropdown.Location = New-Object System.Drawing.Point(10, 80)
$categoriesDropdown.Width = 400
$categories = @('APM','EIE','EIJ','EIS','MPJ','MPE','MPS','RPE','RPJ','RPS','ROE','ROJ','ROS','RPM')
$categoriesDropdown.Items.AddRange($categories)
$mainForm.Controls.Add($categoriesDropdown)

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

$startLabel = New-Object System.Windows.Forms.Label
$startLabel.Text = "Start:"
$startLabel.Location = New-Object System.Drawing.Point(10, 350)
$startLabel.AutoSize = $true
$mainForm.Controls.Add($startLabel)

$startTextbox = New-Object System.Windows.Forms.TextBox
$startTextbox.Location = New-Object System.Drawing.Point(10, 400)
$startTextbox.Width = 400
$mainForm.Controls.Add($startTextbox)

$destinationLabel = New-Object System.Windows.Forms.Label
$destinationLabel.Text = "Destination:"
$destinationLabel.Location = New-Object System.Drawing.Point(10, 450)
$destinationLabel.AutoSize = $true
$mainForm.Controls.Add($destinationLabel)

$destinationTextbox = New-Object System.Windows.Forms.TextBox
$destinationTextbox.Location = New-Object System.Drawing.Point(10, 500)
$destinationTextbox.Width = 400
$mainForm.Controls.Add($destinationTextbox)

$timeLabel = New-Object System.Windows.Forms.Label
$timeLabel.Text = "Departure:"
$timeLabel.Location = New-Object System.Drawing.Point(450, 20)
$timeLabel.AutoSize = $true
$mainForm.Controls.Add($timeLabel)

$timeTextbox = New-Object System.Windows.Forms.TextBox
$timeTextbox.Location = New-Object System.Drawing.Point(450, 80)
$timeTextbox.Width = 200
$mainForm.Controls.Add($timeTextbox)

# Neues Label für die Bahnhofsauswahl
$stationLabel = New-Object System.Windows.Forms.Label
$stationLabel.Text = "Station:"
$stationLabel.Location = New-Object System.Drawing.Point(450, 140)
$stationLabel.AutoSize = $true
$mainForm.Controls.Add($stationLabel)

# Dropdown für die Bahnhofsauswahl
$stationDropdown = New-Object System.Windows.Forms.ComboBox
$stationDropdown.Location = New-Object System.Drawing.Point(450, 200)
$stationDropdown.Width = 400
$mainForm.Controls.Add($stationDropdown)

$response = Invoke-RestMethod -Uri "https://spythere.pl/api/getSceneries"
$stationNames = $response | ForEach-Object { $_.Name } | Sort-Object
$stationDropdown.Items.AddRange($stationNames)


# Dropdown für die Zugauswahl
$trainDropdown = New-Object System.Windows.Forms.ComboBox
$trainDropdown.Location = New-Object System.Drawing.Point(450, 260)
$trainDropdown.Width = 400
$mainForm.Controls.Add($trainDropdown)

# Button zum Aktualisieren der Stationen und Züge
$updateButton = New-Object System.Windows.Forms.Button
$updateButton.Text = "Update Stations & Trains"
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
        $stopDetails = ($selectedTrain.timetable.stopList | Where-Object { $_.stopNameRAW -eq $selectedStationName })[0]

        if ($stopDetails.stopType -like "*ph*") {
            $departureTime = Get-Date "1970-01-01 00:00:00Z"
            Write-Host "Timestamp: $($stopDetails.departureTimestamp)"

            $departureTime = $departureTime.AddSeconds($stopDetails.departureTimestamp / 1000).AddHours(2)

            $announcement = "Der Zug hält in der Station $selectedStationName. Die geplante Abfahrtszeit ist $($departureTime.ToString('HH:mm'))."
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
