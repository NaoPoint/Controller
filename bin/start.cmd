@echo off
echo NaoPoint is executing: do not close this window!

REM set static IP address
netsh interface ip set address "Wi-Fi" static 192.168.1.100 255.255.255.0 192.168.1.1 1

REM start flask server
start "Flask Server" /MIN /d "C:\Xampp\htdocs\NaoPoint\TvScreen" python -u "ajax.py"

REM run apache
C:\Xampp\apache\bin\httpd.exe -k restart >nul 2>nul

REM open map
start "" "http://localhost/NaoPoint/TvScreen"