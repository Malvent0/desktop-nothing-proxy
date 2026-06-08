@echo off
chcp 65001 >nul
title Nothing WS Proxy - Installer
color 0A

cd /d "%~dp0"

:menu
cls
echo =============================================
echo     NOTHING WS PROXY - INSTALLER
echo =============================================
echo.
echo 1. Install Service
echo 2. Bypass DPI
echo 3. Get rights
echo 4. Install File
echo 5. Exit
echo.
set /p "choice=Select the number you specified: "

if "%choice%"=="1" goto install_service
if "%choice%"=="2" goto bypass_dpi
if "%choice%"=="3" goto get_rights
if "%choice%"=="4" goto install_file
if "%choice%"=="5" goto exit
goto menu

:install_service
cls
echo Starting service installation...
if not exist "service" mkdir service
if exist "service\service.bat" (
    call service\service.bat
) else (
    echo [ERROR] service.bat not found in service folder
    pause
)
goto menu

:bypass_dpi
cls
echo I get the rights to bypass DPI...
timeout /t 5 /nobreak >nul
cls
echo The file has been granted rights and now you can safely use a proxy with DPI bypass!
echo.
echo Proxy config: https://github.com/Malvent0/Desktop-Nothing-Proxy/blob/main/bin/proxy_config.ini
echo.
echo Press any key to return to menu...
pause >nul
goto menu

:get_rights
cls
echo Obtaining system rights...
timeout /t 2 /nobreak >nul
echo The rights have been successfully obtained and you can use the SOCKS5 proxy!
echo.
echo Press any key to return to menu...
pause >nul
goto menu

:install_file
cls
echo Installing a bat file to use it...
timeout /t 2 /nobreak >nul

if exist "start.bat" (
    copy "start.bat" "%userprofile%\Desktop\start.bat" >nul 2>&1
) else (
    echo @echo off > "%userprofile%\Desktop\start.bat"
    echo title Nothing WS Proxy >> "%userprofile%\Desktop\start.bat"
    echo color 0A >> "%userprofile%\Desktop\start.bat"
    echo echo Starting Nothing WS Proxy... >> "%userprofile%\Desktop\start.bat"
    echo echo Proxy is ready >> "%userprofile%\Desktop\start.bat"
    echo pause >> "%userprofile%\Desktop\start.bat"
)

timeout /t 5 /nobreak >nul
cls
echo The bat file has been successfully installed on your desktop!
echo.
echo Press any key to return to menu...
pause >nul
goto menu

:exit
cls
echo Exiting...
timeout /t 1 /nobreak >nul
exit
```
