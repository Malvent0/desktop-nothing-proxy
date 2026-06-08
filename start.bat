@echo off
chcp 65001 >nul
title Nothing WS Proxy
color 0F

cd /d "%~dp0"

:menu
cls
echo.
echo     ████████ ███████ ██      ███████  ██████  ██████   █████  ███    ███ 
echo        ██    ██      ██      ██      ██      ██   ██ ██   ██ ████  ████ 
echo        ██    █████   ██      █████   ██      ██████  ███████ ██ ████ ██ 
echo        ██    ██      ██      ██      ██      ██   ██ ██   ██ ██  ██  ██ 
echo        ██    ███████ ███████ ███████  ██████  ██   ██ ██   ██ ██      ██ 
echo.
echo.
echo 1. Run Service
echo 2. Socks5 (Cloudflare)
echo 3. Run Config
echo 4. Exit
echo.
set /p "choice=Select the number you specified: "

if "%choice%"=="1" goto run_service
if "%choice%"=="2" goto socks5
if "%choice%"=="3" goto run_config
if "%choice%"=="4" goto exit
goto menu

:run_service
cls
if exist "service\service.bat" (
    call service\service.bat
) else (
    echo Service file not found
    pause
)
goto menu

:socks5
cls
if not exist "bin\proxy_config.ini" (
    echo Config file not found: bin\proxy_config.ini
    pause
    goto menu
)

for /f "usebackq tokens=2 delims==" %%a in (`findstr /i "server=" "bin\proxy_config.ini"`) do (
    set "first_proxy=%%a"
    goto :found
)
:found
if defined first_proxy (
    echo Proxy: tg://socks?server=%first_proxy%
) else (
    echo No proxy found in config
)
echo.
echo Press any key to return to menu...
pause >nul
goto menu

:run_config
cls
if exist "bin\proxy_config.ini" (
    start notepad "bin\proxy_config.ini"
) else (
    echo Config file not found: bin\proxy_config.ini
    pause
)
goto menu

:exit
cls
exit
```
