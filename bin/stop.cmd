@echo off
title Stopping NaoPoint on the main pc...

echo NaoPoint is stopping: do not close this window!

REM set dynamic IP address
netsh interface ip set address name="Wi-Fi" dhcp >nul 2>nul

REM stop choregraphe
taskkill /im "choregraphe-bin.exe" >nul 2>nul

REM stop flask server
taskkill /f /im "python.exe" /fi "WINDOWTITLE eq Flask Server" >nul 2>nul

REM run xampp
C:\Xampp\apache\bin\httpd.exe -k stop >nul 2>nul