$TrainPassTrack10Button_Click = {
    GeneratePassing -track 10
}

$TrainPassTrack9Button_Click = {
    GeneratePassing -track 9
}

$TrainPassTrack8Button_Click = {
    GeneratePassing -track 8
}

$TrainPassTrack7Button_Click = {
    GeneratePassing -track 7
}

$TrainPassTrack6Button_Click = {
    GeneratePassing -track 6
}

$TrainPassTrack5Button_Click = {
    GeneratePassing -track 5
}

$TrainPassTrack4Button_Click = {
    GeneratePassing -track 4
}

$TrainPassTrack3Button_Click = {
    GeneratePassing -track 3
}

$TrainPassTrack2Button_Click = {
    GeneratePassing -track 2
}
$TrainPassTrack1Button_Click = {
    GeneratePassing -track 1
}

$generateButton_Click = {
     if ($stationDropdown.SelectedItem -and $trainDropdown.SelectedItem -and $trackDropDown.SelectedItem) {
        $selectedStationName = $stationDropdown.SelectedItem
        $selectedTrainNo = $trainDropdown.SelectedItem

        $trainsResponse = Invoke-RestMethod -Uri "https://stacjownik.spythere.pl/api/getActiveTrainList"
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

        #For DebuggingW
        #write-host "Stoplist:"
        #write-host $selectedTrain.timetable.stopList
        #write-host "Station Name: $selectedStationName"
        #write-host "Stop Type:"
        #write-host $stopDetails.stopType

        $startStation = ConvertToProperCase($selectedTrain.timetable.stopList[0].stopNameRAW)
        $endStation = ConvertToProperCase($selectedTrain.timetable.stopList[-1].stopNameRAW)

        if ($stopDetails.stopType -like "*ph*" -and $stopDetails.terminatesHere -eq $false) {

            $departureTime = Get-Date "1970-01-01 00:00:00Z"
            $departureTime = $departureTime.AddSeconds($stopDetails.departureTimestamp / 1000).AddHours(1)

            $arrivalTime = Get-Date "1970-01-01 00:00:00Z"
            $arrivalTime = $arrivalTime.AddSeconds($stopDetails.arrivalTimestamp / 1000).AddHours(1)
            
            if ($delayCheckbox.Checked -and $stopDetails.departureDelay -gt 5) {

                $delayMinutes = $stopDetails.departureDelay
                $announcementEN = "*STATION ANNOUNCEMENT* The $($categoriesNames[$selectedTrain.timetable.category]) from station $startStation to station $endStation, scheduled arrival $($arrivalTime.ToString('HH:mm')), will arrive approximately $delayMinutes minutes late at platform $($trackDropdown.SelectedItem). The delay is subject to change. Please pay attention to announcements."
                $announcementAEN = "The $($categoriesNames[$selectedTrain.timetable.category]) from station $startStation to station $endStation, scheduled arrival $($arrivalTime.ToString('HH:mm')), will arrive approximately $delayMinutes minutes late at platform $($trackDropdown.SelectedItem). The delay is subject to change. Please pay attention to announcements."
                $announcementDE = "*Bahnhofsdurchsage* Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation, geplante Ankunft $($arrivalTime.ToString('HH:mm')) , wird voraussichtlich mit einer Verspätung von $delayMinutes Minuten auf Gleis $($trackDropdown.SelectedItem) eintreffen. Bitte beachten Sie die Ansagen."
                $announcementADE = "Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation, geplante Ankunft $($arrivalTime.ToString('HH:mm')) , wird voraussichtlich mit einer Verspätung von $delayMinutes Minuten auf Gleis $($trackDropdown.SelectedItem) eintreffen. Bitte beachten Sie die Ansagen."
                $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor numer $($trackDropdown.SelectedItem), planowy przyjazd $($arrivalTime.ToString('HH:mm')), przyjedzie z opóźnieniem około $delayMinutes minut. Opóźnienie może ulec zmianie. Prosimy o zwracanie uwagi na komunikaty."
                $announcementAPL = "Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor numer $($trackDropdown.SelectedItem), planowy przyjazd $($arrivalTime.ToString('HH:mm')), przyjedzie z opóźnieniem około $delayMinutes minut. Opóźnienie może ulec zmianie. Prosimy o zwracanie uwagi na komunikaty."
                AddToLog "Generating announcement."
                GenerateAndDisplayAnnouncement -announcementEN $announcementEN -announcementPL $announcementPL -announcementDE $announcementDE -announcementAEN $announcementAEN -announcementAPL $announcementAPL -announcementADE $announcementADE
                
                return
            }
            else {
        
                $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), The $($categoriesNames[$selectedTrain.timetable.category]) from $startStation to $endStation is arriving. The planned Departure is $($departureTime.ToString('HH:mm'))."
                $announcementAEN = "Attention at track $($trackDropdown.SelectedItem), The $($categoriesNames[$selectedTrain.timetable.category]) from $startStation to $endStation is arriving. The planned Departure is $($departureTime.ToString('HH:mm'))."
                $announcementDE = "*Bahnhofsdurchsage* Achtung am Gleis $($trackDropdown.SelectedItem), Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation fährt ein. Die planmässige Abfahrt ist um $($departureTime.ToString('HH:mm'))."
                $announcementADE = "Achtung am Gleis $($trackDropdown.SelectedItem), Der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation nach $endStation fährt ein. Die planmässige Abfahrt ist um $($departureTime.ToString('HH:mm'))."
                $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor numer $($trackDropdown.SelectedItem), Planowy odjazd pociągu o godzinie $($departureTime.ToString('HH:mm'))."
                $announcementAPL = "Uwaga! Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation do stacji $endStation wjedzie na tor numer $($trackDropdown.SelectedItem), Planowy odjazd pociągu o godzinie $($departureTime.ToString('HH:mm'))."
                AddToLog "Generating announcement."
                GenerateAndDisplayAnnouncement -announcementEN $announcementEN -announcementPL $announcementPL -announcementDE $announcementDE -announcementAEN $announcementAEN -announcementAPL $announcementAPL -announcementADE $announcementADE
                
                return

            }
        } 
        if ($stopDetails.terminatesHere -eq $true) {
           
            $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), the $($categoriesNames[$selectedTrain.timetable.category]) from $startStation is arriving. This train ends here, please do not board the train."
            $announcementAEN = "Attention at track $($trackDropdown.SelectedItem), the $($categoriesNames[$selectedTrain.timetable.category]) from $startStation is arriving. This train ends here, please do not board the train."
            $announcementDE = "*Bahnhofsdurchsage* Achtung am Gleis $($trackDropdown.SelectedItem), der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation fährt ein. Dieser Zug endet hier, bitte nicht einsteigen."
            $announcementADE = "Achtung am Gleis $($trackDropdown.SelectedItem), der $($categoriesNames[$selectedTrain.timetable.category]) von $startStation fährt ein. Dieser Zug endet hier, bitte nicht einsteigen."
            $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga na tor numer $($trackDropdown.SelectedItem), przyjedzie Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation. Pociąg kończy bieg. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."
            $announcementAPL = "Uwaga na tor numer $($trackDropdown.SelectedItem), przyjedzie Pociąg $($categoriesNames[$selectedTrain.timetable.category]) ze stacji $startStation. Pociąg kończy bieg. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."

        }
        else {

             $announcementEN = "*STATION ANNOUNCEMENT* Attention at track $($trackDropdown.SelectedItem), A train is passing through. Please stand back."
             $announcementAEN = "Attention at track $($trackDropdown.SelectedItem), A train is passing through. Please stand back."
             $announcementPL = "*OGŁOSZENIE STACYJNE* Uwaga! Na tor numer $($trackDropdown.SelectedItem) wjedzie pociąg bez zatrzymania. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."
             $announcementAPL = "Uwaga! Na tor numer $($trackDropdown.SelectedItem) wjedzie pociąg bez zatrzymania. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu."
             $announcementDE = "*Bahnhofsdurchsage* Achtung am Gleis $($trackDropdown.SelectedItem), Zugdurchfahrt. Zurückbleiben bitte."
             $announcementADE = "Achtung am Gleis $($trackDropdown.SelectedItem), Zugdurchfahrt. Zurückbleiben bitte."
             
                
        }
        AddToLog "Generating announcement."
        GenerateAndDisplayAnnouncement -announcementEN $announcementEN -announcementPL $announcementPL -announcementDE $announcementDE -announcementAEN $announcementAEN -announcementAPL $announcementAPL -announcementADE $announcementADE       

    } 
    else {
        [System.Windows.Forms.MessageBox]::Show("Please select all: a station, track and train.")
    }

}

