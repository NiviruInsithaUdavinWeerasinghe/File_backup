@echo off
setlocal enabledelayedexpansion

:: Source and destination
set "SRC=D:\=------NIBM WORK-----=\Anime"
set "DST=G:\Anime"

echo Starting backup process...
echo Checking for files to copy...
echo.

echo.
echo =========================================================
echo Files that will be copied (FileName ^|^| FullPath ^|^| Size):
echo =========================================================
echo.
set FileCount=0

for /f "delims=" %%F in ('xcopy "%SRC%" "%DST%" /s /d /y /l ^| findstr /r /c:"\\.*\..*"') do (
    set "FullPath=%%~fF"
    if exist "!FullPath!" (
        :: Get size in bytes using PowerShell
        for /f "usebackq delims=" %%S in (`powershell -NoProfile -Command "(Get-Item -LiteralPath '!FullPath!').Length"`) do (
            set "bytes=%%S"
        )

        :: Determine unit and size with 2 decimals
        if !bytes! GEQ 1073741824 (
            for /f "tokens=1,2 delims=." %%A in ('powershell -NoProfile -Command "[math]::Round(!bytes!/1GB,2)"') do (
                set "sizeHR=%%A.%%B GB"
            )
        ) else if !bytes! GEQ 1048576 (
            for /f "tokens=1,2 delims=." %%A in ('powershell -NoProfile -Command "[math]::Round(!bytes!/1MB,2)"') do (
                set "sizeHR=%%A.%%B MB"
            )
        ) else if !bytes! GEQ 1024 (
            for /f "tokens=1,2 delims=." %%A in ('powershell -NoProfile -Command "[math]::Round(!bytes!/1KB,2)"') do (
                set "sizeHR=%%A.%%B KB"
            )
        ) else (
            set "sizeHR=!bytes! Bytes"
        )

        echo %%~nxF ^|^| !FullPath! ^|^| !sizeHR!
    ) else (
        echo %%~nxF ^|^| !FullPath! ^|^| unknown size
    )
	echo.
    set /a FileCount+=1
)
echo =========================================================

if %FileCount%==0 (
    echo No files to copy.
    goto end
)

echo %FileCount% file(s) will be copied.
echo.

:askAgain
set /p confirm=Do you want to continue? (Y/N): 
if /i "%confirm%"=="Y" goto doCopy
if /i "%confirm%"=="N" (
    echo Backup cancelled by user.
    goto end
)
echo Invalid input. Please enter Y or N.
goto askAgain

:doCopy
echo Copying files now...
xcopy "%SRC%" "%DST%" /s /d /y
echo.
echo =========================================================
echo Files copied successfully!

:end
echo Backup process finished!
pause
