@echo off
title Starting NaoPoint on the secondary pc...

REM check if the repository has been downloaded
if exist "C:\Xampp\htdocs\NaoPoint\Hologram\hologram.py" goto start
echo This script requires the Hologram repository to be installed into C:\Xampp\htdocs\NaoPoint\Hologram. & echo.
echo Please clone it using Git from the repository https://github.com/NaoPoint/Hologram. & echo.
pause
exit /b

:start
REM prevent errors
echo Note: the main pc has to be already running before the execution of this script.
pause & echo.

:python
REM check if python is installed
py -3 --version >nul 2>nul
if %errorlevel% equ 0 (goto vlc) else (call :install Python, 9PJPW5LDXLZ5)

:vlc
REM check if VLC is installed
reg QUERY HKLM\Software\VideoLAN\VLC\ >nul 2>nul
if %errorlevel% equ 0 (goto execute) else (call :install VLC, XPDM1ZW6815MQM)

:execute
echo NaoPoint is executing: close this window to stop the service! & echo.

REM set static IP address if not enabled (anything starting with 192.168 and different from 100)
netsh interface ip show address name="Wi-Fi" | findstr "Yes" >nul && netsh interface ip set address "Wi-Fi" static 192.168.1.99 255.255.255.0 192.168.1.1 1

REM start hologram service
title Executing NaoPoint on the secondary pc...
py -3 -u "C:\Xampp\htdocs\NaoPoint\Hologram\hologram.py"

REM in case of unexpected errors (prevent execution of :install)
echo Unknown error.
pause
exit /b 

REM function:

:install
REM install program
echo %~1 is not installed. Press any key to open the installation page...
pause >nul

REM open microsoft store page
start ms-windows-store://pdp/?ProductId=%~2
cls

REM restart script (you may need to close and reopen anyway)
echo Press any key when %~1 is installed... & echo.
pause >nul
goto python & exit /b
