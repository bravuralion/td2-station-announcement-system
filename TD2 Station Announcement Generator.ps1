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

$generateButton = New-Object System.Windows.Forms.Button
$generateButton.Text = "Generate"
$generateButton.Location = New-Object System.Drawing.Point(450, 220)
$generateButton.Width = 250
$generateButton.Height = 60
$generateButton.Add_Click({
    if ($checkBox.Checked) {
        $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), the $($categoriesNames[$categoriesDropdown.SelectedItem]) from $($startTextbox.Text) is arriving. This train ends here, please do not board."
        $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga na tor $($trackDropdown.SelectedItem), przyjedzie Pociąg $($categoriesNames[$categoriesDropdown.SelectedItem]) ze stacji $($startTextbox.Text). Pociąg kończy bieg. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu"
    } elseif ($passingThroughCheckBox.Checked) {
        $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), A train is passing through. Please stand back."
        $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Na tor $($trackDropdown.SelectedItem) wjedzie pociąg bez zatrzymania. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."
    } else {
        $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), The $($categoriesNames[$categoriesDropdown.SelectedItem]) from $($startTextbox.Text) to $($destinationTextbox.Text) is arriving. The planned Departure is $($timeTextbox.Text)."
        $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Pociąg $($categoriesNames[$categoriesDropdown.SelectedItem]) ze stacji $($startTextbox.Text) do stacji $($destinationTextbox.Text) wjedzie na tor $($trackDropdown.SelectedItem), Planowy odjazd pociągu o godzinie $($timeTextbox.Text)."
    }
    $combinedAnnouncement = "$announcementEN`r`n$announcementPL"
    $combinedAnnouncement | Set-Clipboard
    [System.Windows.Forms.MessageBox]::Show("Announcement copied to clipboard!")
})

$mainForm.Controls.Add($generateButton)
$mainForm.ShowDialog()
