
![](https://i.imgur.com/PvFw2AW.png)

I have thought about how to make station announcements as a dispatcher in TD2 to make the experience of the train drivers a little more fun. I have built an AI voice generator for my streams with a gong that you can hear in the stream. I also wrote a small Powershell tool, which generates these announcements in text form, so that I can insert them into the chat of TD2.  
  
**I have greatly improved this tool with version 2.0, it is now able to automatically analyze the timetables of the trains and generate an announcement accordingly. The tool pays attention to whether the train has a PH, only passes through, or ends there. In addition, the delay is also analyzed.**  
  
If a train has a PH in a Station and has no Delay, the Announcement looks like this:  
  

Quote

> *STATION ANNOUNCEMENT* Attention at track 1, The pospieszny from Trzymałkowice to LIGOTA GRABOWSKA is arriving. The planned Departure is 12:05. *OGŁOSZENIE STACYJNE* Uwaga! Pociąg pospieszny ze stacji Trzymałkowice do stacji LIGOTA GRABOWSKA wjedzie na tor 1, Planowy odjazd pociągu o godzinie 12:05.

  
If a train has a PH in a Station and has a Delay > 5 Minutes, the Announcement looks like this:  
  

Quote

> *STATION ANNOUNCEMENT* The pospieszny from station CZERMIN to station ŻORY, scheduled arrival 12:02, will arrive approximately 9 minutes late at platform 1. The delay is subject to change. Please pay attention to announcements. *OGŁOSZENIE STACYJNE* Uwaga! Pociąg pospieszny ze stacji CZERMIN do stacji ŻORY wjedzie na tor 1, planowy przyjazd 12:02, przyjedzie z opóźnieniem około 9 minut. Opóźnienie może ulec zmianie. Prosimy o zwracanie uwagi na komunikaty.

  
If a Train ends in the Station, the Announcement looks like this:  
  

Quote

> *STATION ANNOUNCEMENT* Attention at track 1, the pospieszny from is arriving. This train ends here, please do not board the train. *OGŁOSZENIE STACYJNE* Uwaga na tor 1, przyjedzie Pociąg pospieszny ze stacji . Pociąg kończy bieg. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu

  
If a train has no PH, is passing through or has no timetable, this announcement is generated  
  

Quote

> *STATION ANNOUNCEMENT* Attention at track 1, A train is passing through. Please stand back. *OGŁOSZENIE STACYJNE* Uwaga! Na tor 1 wjedzie pociąg bez zatrzymania. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu.

  
I will enhance this tool continuously, in the final version it should be web based and also generate and play audio announcements.  
  
  
At this point, I would like to thank the following people who supported me in this project:  
  
**Naswille** - help with the translation  
**Spythere** - providing and helping with API access  
  
  
**How to Use the Program:**  
1. Download the Program from Github and extract it somewhere on your PC  
2. Start the Program with a rightclick on the .ps1 file and select "Run with Powershell"  
3. Select the Station where you want to generate the Announcements  
4. Wait until the Train arrives at your Station, click the Update Trains Button the Refresh the List of Trains (Optionally select the Auto Update checkbox to automatically update the list every 30 seconds.)  
5. Select the Train for which you want to generate the Announcement  
6. Select the track for which the announcement is to be made.  
7. OPTIONAL: Check the Checkbox "Delays" if you want to Announce the Delay of a train. If this box is not checked, the Delay will be ignored  
8. Click the Button Generate. **It will now generate the Announcement and copies the Text into your Clipboard** so that you can easily paste it into the Chat of TD2 with STRG+V. There is also a Pop Up appearing where you  
can Check the generated Announcement.  
  
Note: The announcements for a PH are generated only for the primary station, not for small stops.  

**IMPORTANT: It can happen that the Antivirus blocks the Exe as it detects that it runs a Powershell Script. Either whitelist the Exe or you can Download the .ps1 file from Github and run it manually.  [https://github.com/MScholtes/Win-PS2EXE/issues/4](https://github.com/MScholtes/Win-PS2EXE/issues/4)  
**

You can either use the .exe file in the Zip or the .ps1 from the source and run it with powershell.  
  
**Hint**: You can also evaluate the tool without being an active dispatcher. Just select a station that is currently online and has trains.  
  
  
**Important: DO NOT USE THIS TOOL WHEN YOU ARE DRIVING! Only active Dispatchers are allowed to use this Tool in their Stations!**