$updateButton_Click = {
        if ($stationDropdown.SelectedItem) {
        $selectedStationName = $stationDropdown.SelectedItem
        $trainsResponse = Invoke-RestMethod -Uri "https://stacjownik.spythere.pl/api/getActiveTrainList"
        $relevantTrains = $trainsResponse | Where-Object { $_.currentStationName -eq $selectedStationName }
        $trainNumbers = $relevantTrains | ForEach-Object { $_.trainNo }
        $trainDropdown.Items.Clear()
        $trainDropdown.SelectedItem = $null
        $trainDropdown.Items.AddRange($trainNumbers)
        AddToLog "Updating Train List"
    }
}

$gongButton_Click = {
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.Filter = "WAV Files (*.wav)|*.wav"
    $openFileDialog.Title = "Select a WAV File"
    if ($openFileDialog.ShowDialog() -eq "OK") {
        $script:gong = $openFileDialog.FileName
    }
    
}
#Dependencies

. .\PIS.designer.ps1
. .\Functions.ps1


#Needed for Auto Correction

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



#Filling Tracks and Stations

1..600 | ForEach-Object { $trackDropdown.Items.Add($_) }

$response = Invoke-RestMethod -Uri "https://stacjownik.spythere.pl/api/getSceneries"
$stationNames = $response | ForEach-Object { $_.Name } | Sort-Object
$stationDropdown.Items.AddRange($stationNames)

#Timer for Auto Update

$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 30000 # 30 Seconds
$timer.Add_Tick({
    if ($autoUpdateCheckbox.Checked) {
        AddToLog "Auto Update start"
        if ($stationDropdown.SelectedItem) {
            $selectedStationName = $stationDropdown.SelectedItem
            $trainsResponse = Invoke-RestMethod -Uri "https://stacjownik.spythere.pl/api/getActiveTrainList"
            $relevantTrains = $trainsResponse | Where-Object { $_.currentStationName -eq $selectedStationName }
            $trainNumbers = $relevantTrains | ForEach-Object { $_.trainNo }
            $trainDropdown.Items.Clear()
            $trainDropdown.SelectedItem = $null
            if ($trainNumbers.Count -eq 0) {
                $trainDropdown.Items.Add("No Trains in the Station")
            } else {
                $trainDropdown.Items.AddRange($trainNumbers)
            }
            AddToLog "Auto Update finished"
        }
    }
})
$timer.Start()

$PIS.ShowDialog()
