@echo off
title Starting NaoPoint on the main pc...

REM check if the repository has been downloaded
call :check TvScreen
call :check FlaskRequest

:start
REM prevent errors
echo Note: a previous setup is needed on this PC before the first execution.
pause & echo.

echo NaoPoint is executing: do not close this window!

REM ensure modules are installed (before changing IP)
py -3 -m pip install requests flask flask_cors waitress >nul 2>nul

REM set static IP address
netsh interface ip set address "Wi-Fi" static 192.168.1.100 255.255.255.0 192.168.1.1 1

REM launch choregraphe project if no istance is running
tasklist /fi "IMAGENAME eq choregraphe-bin.exe" | findstr choregraphe-bin.exe >nul && goto skip
start "NaoPoint" "C:\Xampp\htdocs\NaoPoint\FlaskRequest\flaskRequest.pml"
:skip

REM start flask server
start "Flask Server" /MIN /d "C:\Xampp\htdocs\NaoPoint\TvScreen" py -3 -u "ajax.py"

REM run apache (and wait)
"C:\Xampp\apache\bin\httpd.exe" -k restart >nul 2>nul

REM open map
start "" "http://localhost/NaoPoint/TvScreen"

REM prevent execution of :check
exit /b

REM function:
:check
if exist "C:\Xampp\htdocs\NaoPoint\"%~1 exit /b
echo This script requires the %~1 repository to be installed into C:\Xampp\htdocs\NaoPoint\%~1. & echo.
echo Please clone it using Git from the repository https://github.com/NaoPoint/%~1. & echo.
pause
REM quit completely (no /b)
exit