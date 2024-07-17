REM Sort text files on Drive C: by date
echo Sorting text files on Drive C: by date...
cd /d C:\
for %%F in (*.txt) do (
    for /f "tokens=1-3 delims=/" %%A in ("%%~tF") do (
        set "mm=%%A"
        set "dd=%%B"
        set "yyyy=%%C"
    )
    rem We need to enable delayed expansion to use the variables inside the loop
    setlocal enabledelayedexpansion
    ren "%%F" "!yyyy!-!mm!-!dd!-%%F"
    endlocal
)

REM Archive older files to a folder on Drive Z:
echo Archiving older files to a folder on Drive Z:...
robocopy C:\ Z:\Archive *.txt /s /maxage:30 /mov

REM Sort the archived files by size
echo Sorting the archived files by size...
cd /d Z:\Archive
dir /b /os *.txt > sorted_files.txt

REM Prompt the user for permission to delete old, large files
echo.
set /p del_choice=Do you want to delete old, large files? (yes/no): 
if /i "%del_choice%"=="yes" (
    set /p file_size=Enter the maximum file size to delete (in bytes): 
    for /f "delims=" %%F in (sorted_files.txt) do (
        for /f %%A in ('"forfiles /p "%%~dpF" /m "%%~nxF" /c "cmd /c echo @fsize" "') do (
            if %%A GEQ %file_size% (
                echo Deleting %%F...
                del "%%~dpF%%~nxF"
            )
        )
    )
    echo Deletion complete.
) else (
    echo Deletion canceled.
)

pause
