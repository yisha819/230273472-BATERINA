@echo off
title Windows Utilities Batch Script

:menu
echo 1. ipconfig
echo 2. tasklist
echo 3. taskkill
echo 4. chkdsk
echo 5. format
echo 6. defrag
echo 7. find
echo 8. attrib
echo 9. Exit
set /p choice="Enter chosen number: "

:: Check the user's choice and go to the corresponding section
if "%choice%"=="1" goto ipconfig
if "%choice%"=="2" goto tasklist
if "%choice%"=="3" goto taskkill
if "%choice%"=="4" goto chkdsk
if "%choice%"=="5" goto format
if "%choice%"=="6" goto defrag
if "%choice%"=="7" goto find
if "%choice%"=="8" goto attrib
if "%choice%"=="9" goto exit

rem Handle invalid choices
echo Invalid choice. Please select a number between 1 and 9.
pause
goto menu

:ipconfig
ipconfig /all
pause
goto menu

:tasklist
tasklist
pause
goto menu

:taskkill
rem Prompt the user for the PID of the task to terminate
set /p pid="Enter the PID of the task to kill: "
rem Execute the taskkill command
taskkill /PID %pid%
rem Check if the taskkill command was successful
if errorlevel 1 (
    echo Failed to kill task with PID %pid%.
) else (
    echo Task with PID %pid% has been terminated successfully.
)
pause
goto menu

:chkdsk
rem Prompt the user for the drive letter to check
set /p drive="Enter the drive letter (e.g., C:): "
chkdsk %drive%
pause
goto menu

:format
echo WARNING: Formatting a drive will erase all data on it.
rem Prompt the user for the drive letter to format
set /p drive="Enter the drive letter to format (e.g., E:): "
echo Are you sure you want to format %drive%? (Y/N)
set /p confirm=""
:: Check if the user confirmed the format operation
if /I not "%confirm%"=="Y" goto menu
format %drive%
pause
goto menu

:defrag
rem Prompt the user for the drive letter to defragment
set /p drive="Enter the drive letter to defrag (e.g., C:): "
defrag %drive%
pause
goto menu

:find
rem Prompt the user for the search string
set /p search_string="Enter the text string to search for: "
rem Prompt the user for the file path
set /p file_path="Enter the full path of the file to search in: "
rem Execute the find command
find "%search_string%" "%file_path%"
pause
goto menu


:attrib
rem Prompt the user for the file or directory to check attributes
set /p file="Enter the file or directory: "
attrib %file%
pause
goto menu

:exit
echo Exiting...
pause
exit
