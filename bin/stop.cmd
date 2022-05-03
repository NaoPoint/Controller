@echo off

echo Stopping...

REM set dynamic IP address
netsh interface ip set address name="Wi-Fi" dhcp

REM stop flask server
taskkill /f /im "python.exe" /fi "WINDOWTITLE eq Flask Server" >nul 2>nul

REM run xampp
C:\Xampp\apache\bin\httpd.exe -k stop >nul 2>nul