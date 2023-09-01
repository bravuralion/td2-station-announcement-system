[void][System.Reflection.Assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][System.Reflection.Assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
$PIS = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Label]$trackLabel = $null
[System.ComponentModel.BackgroundWorker]$backgroundWorker1 = $null
[System.Windows.Forms.ComboBox]$trackDropdown = $null
[System.Windows.Forms.Label]$trainLabel = $null
[System.Windows.Forms.ComboBox]$trainDropdown = $null
[System.Windows.Forms.ComboBox]$comboBox1 = $null
[System.Windows.Forms.Label]$stationLabel = $null
[System.Windows.Forms.CheckBox]$autoUpdateCheckbox = $null
[System.Windows.Forms.CheckBox]$delayCheckbox = $null
[System.Windows.Forms.Label]$languageSelectionLabel = $null
[System.Windows.Forms.CheckedListBox]$languageSelection = $null
[System.Windows.Forms.CheckBox]$audioCheckbox = $null
function InitializeComponent
{
$trackLabel = (New-Object -TypeName System.Windows.Forms.Label)
$backgroundWorker1 = (New-Object -TypeName System.ComponentModel.BackgroundWorker)
$trackDropdown = (New-Object -TypeName System.Windows.Forms.ComboBox)
$trainLabel = (New-Object -TypeName System.Windows.Forms.Label)
$trainDropdown = (New-Object -TypeName System.Windows.Forms.ComboBox)
$comboBox1 = (New-Object -TypeName System.Windows.Forms.ComboBox)
$stationLabel = (New-Object -TypeName System.Windows.Forms.Label)
$autoUpdateCheckbox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$delayCheckbox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$audioCheckbox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$languageSelectionLabel = (New-Object -TypeName System.Windows.Forms.Label)
$languageSelection = (New-Object -TypeName System.Windows.Forms.CheckedListBox)
$PIS.SuspendLayout()
#
#trackLabel
#
$trackLabel.AutoSize = $true
$trackLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]103))
$trackLabel.Name = [System.String]'trackLabel'
$trackLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]43,[System.Int32]16))
$trackLabel.TabIndex = [System.Int32]0
$trackLabel.Text = [System.String]'Track'
#
#trackDropdown
#
$trackDropdown.FormattingEnabled = $true
$trackDropdown.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]122))
$trackDropdown.Name = [System.String]'trackDropdown'
$trackDropdown.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]162,[System.Int32]24))
$trackDropdown.TabIndex = [System.Int32]1
#
#trainLabel
#
$trainLabel.AutoSize = $true
$trainLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]57))
$trainLabel.Name = [System.String]'trainLabel'
$trainLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]39,[System.Int32]16))
$trainLabel.TabIndex = [System.Int32]2
$trainLabel.Text = [System.String]'Train'
#
#trainDropdown
#
$trainDropdown.FormattingEnabled = $true
$trainDropdown.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]76))
$trainDropdown.Name = [System.String]'trainDropdown'
$trainDropdown.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]162,[System.Int32]24))
$trainDropdown.TabIndex = [System.Int32]3
#
#comboBox1
#
$comboBox1.FormattingEnabled = $true
$comboBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]29))
$comboBox1.Name = [System.String]'comboBox1'
$comboBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]162,[System.Int32]24))
$comboBox1.TabIndex = [System.Int32]5
#
#stationLabel
#
$stationLabel.AutoSize = $true
$stationLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]9,[System.Int32]10))
$stationLabel.Name = [System.String]'stationLabel'
$stationLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]49,[System.Int32]16))
$stationLabel.TabIndex = [System.Int32]4
$stationLabel.Text = [System.String]'Station'
#
#autoUpdateCheckbox
#
$autoUpdateCheckbox.AutoSize = $true
$autoUpdateCheckbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]202,[System.Int32]29))
$autoUpdateCheckbox.Name = [System.String]'autoUpdateCheckbox'
$autoUpdateCheckbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]102,[System.Int32]20))
$autoUpdateCheckbox.TabIndex = [System.Int32]6
$autoUpdateCheckbox.Text = [System.String]'Auto Update'
$autoUpdateCheckbox.UseVisualStyleBackColor = $true
#
#delayCheckbox
#
$delayCheckbox.AutoSize = $true
$delayCheckbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]202,[System.Int32]57))
$delayCheckbox.Name = [System.String]'delayCheckbox'
$delayCheckbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]133,[System.Int32]20))
$delayCheckbox.TabIndex = [System.Int32]7
$delayCheckbox.Text = [System.String]'Announce Delays'
$delayCheckbox.UseVisualStyleBackColor = $true
#
#audioCheckbox
#
$audioCheckbox.AutoSize = $true
$audioCheckbox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]202,[System.Int32]83))
$audioCheckbox.Name = [System.String]'audioCheckbox'
$audioCheckbox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]92,[System.Int32]20))
$audioCheckbox.TabIndex = [System.Int32]8
$audioCheckbox.Text = [System.String]'Play Audio'
$audioCheckbox.UseVisualStyleBackColor = $true
#
#languageSelectionLabel
#
$languageSelectionLabel.AutoSize = $true
$languageSelectionLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]350,[System.Int32]10))
$languageSelectionLabel.Name = [System.String]'languageSelectionLabel'
$languageSelectionLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]186,[System.Int32]16))
$languageSelectionLabel.TabIndex = [System.Int32]9
$languageSelectionLabel.Text = [System.String]'Language for Announcements'
#
#languageSelection
#
$languageSelection.FormattingEnabled = $true
$languageSelection.Items.AddRange([System.Object[]]@([System.String]'English',[System.String]'German',[System.String]'Polish'))
$languageSelection.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]353,[System.Int32]29))
$languageSelection.Name = [System.String]'languageSelection'
$languageSelection.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]183,[System.Int32]55))
$languageSelection.TabIndex = [System.Int32]10
#
#PIS
#
$PIS.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]570,[System.Int32]257))
$PIS.Controls.Add($languageSelection)
$PIS.Controls.Add($languageSelectionLabel)
$PIS.Controls.Add($audioCheckbox)
$PIS.Controls.Add($delayCheckbox)
$PIS.Controls.Add($autoUpdateCheckbox)
$PIS.Controls.Add($comboBox1)
$PIS.Controls.Add($stationLabel)
$PIS.Controls.Add($trainDropdown)
$PIS.Controls.Add($trainLabel)
$PIS.Controls.Add($trackDropdown)
$PIS.Controls.Add($trackLabel)
$PIS.Name = [System.String]'PIS'
$PIS.ResumeLayout($false)
$PIS.PerformLayout()
Add-Member -InputObject $PIS -Name trackLabel -Value $trackLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name backgroundWorker1 -Value $backgroundWorker1 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name trackDropdown -Value $trackDropdown -MemberType NoteProperty
Add-Member -InputObject $PIS -Name trainLabel -Value $trainLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name trainDropdown -Value $trainDropdown -MemberType NoteProperty
Add-Member -InputObject $PIS -Name comboBox1 -Value $comboBox1 -MemberType NoteProperty
Add-Member -InputObject $PIS -Name stationLabel -Value $stationLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name autoUpdateCheckbox -Value $autoUpdateCheckbox -MemberType NoteProperty
Add-Member -InputObject $PIS -Name delayCheckbox -Value $delayCheckbox -MemberType NoteProperty
Add-Member -InputObject $PIS -Name languageSelectionLabel -Value $languageSelectionLabel -MemberType NoteProperty
Add-Member -InputObject $PIS -Name languageSelection -Value $languageSelection -MemberType NoteProperty
Add-Member -InputObject $PIS -Name audioCheckbox -Value $audioCheckbox -MemberType NoteProperty
}
. InitializeComponent
