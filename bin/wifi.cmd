@echo off
title Wireless adapters set back to dhcp...

REM set dynamic IP address
netsh interface ip set address "Wi-Fi" dhcp >nul 2>nul

REM confirmation message
echo Success. & echo.
pause