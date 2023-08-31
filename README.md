
![](https://i.imgur.com/PvFw2AW.png)

  
![](https://cloud.furry.fm/index.php/apps/files_sharing/publicpreview/5pAKWgxrttfZsY8?file=&fileId=1090157&x=1921&y=1060&a=true)  
Wouldn't it be nice to have announcements at the station? Yes, I think so! I have written a tool that does just that! The most important thing is: it has to be simple and fast because as a dispatcher you are often under stress. The tool allows the dispatcher to generate announcements in 3 languages, which are generated fully automatically as the app reads the timetable information from the API. Once the announcement has been generated, it is copied to the clipboard which can be pasted directly into the TD2 chat. But there is more: It is also possible to play the announcement as audio, simply select the corresponding option (great also for streamers).  
  
I would like to thank the following people who supported me in this project:  
  
**Naswille** - help with the translation  
**Spythere** - providing and helping with API access  
  
![](https://cloud.furry.fm/index.php/apps/files_sharing/publicpreview/293YDF4gwc48Jxp?file=&fileId=1090167&x=1921&y=1060&a=true)  
Currently, the App Supports the following:  

-   Generate automatically written Announcements in English, German and Polish
-   Generate automatically Audio Announcements in English, German and Polish
-   Automaticly detecting of the Stop Type of a train

  
![](https://cloud.furry.fm/index.php/apps/files_sharing/publicpreview/kjTRoBoJHE4gpdp?file=&fileId=1090158&x=1921&y=1060&a=true)  
At the moment, the App generates the following Announcements fully automatically depending on the Timetable of a Train:  
  
**If a train has a PH in a Station and has no Delay, the Announcement looks like this:  
**  

Quote

> *STATION ANNOUNCEMENT* Attention at track 1, The pospieszny from Trzymałkowice to LIGOTA GRABOWSKA is arriving. The planned Departure is 12:05. *OGŁOSZENIE STACYJNE* Uwaga! Pociąg pospieszny ze stacji Trzymałkowice do stacji LIGOTA GRABOWSKA wjedzie na tor 1, Planowy odjazd pociągu o godzinie 12:05.

  
**If a train has a PH in a Station and has a Delay > 5 Minutes, the Announcement looks like this:  
**  

Quote

> *STATION ANNOUNCEMENT* The pospieszny from station CZERMIN to station ŻORY, scheduled arrival 12:02, will arrive approximately 9 minutes late at platform 1. The delay is subject to change. Please pay attention to announcements. *OGŁOSZENIE STACYJNE* Uwaga! Pociąg pospieszny ze stacji CZERMIN do stacji ŻORY wjedzie na tor 1, planowy przyjazd 12:02, przyjedzie z opóźnieniem około 9 minut. Opóźnienie może ulec zmianie. Prosimy o zwracanie uwagi na komunikaty.

  
**If a Train ends at the Station, the Announcement looks like this:  
**  

Quote

> *STATION ANNOUNCEMENT* Attention at track 1, the pospieszny from is arriving. This train ends here, please do not board the train. *OGŁOSZENIE STACYJNE* Uwaga na tor 1, przyjedzie Pociąg pospieszny ze stacji . Pociąg kończy bieg. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu

  
**If a train has no PH, is passing through, or has no timetable, this announcement is generated  
**  

Quote

> *STATION ANNOUNCEMENT* Attention at track 1, A train is passing through. Please stand back. *OGŁOSZENIE STACYJNE* Uwaga! Na tor 1 wjedzie pociąg bez zatrzymania. Prosimy zachować ostrożność i nie zbliżać się do krawędzi peronu.

  
![](https://cloud.furry.fm/index.php/apps/files_sharing/publicpreview/HWYbNqs6t37qfXp?file=&fileId=1090162&x=1921&y=1060&a=true)  
1. Download the Program from GitHub and extract it somewhere on your PC  
2. Select the Station where you want to generate the Announcements  
3. In the language selection, select the language in which the announcement is to be generated. Attention: This selection also applies to the audio announcements.  
4. **Wait until the Train arrives at your Station**, click the Update Trains Button the Refresh the List of Trains (Optionally select the Auto Update checkbox to automatically update the list every 30 seconds.)  
5. Select the Train for which you want to generate the Announcement  
6. Select the track for which the announcement is to be made.  
7. **OPTIONAL**: Check the Checkbox "Delays" if you want to Announce the Delay of a train. If this box is not checked, the Delay will be ignored. You can also choose the language of the Announcement in the Gui  
8. **OPTIONAL**: Do you want to hear the Announcement too? Then Select Play Audio. You can also choose a .wav File if you want the App to play a Gong before the Announcement  
9. Click the Button Generate. **It will now generate the Announcement and copies the Text into your Clipboard** so that you can easily paste it into the Chat of TD2 with STRG+V. There is also a Pop Up appearing where you  
can Check the generated Announcement.  
  
**Note: The announcements for a PH are generated only for the primary station, not for small stops.**  
 

  
![](https://cloud.furry.fm/index.php/apps/files_sharing/publicpreview/Jg7eQmx3fescE2a?file=&fileId=1090161&x=1921&y=1060&a=true)  
You can Download the Tool via Github: [https://github.com/bravuralion/td2-simple-text-announcement-generator/releases](https://github.com/bravuralion/td2-simple-text-announcement-generator/releases)  
  

**IMPORTANT: It can happen that the Antivirus blocks the Exe as it detects that it runs a Powershell Script. You may have to whitelist the exe to be able to run it. This is a known issue but im on it to improve on that matter so that the executable will be signed in the future.  [https://github.com/MScholtes/Win-PS2EXE/issues/4](https://github.com/MScholtes/Win-PS2EXE/issues/4)  
**

  
**Note**: You can also evaluate the tool without being an active dispatcher. Just select a station that is currently online and has trains.
