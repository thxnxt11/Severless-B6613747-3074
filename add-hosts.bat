@echo off
REM Add Kubernetes .local domains to hosts file
REM This script requires Administrator privileges

setlocal enabledelayedexpansion

set "hostsFile=C:\Windows\System32\drivers\etc\hosts"

REM Check if running as admin (this is a simple check)
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script requires Administrator privileges.
    echo Please run Command Prompt or PowerShell as Administrator and try again.
    pause
    exit /b 1
)

REM Append the entries
(
echo 127.0.0.1 nginx.local
echo 127.0.0.1 jenkins.local
) >> "%hostsFile%"

echo.
echo Successfully added hosts file entries!
echo Hosts file updated with:
echo   - 127.0.0.1 nginx.local
echo   - 127.0.0.1 jenkins.local
echo.
echo You can now access:
echo   - http://nginx.local
echo   - http://jenkins.local
echo   - http://grafana.local
echo.
pause
