@echo off
setlocal enabledelayedexpansion

::  ==================================================
::   BELLI iOS Activation Tool v2.0 - Enhanced Edition
::  ==================================================
:: Features:
::  - Auto device connection detection
::  - Detailed device information
::  - Activation readiness check
::  - Visual progress indicators
:: =============================================

REM Initial setup
title iOS Activation Tool v2.0
color 0a
mode con: cols=75 lines=25
set "required_sn=DMPGNT84DKPH"

:MAIN_MENU
cls
echo.
echo  ==================================================
echo   BELLI iOS Activation Tool v2.0 - Enhanced Edition
echo  ==================================================
echo.
echo  1. Generate Activation Files
echo  2. Device Information
echo  3. Activation Readiness Check
echo  4. Exit
echo.
set /p choice="Select an option (1-4): "

if "%choice%"=="1" goto GENERATE_FILES
if "%choice%"=="2" goto DEVICE_INFO
if "%choice%"=="3" goto CHECK_READINESS
if "%choice%"=="4" exit /b
goto MAIN_MENU

:: =============================================
:: Device Connection Check Subroutine
:: =============================================
:CHECK_DEVICE
cls
echo.
echo  ==================================================
echo   BELLI iOS Activation Tool v2.0 - Enhanced Edition
echo  ==================================================
echo  [*] Searching for device...
echo  --------------------------
echo  Please connect your device via USB
echo  Waiting... Press Ctrl+C to cancel
echo.

:DEVICE_LOOP
set "device_connected=false"
for /f "tokens=1* delims== " %%A in ('device\ideviceinfo.exe 2^>nul') do (
    if "%%A"=="SerialNumber:" (
        set "SerialNumber=%%B"
        set "device_connected=true"
    )
)

if "%device_connected%"=="true" (
    echo  [?] Device connected: %SerialNumber%
    ping -n 2 127.0.0.1 >nul
    goto :EOF
) else (
    echo  [ ] No device detected...
    ping -n 2 127.0.0.1 >nul
    goto DEVICE_LOOP
)

:: =============================================
:: Generate Activation Files
:: =============================================
:GENERATE_FILES
call :CHECK_DEVICE
call :GET_DEVICE_INFO
call :CHECK_READINESS silent

if "%can_activate%"=="true" (
    echo  [*] Preparing to generate files...
    ping -n 2 127.0.0.1 >nul
    goto GENERATE_NOW
) else (
    echo  [X] Cannot generate files: %reason%
    echo.
    pause
    goto MAIN_MENU
)

:GENERATE_NOW
cls
echo.
echo  ==================================================
echo   BELLI iOS Activation Tool v2.0 - Enhanced Edition
echo  ==================================================
echo  [*] Generating Activation Files
echo  ------------------------------
echo  Device: %SerialNumber%
echo  Model: %ProductType%
echo  iOS: %ProductVersion%
echo  ------------------------------

REM Cleanup old files
if exist files rmdir /s /q files
mkdir files >nul 2>&1
mkdir files\FairPlay >nul 2>&1
mkdir files\FairPlay\iTunes_Control >nul 2>&1
mkdir files\FairPlay\iTunes_Control\iTunes >nul 2>&1

echo  [1/2] Downloading activation record...
curl -k "https://belliactivator.x10.mx/Generateot/csn.php?ucid=%ucid%&udid=%udid%" --output .\files\activation_record.plist >nul 2>&1

echo  [2/2] Downloading iCloud certificate...
curl.exe -k "https://belliactivator.x10.mx/Generateot/csn.php?ucid=%ucid%&udid=%udid%" --output .\files\FairPlay\iTunes_Control\iTunes\IC-Info.sisv >nul 2>&1

REM Verify file generation
set "success=true"
if not exist ".\files\activation_record.plist" set "success=false"
if not exist ".\files\FairPlay\iTunes_Control\iTunes\IC-Info.sisv" set "success=false"

if "%success%"=="true" (
    echo  ------------------------------
    echo  [?] Files generated successfully!
    echo  Location: %cd%\files
    echo.
    pause
    goto MAIN_MENU
) else (
    echo  [X] File generation failed!
    rmdir /s /q files >nul 2>&1
    pause
    goto MAIN_MENU
)

:: =============================================
:: Get Complete Device Information
:: =============================================
:GET_DEVICE_INFO
set "SerialNumber="
set "udid="
set "ucid="
set "ActivationState="
set "TelephonyCapability="
set "ProductType="
set "ProductVersion="

for /f "tokens=1* delims== " %%A in ('device\ideviceinfo.exe') do (
    if "%%A"=="SerialNumber:" set "SerialNumber=%%B"
    if "%%A"=="UniqueDeviceID:" set "udid=%%B"
    if "%%A"=="UniqueChipID:" set "ucid=%%B"
    if "%%A"=="ActivationState:" set "ActivationState=%%B"
    if "%%A"=="TelephonyCapability:" set "TelephonyCapability=%%B"
    if "%%A"=="ProductType:" set "ProductType=%%B"
    if "%%A"=="ProductVersion:" set "ProductVersion=%%B"
)
goto :EOF

:: =============================================
:: Device Information Display
:: =============================================
:DEVICE_INFO
call :CHECK_DEVICE
call :GET_DEVICE_INFO

cls
echo.
echo  ==================================================
echo   BELLI iOS Activation Tool v2.0 - Enhanced Edition
echo  ==================================================
echo  [*] Device Information
echo  ======================
echo  Serial Number: %SerialNumber%
echo  UDID: %udid%
echo  UCID: %ucid%
echo  Model: %ProductType%
echo  iOS Version: %ProductVersion%
echo  Activation: %ActivationState%
echo  Telephony: %TelephonyCapability%
echo  ======================
echo.
pause
goto MAIN_MENU

:: =============================================
:: Activation Readiness Check
:: =============================================
:CHECK_READINESS
call :CHECK_DEVICE
call :GET_DEVICE_INFO

set "can_activate=true"
set "reason="

:: Check 1: Telephony Capability
if /i "%TelephonyCapability%"=="true" (
    set "can_activate=false"
    set "reason=Device has telephony capability"
)

:: Check 2: Serial Number
if /i not "%SerialNumber%"=="%required_sn%" (
    set "can_activate=false"
    set "reason=Serial must be %required_sn%"
)

:: Check 3: Activation State
if not "%ActivationState%"=="Unactivated" (
    set "can_activate=false"
    set "reason=Device already activated"
)

:: Silent mode for internal calls
if "%1"=="silent" goto :EOF

:: Display results
cls
echo.
echo  ==================================================
echo   BELLI iOS Activation Tool v2.0 - Enhanced Edition
echo  ==================================================
echo  [*] Activation Readiness Check
echo  =============================
echo  Device: %SerialNumber%
echo  Model: %ProductType%
echo  iOS: %ProductVersion%
echo  ------------------------------
echo  Telephony Check: %TelephonyCapability%
echo  Serial Check: %SerialNumber%
echo  Activation State: %ActivationState%
echo  ------------------------------

if "%can_activate%"=="true" (
    echo  [?] READY FOR ACTIVATION
    echo  All requirements are met
) else (
    echo  [X] NOT READY FOR ACTIVATION
    echo  Reason: %reason%
)

echo  =============================
echo.
pause
goto MAIN_MENU

:: =============================================
:: Error Handling Subroutine
:: =============================================
:SHOW_ERROR
echo.
echo  [X] ERROR: %~1
echo.
pause
goto MAIN_MENU