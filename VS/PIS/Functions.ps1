<# ========================================================================================================================

Description:	Function Lib for the Announcement Tool

Author:			Sebastian Kurz / Bravura Lion
Created:		08/2023
Last Updated:	31/08/2023
Version:     	0.3
Notes:			Alpha Version, Source does not include Azure Voice API Key which is required for Audio Output.

========================================================================================================================= #>
#File Location für Audio Announcement
$filename = "$env:APPDATA\TD2-AN.wav"

#Settings for Azure Voice
$resourceRegion = "westeurope"
$apiKey = ""
$ttsUrl = "https://$resourceRegion.tts.speech.microsoft.com/cognitiveservices/v1"

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
        [string]$announcementDE,
        [string]$announcementAEN,
        [string]$announcementAPL,
        [string]$announcementADE
    )

    $combinedAnnouncement = ""
    $Song = New-Object System.Media.SoundPlayer
    if ($script:gong -and $audioCheckbox.Checked) {
        AddToLog "WAF selected, playing Gong."
        $timeout = Get-WavDuration -wavPath $gong
        if ($timeout -lt 10)
        {
            $Song.SoundLocation = $gong
            $Song.Play()
            Start-Sleep -Seconds $timeout
        }
        else {
            AddToLog "Gong File too Long: $timeout Select a File which is less than 10 Seconds long."
        }


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
    if ($languageSelection.GetItemChecked(2)) { 
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
function AddToLog {
    param (
        [Parameter(Mandatory=$true)]
        [string]$message
    )
    $logConsole.AppendText("$(Get-Date -Format "HH:mm:ss"): $message`r`n")
}
function ConvertToProperCase($inputString) {
    AddToLog "Convert String: $inputString"
    $firstLetter = $inputString.Substring(0, 1).ToUpper()
    $remainingLetters = $inputString.Substring(1).ToLower()
    return $firstLetter + $remainingLetters
}
