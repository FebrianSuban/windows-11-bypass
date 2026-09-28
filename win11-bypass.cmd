@echo off
setlocal

title Windows 11 TPM 2.0 + Secure Boot Bypass

echo.
echo ================================================
echo   Windows 11 Requirement Bypass
echo   TPM 2.0 + Secure Boot
echo ================================================
echo.
echo This script only modifies:
echo   HKLM\SYSTEM\Setup\LabConfig
echo.
echo No partitions, bootloader, or user files are changed.
echo.

echo [1/3] Creating LabConfig...
reg add "HKLM\SYSTEM\Setup\LabConfig" /f >nul
if errorlevel 1 goto :error

echo [2/3] Setting TPM 2.0 bypass...
reg add "HKLM\SYSTEM\Setup\LabConfig" /v BypassTPMCheck /t REG_DWORD /d 1 /f >nul
if errorlevel 1 goto :error

echo [3/3] Setting Secure Boot bypass...
reg add "HKLM\SYSTEM\Setup\LabConfig" /v BypassSecureBootCheck /t REG_DWORD /d 1 /f >nul
if errorlevel 1 goto :error

echo.
echo ================================================
echo   SUCCESS
echo ================================================
echo.
echo TPM 2.0 check       : BYPASSED
echo Secure Boot check   : BYPASSED
echo.
echo Close this window and return to Windows Setup.
echo Then retry the installation.
echo.
pause
exit /b 0

:error
echo.
echo ================================================
echo   ERROR
echo ================================================
echo.
echo The registry change could not be completed.
echo Make sure this script is running from Windows
echo Setup with administrator privileges.
echo.
pause
exit /b 1
