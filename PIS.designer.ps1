[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$PIS = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$trackLabel = $null
[System.ComponentModel.BackgroundWorker]$backgroundWorker1 = $null
[System.Windows.Forms.ComboBox]$trackDropdown = $null
[System.Windows.Forms.Label]$trainLabel = $null
[System.Windows.Forms.ComboBox]$trainDropdown = $null
[System.Windows.Forms.Label]$stationLabel = $null
[System.Windows.Forms.CheckBox]$autoUpdateCheckbox = $null
[System.Windows.Forms.CheckBox]$delayCheckbox = $null
[System.Windows.Forms.Label]$languageSelectionLabel = $null
[System.Windows.Forms.CheckedListBox]$languageSelection = $null
[System.Windows.Forms.GroupBox]$SettingsGroupBox = $null
[System.Windows.Forms.GroupBox]$TrainPassinggroupBox1 = $null
[System.Windows.Forms.Button]$TrainPassTrack1Button = $null
[System.Windows.Forms.ComboBox]$stationDropdown = $null
[System.Windows.Forms.Button]$gongButton = $null
[System.Windows.Forms.Button]$generateButton = $null
[System.Windows.Forms.TextBox]$logConsole = $null
[System.Windows.Forms.Button]$updateButton = $null
[System.Windows.Forms.Button]$TrainPassTrack10Button = $null
[System.Windows.Forms.Button]$TrainPassTrack9Button = $null
[System.Windows.Forms.Button]$TrainPassTrack8Button = $null
[System.Windows.Forms.Button]$TrainPassTrack7Button = $null
[System.Windows.Forms.Button]$TrainPassTrack6Button = $null
[System.Windows.Forms.Button]$TrainPassTrack5Button = $null
[System.Windows.Forms.Button]$TrainPassTrack4Button = $null
[System.Windows.Forms.Button]$TrainPassTrack3Button = $null
[System.Windows.Forms.Button]$TrainPassTrack2Button = $null
[System.Windows.Forms.CheckBox]$audioCheckbox = $null
function InitializeComponent
{
$trackLabel = (New-Object -TypeName System.Windows.Forms.Label)
$backgroundWorker1 = (New-Object -TypeName System.ComponentModel.BackgroundWorker)
$trackDropdown = (New-Object -TypeName System.Windows.Forms.ComboBox)
$trainLabel = (New-Object -TypeName System.Windows.Forms.Label)
$trainDropdown = (New-Object -TypeName System.Windows.Forms.ComboBox)
$stationDropdown = (New-Object -TypeName System.Windows.Forms.ComboBox)
$stationLabel = (New-Object -TypeName System.Windows.Forms.Label)
$autoUpdateCheckbox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$delayCheckbox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$audioCheckbox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$languageSelectionLabel = (New-Object -TypeName System.Windows.Forms.Label)
$languageSelection = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$SettingsGroupBox = (New-Object -TypeName System.Windows.Forms.GroupBox)
$gongButton = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassinggroupBox1 = (New-Object -TypeName System.Windows.Forms.GroupBox)
$TrainPassTrack10Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack9Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack8Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack7Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack6Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack5Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack4Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack3Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack2Button = (New-Object -TypeName System.Windows.Forms.Button)
$TrainPassTrack1Button = (New-Object -TypeName System.Windows.Forms.Button)
$generateButton = (New-Object -TypeName System.Windows.Forms.Button)
$logConsole = (New-Object -TypeName System.Windows.Forms.TextBox)
$updateButton = (New-Object -TypeName System.Windows.Forms.Button)
$SettingsGroupBox.SuspendLayout()
$TrainPassinggroupBox1.SuspendLayout()
$PIS.SuspendLayout()
#
#trackLabel
#
$trackLabel.AutoSize = $true
$trackLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]103))
$trackLabel.Name = [System.String]'trackLabel'
$trackLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]35,[System.Int32]13))
$trackLabel.TabIndex = [System.Int32]0
$trackLabel.Text = [System.String]'Track'
#
#trackDropdown
#
$trackDropdown.FormattingEnabled = $true
$trackDropdown.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]122))
$trackDropdown.Name = [System.String]'trackDropdown'
$trackDropdown.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]162,[System.Int32]21))
$trackDropdown.TabIndex = [System.Int32]1
#
#trainLabel
#
$trainLabel.AutoSize = $true
$trainLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]57))
$trainLabel.Name = [System.String]'trainLabel'
$trainLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]31,[System.Int32]13))
$trainLabel.TabIndex = [System.Int32]2
$trainLabel.Text = [System.String]'Train'
#
#trainDropdown
#
$trainDropdown.FormattingEnabled = $true
$trainDropdown.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]76))
$trainDropdown.Name = [System.String]'trainDropdown'
$trainDropdown.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]162,[System.Int32]21))
$trainDropdown.TabIndex = [System.Int32]3
#
#stationDropdown
#
$stationDropdown.FormattingEnabled = $true
$stationDropdown.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]29))
$stationDropdown.Name = [System.String]'stationDropdown'
$stationDropdown.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]162,[System.Int32]21))
$stationDropdown.TabIndex = [System.Int32]5
#
#stationLabel
#
$stationLabel.AutoSize = $true
$stationLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]10))
$stationLabel.Name = [System.String]'stationLabel'
$stationLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]40,[System.Int32]13))
$stationLabel.TabIndex = [System.Int32]4
$stationLabel.Text = [System.String]'Station'
#
#autoUpdateCheckbox
#
$autoUpdateCheckbox.AutoSize = $true
$autoUpdateCheckbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]17))
$autoUpdateCheckbox.Name = [System.String]'autoUpdateCheckbox'
$autoUpdateCheckbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]86,[System.Int32]17))
$autoUpdateCheckbox.TabIndex = [System.Int32]6
$autoUpdateCheckbox.Text = [System.String]'Auto Update'
$autoUpdateCheckbox.UseVisualStyleBackColor = $true
#
#delayCheckbox
#
$delayCheckbox.AutoSize = $true
$delayCheckbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]40))
$delayCheckbox.Name = [System.String]'delayCheckbox'
$delayCheckbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]110,[System.Int32]17))
$delayCheckbox.TabIndex = [System.Int32]7
$delayCheckbox.Text = [System.String]'Announce Delays'
$delayCheckbox.UseVisualStyleBackColor = $true
#
#audioCheckbox
#
$audioCheckbox.AutoSize = $true
$audioCheckbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]63))
$audioCheckbox.Name = [System.String]'audioCheckbox'
$audioCheckbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]76,[System.Int32]17))
$audioCheckbox.TabIndex = [System.Int32]8
$audioCheckbox.Text = [System.String]'Play Audio'
$audioCheckbox.UseVisualStyleBackColor = $true
$audioCheckbox.add_CheckedChanged($audioCheckbox_CheckedChanged)
#
#languageSelectionLabel
#
$languageSelectionLabel.AutoSize = $true
$languageSelectionLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]189,[System.Int32]10))
$languageSelectionLabel.Name = [System.String]'languageSelectionLabel'
$languageSelectionLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]150,[System.Int32]13))
$languageSelectionLabel.TabIndex = [System.Int32]9
$languageSelectionLabel.Text = [System.String]'Language for Announcements'
#
#languageSelection
#
$languageSelection.FormattingEnabled = $true
$languageSelection.Items.AddRange([System.Object[]]@([System.String]'English',[System.String]'Polish',[System.String]'German'))
$languageSelection.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]192,[System.Int32]29))
$languageSelection.Name = [System.String]'languageSelection'
$languageSelection.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]49))
$languageSelection.TabIndex = [System.Int32]10
#
#SettingsGroupBox
#
$SettingsGroupBox.Controls.Add($gongButton)
$SettingsGroupBox.Controls.Add($delayCheckbox)
$SettingsGroupBox.Controls.Add($autoUpdateCheckbox)
$SettingsGroupBox.Controls.Add($audioCheckbox)
$SettingsGroupBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]381,[System.Int32]10))
$SettingsGroupBox.Name = [System.String]'SettingsGroupBox'
$SettingsGroupBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]177,[System.Int32]121))
$SettingsGroupBox.TabIndex = [System.Int32]11
$SettingsGroupBox.TabStop = $false
$SettingsGroupBox.Text = [System.String]'Settings'
#
#gongButton
#
$gongButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]86))
$gongButton.Name = [System.String]'gongButton'
$gongButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]110,[System.Int32]23))
$gongButton.TabIndex = [System.Int32]13
$gongButton.Text = [System.String]'Station Gong'
$gongButton.UseVisualStyleBackColor = $true
$gongButton.add_Click($gongButton_Click)
#
#TrainPassinggroupBox1
#
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack10Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack9Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack8Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack7Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack6Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack5Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack4Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack3Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack2Button)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack1Button)
$TrainPassinggroupBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]381,[System.Int32]166))
$TrainPassinggroupBox1.Name = [System.String]'TrainPassinggroupBox1'
$TrainPassinggroupBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]177,[System.Int32]79))
$TrainPassinggroupBox1.TabIndex = [System.Int32]12
$TrainPassinggroupBox1.TabStop = $false
$TrainPassinggroupBox1.Text = [System.String]'Train Passing at'
#
#TrainPassTrack10Button
#
$TrainPassTrack10Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]142,[System.Int32]49))
$TrainPassTrack10Button.Name = [System.String]'TrainPassTrack10Button'
$TrainPassTrack10Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack10Button.TabIndex = [System.Int32]22
$TrainPassTrack10Button.Text = [System.String]'10'
$TrainPassTrack10Button.UseVisualStyleBackColor = $true
$TrainPassTrack10Button.add_Click($TrainPassTrack10Button_Click)
#
#TrainPassTrack9Button
#
$TrainPassTrack9Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]49))
$TrainPassTrack9Button.Name = [System.String]'TrainPassTrack9Button'
$TrainPassTrack9Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack9Button.TabIndex = [System.Int32]21
$TrainPassTrack9Button.Text = [System.String]'9'
$TrainPassTrack9Button.UseVisualStyleBackColor = $true
$TrainPassTrack9Button.add_Click($TrainPassTrack9Button_Click)
#
#TrainPassTrack8Button
#
$TrainPassTrack8Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]74,[System.Int32]49))
$TrainPassTrack8Button.Name = [System.String]'TrainPassTrack8Button'
$TrainPassTrack8Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack8Button.TabIndex = [System.Int32]20
$TrainPassTrack8Button.Text = [System.String]'8'
$TrainPassTrack8Button.UseVisualStyleBackColor = $true
$TrainPassTrack8Button.add_Click($TrainPassTrack8Button_Click)
#
#TrainPassTrack7Button
#
$TrainPassTrack7Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]40,[System.Int32]49))
$TrainPassTrack7Button.Name = [System.String]'TrainPassTrack7Button'
$TrainPassTrack7Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack7Button.TabIndex = [System.Int32]19
$TrainPassTrack7Button.Text = [System.String]'7'
$TrainPassTrack7Button.UseVisualStyleBackColor = $true
$TrainPassTrack7Button.add_Click($TrainPassTrack7Button_Click)
#
#TrainPassTrack6Button
#
$TrainPassTrack6Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]49))
$TrainPassTrack6Button.Name = [System.String]'TrainPassTrack6Button'
$TrainPassTrack6Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack6Button.TabIndex = [System.Int32]18
$TrainPassTrack6Button.Text = [System.String]'6'
$TrainPassTrack6Button.UseVisualStyleBackColor = $true
$TrainPassTrack6Button.add_Click($TrainPassTrack6Button_Click)
#
#TrainPassTrack5Button
#
$TrainPassTrack5Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]142,[System.Int32]19))
$TrainPassTrack5Button.Name = [System.String]'TrainPassTrack5Button'
$TrainPassTrack5Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack5Button.TabIndex = [System.Int32]17
$TrainPassTrack5Button.Text = [System.String]'5'
$TrainPassTrack5Button.UseVisualStyleBackColor = $true
$TrainPassTrack5Button.add_Click($TrainPassTrack5Button_Click)
#
#TrainPassTrack4Button
#
$TrainPassTrack4Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]19))
$TrainPassTrack4Button.Name = [System.String]'TrainPassTrack4Button'
$TrainPassTrack4Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack4Button.TabIndex = [System.Int32]16
$TrainPassTrack4Button.Text = [System.String]'4'
$TrainPassTrack4Button.UseVisualStyleBackColor = $true
$TrainPassTrack4Button.add_Click($TrainPassTrack4Button_Click)
#
#TrainPassTrack3Button
#
$TrainPassTrack3Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]74,[System.Int32]19))
$TrainPassTrack3Button.Name = [System.String]'TrainPassTrack3Button'
$TrainPassTrack3Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack3Button.TabIndex = [System.Int32]15
$TrainPassTrack3Button.Text = [System.String]'3'
$TrainPassTrack3Button.UseVisualStyleBackColor = $true
$TrainPassTrack3Button.add_Click($TrainPassTrack3Button_Click)
#
#TrainPassTrack2Button
#
$TrainPassTrack2Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]40,[System.Int32]19))
$TrainPassTrack2Button.Name = [System.String]'TrainPassTrack2Button'
$TrainPassTrack2Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack2Button.TabIndex = [System.Int32]14
$TrainPassTrack2Button.Text = [System.String]'2'
$TrainPassTrack2Button.UseVisualStyleBackColor = $true
$TrainPassTrack2Button.add_Click($TrainPassTrack2Button_Click)
#
#TrainPassTrack1Button
#
$TrainPassTrack1Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]19))
$TrainPassTrack1Button.Name = [System.String]'TrainPassTrack1Button'
$TrainPassTrack1Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack1Button.TabIndex = [System.Int32]13
$TrainPassTrack1Button.Text = [System.String]'1'
$TrainPassTrack1Button.UseVisualStyleBackColor = $true
$TrainPassTrack1Button.add_Click($TrainPassTrack1Button_Click)
#
#generateButton
#
$generateButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]192,[System.Int32]122))
$generateButton.Name = [System.String]'generateButton'
$generateButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]23))
$generateButton.TabIndex = [System.Int32]13
$generateButton.Text = [System.String]'Generate Announcement'
$generateButton.UseVisualStyleBackColor = $true
$generateButton.add_Click($generateButton_Click)
#
#logConsole
#
$logConsole.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]166))
$logConsole.Multiline = $true
$logConsole.Name = [System.String]'logConsole'
$logConsole.ReadOnly = $true
$logConsole.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$logConsole.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]363,[System.Int32]79))
$logConsole.TabIndex = [System.Int32]14
#
#updateButton
#
$updateButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]192,[System.Int32]93))
$updateButton.Name = [System.String]'updateButton'
$updateButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]147,[System.Int32]23))
$updateButton.TabIndex = [System.Int32]15
$updateButton.Text = [System.String]'Update Trains'
$updateButton.UseVisualStyleBackColor = $true
$updateButton.add_Click($updateButton_Click)
#
#PIS
#
$PIS.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]570,[System.Int32]257))
$PIS.Controls.Add($updateButton)
$PIS.Controls.Add($logConsole)
$PIS.Controls.Add($generateButton)
$PIS.Controls.Add($TrainPassinggroupBox1)
$PIS.Controls.Add($SettingsGroupBox)
$PIS.Controls.Add($languageSelection)
$PIS.Controls.Add($languageSelectionLabel)
$PIS.Controls.Add($stationDropdown)
$PIS.Controls.Add($stationLabel)
$PIS.Controls.Add($trainDropdown)
$PIS.Controls.Add($trainLabel)
$PIS.Controls.Add($trackDropdown)
$PIS.Controls.Add($trackLabel)
$PIS.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedSingle
$PIS.Name = [System.String]'PIS'
$PIS.Text = [System.String]'TD2 Station Announcement Tool'
$SettingsGroupBox.ResumeLayout($false)
$SettingsGroupBox.PerformLayout()
$TrainPassinggroupBox1.ResumeLayout($false)
$PIS.ResumeLayout($false)
$PIS.PerformLayout()
Add-Member -InputObject $PIS -Name trackLabel -Value $trackLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name backgroundWorker1 -Value $backgroundWorker1 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name trackDropdown -Value $trackDropdown -MemberType NoteProperty
Add-Member -InputObject $PIS -Name trainLabel -Value $trainLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name trainDropdown -Value $trainDropdown -MemberType NoteProperty
Add-Member -InputObject $PIS -Name stationLabel -Value $stationLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name autoUpdateCheckbox -Value $autoUpdateCheckbox -MemberType NoteProperty
Add-Member -InputObject $PIS -Name delayCheckbox -Value $delayCheckbox -MemberType NoteProperty
Add-Member -InputObject $PIS -Name languageSelectionLabel -Value $languageSelectionLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name languageSelection -Value $languageSelection -MemberType NoteProperty
Add-Member -InputObject $PIS -Name SettingsGroupBox -Value $SettingsGroupBox -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassinggroupBox1 -Value $TrainPassinggroupBox1 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack1Button -Value $TrainPassTrack1Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name stationDropdown -Value $stationDropdown -MemberType NoteProperty
Add-Member -InputObject $PIS -Name gongButton -Value $gongButton -MemberType NoteProperty
Add-Member -InputObject $PIS -Name generateButton -Value $generateButton -MemberType NoteProperty
Add-Member -InputObject $PIS -Name logConsole -Value $logConsole -MemberType NoteProperty
Add-Member -InputObject $PIS -Name updateButton -Value $updateButton -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack10Button -Value $TrainPassTrack10Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack9Button -Value $TrainPassTrack9Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack8Button -Value $TrainPassTrack8Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack7Button -Value $TrainPassTrack7Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack6Button -Value $TrainPassTrack6Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack5Button -Value $TrainPassTrack5Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack4Button -Value $TrainPassTrack4Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack3Button -Value $TrainPassTrack3Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack2Button -Value $TrainPassTrack2Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name audioCheckbox -Value $audioCheckbox -MemberType NoteProperty
}
. InitializeComponent
