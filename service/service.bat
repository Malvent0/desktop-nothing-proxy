@echo off
chcp 65001 >nul
title Nothing WS Proxy - Service
color 0F

cd /d "%~dp0"

if not exist "..\installed.txt" (
    echo Install me in install.bat!
    timeout /t 5 /nobreak >nul
    exit
)

echo I have already been installed, and I have been applied to the start.bat file!
timeout /t 5 /nobreak >nul
exit
