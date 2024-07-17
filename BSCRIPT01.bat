@echo off
rem Open five websites
start "" "http://www.google.com"
start "" "http://www.facebook.com"
start "" "http://www.netflix.com"
start "" "http://www.youtube.com"
start "" "http://www.w3schools.com"

rem Launch calculator and notepad
start calc.exe
start notepad.exe

rem Initiate system shutdown after a brief delay (e.g., 60 seconds)
shutdown /s /t 60

rem Pause to let the user see the message before the shutdown
echo The system will shut down in 60 seconds. Press any key to abort.
pause
shutdown /a