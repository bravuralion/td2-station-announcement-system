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
[System.Windows.Forms.Button]$button5 = $null
[System.Windows.Forms.Button]$button6 = $null
[System.Windows.Forms.Button]$button7 = $null
[System.Windows.Forms.Button]$button8 = $null
[System.Windows.Forms.Button]$button9 = $null
[System.Windows.Forms.Button]$button4 = $null
[System.Windows.Forms.Button]$button3 = $null
[System.Windows.Forms.Button]$button2 = $null
[System.Windows.Forms.Button]$button1 = $null
[System.Windows.Forms.Button]$TrainPassTrack1Button = $null
[System.Windows.Forms.ComboBox]$stationDropdown = $null
[System.Windows.Forms.Button]$gongButton = $null
[System.Windows.Forms.Button]$generateButton = $null
[System.Windows.Forms.TextBox]$logConsole = $null
[System.Windows.Forms.Button]$updateButton = $null
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
$button5 = (New-Object -TypeName System.Windows.Forms.Button)
$button6 = (New-Object -TypeName System.Windows.Forms.Button)
$button7 = (New-Object -TypeName System.Windows.Forms.Button)
$button8 = (New-Object -TypeName System.Windows.Forms.Button)
$button9 = (New-Object -TypeName System.Windows.Forms.Button)
$button4 = (New-Object -TypeName System.Windows.Forms.Button)
$button3 = (New-Object -TypeName System.Windows.Forms.Button)
$button2 = (New-Object -TypeName System.Windows.Forms.Button)
$button1 = (New-Object -TypeName System.Windows.Forms.Button)
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
$gongButton.add_Click($button10_Click)
#
#TrainPassinggroupBox1
#
$TrainPassinggroupBox1.Controls.Add($button5)
$TrainPassinggroupBox1.Controls.Add($button6)
$TrainPassinggroupBox1.Controls.Add($button7)
$TrainPassinggroupBox1.Controls.Add($button8)
$TrainPassinggroupBox1.Controls.Add($button9)
$TrainPassinggroupBox1.Controls.Add($button4)
$TrainPassinggroupBox1.Controls.Add($button3)
$TrainPassinggroupBox1.Controls.Add($button2)
$TrainPassinggroupBox1.Controls.Add($button1)
$TrainPassinggroupBox1.Controls.Add($TrainPassTrack1Button)
$TrainPassinggroupBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]381,[System.Int32]166))
$TrainPassinggroupBox1.Name = [System.String]'TrainPassinggroupBox1'
$TrainPassinggroupBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]177,[System.Int32]79))
$TrainPassinggroupBox1.TabIndex = [System.Int32]12
$TrainPassinggroupBox1.TabStop = $false
$TrainPassinggroupBox1.Text = [System.String]'Train Passing at'
#
#button5
#
$button5.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]142,[System.Int32]49))
$button5.Name = [System.String]'button5'
$button5.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button5.TabIndex = [System.Int32]22
$button5.Text = [System.String]'10'
$button5.UseVisualStyleBackColor = $true
#
#button6
#
$button6.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]49))
$button6.Name = [System.String]'button6'
$button6.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button6.TabIndex = [System.Int32]21
$button6.Text = [System.String]'9'
$button6.UseVisualStyleBackColor = $true
#
#button7
#
$button7.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]74,[System.Int32]49))
$button7.Name = [System.String]'button7'
$button7.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button7.TabIndex = [System.Int32]20
$button7.Text = [System.String]'8'
$button7.UseVisualStyleBackColor = $true
#
#button8
#
$button8.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]40,[System.Int32]49))
$button8.Name = [System.String]'button8'
$button8.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button8.TabIndex = [System.Int32]19
$button8.Text = [System.String]'7'
$button8.UseVisualStyleBackColor = $true
#
#button9
#
$button9.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]49))
$button9.Name = [System.String]'button9'
$button9.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button9.TabIndex = [System.Int32]18
$button9.Text = [System.String]'6'
$button9.UseVisualStyleBackColor = $true
#
#button4
#
$button4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]142,[System.Int32]19))
$button4.Name = [System.String]'button4'
$button4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button4.TabIndex = [System.Int32]17
$button4.Text = [System.String]'5'
$button4.UseVisualStyleBackColor = $true
#
#button3
#
$button3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]19))
$button3.Name = [System.String]'button3'
$button3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button3.TabIndex = [System.Int32]16
$button3.Text = [System.String]'4'
$button3.UseVisualStyleBackColor = $true
#
#button2
#
$button2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]74,[System.Int32]19))
$button2.Name = [System.String]'button2'
$button2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button2.TabIndex = [System.Int32]15
$button2.Text = [System.String]'3'
$button2.UseVisualStyleBackColor = $true
#
#button1
#
$button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]40,[System.Int32]19))
$button1.Name = [System.String]'button1'
$button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$button1.TabIndex = [System.Int32]14
$button1.Text = [System.String]'2'
$button1.UseVisualStyleBackColor = $true
#
#TrainPassTrack1Button
#
$TrainPassTrack1Button.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]6,[System.Int32]19))
$TrainPassTrack1Button.Name = [System.String]'TrainPassTrack1Button'
$TrainPassTrack1Button.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]28,[System.Int32]23))
$TrainPassTrack1Button.TabIndex = [System.Int32]13
$TrainPassTrack1Button.Text = [System.String]'1'
$TrainPassTrack1Button.UseVisualStyleBackColor = $true
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
Add-Member -InputObject $PIS -Name button5 -Value $button5 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button6 -Value $button6 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button7 -Value $button7 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button8 -Value $button8 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button9 -Value $button9 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button4 -Value $button4 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button3 -Value $button3 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button2 -Value $button2 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name button1 -Value $button1 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name TrainPassTrack1Button -Value $TrainPassTrack1Button -MemberType NoteProperty
Add-Member -InputObject $PIS -Name stationDropdown -Value $stationDropdown -MemberType NoteProperty
Add-Member -InputObject $PIS -Name gongButton -Value $gongButton -MemberType NoteProperty
Add-Member -InputObject $PIS -Name generateButton -Value $generateButton -MemberType NoteProperty
Add-Member -InputObject $PIS -Name logConsole -Value $logConsole -MemberType NoteProperty
Add-Member -InputObject $PIS -Name updateButton -Value $updateButton -MemberType NoteProperty
Add-Member -InputObject $PIS -Name audioCheckbox -Value $audioCheckbox -MemberType NoteProperty
}
. InitializeComponent
