@echo off
chcp 65001 >nul
title Nothing WS Proxy Stop
color 0C

cd /d "%~dp0"

echo.
echo   ███████ ████████  ██████  ██████  
echo   ██         ██    ██    ██ ██   ██ 
echo   ███████    ██    ██    ██ ██████  
echo        ██    ██    ██    ██ ██      
echo   ███████    ██     ██████  ██      
echo.
echo.

taskkill /f /im cmd.exe /fi "WINDOWTITLE eq Nothing WS Proxy*" >nul 2>&1
taskkill /f /im conhost.exe /fi "WINDOWTITLE eq Nothing WS Proxy*" >nul 2>&1

if exist "%userprofile%\Desktop\start.bat" (
    del "%userprofile%\Desktop\start.bat" >nul 2>&1
)

timeout /t 1 /nobreak >nul

echo The start.bat file has been suspended!
echo To start working again, run the install.bat file.
echo.
echo Press any key to exit...
pause >nul
exit
