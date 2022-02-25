@echo off
:: Enable Ad-Hoc WiFi
:: Needs Admin privileges

:: Check: netsh wlan show drivers
:: Hosted network support should show "Yes"

if .%1 == . goto help

if %1 == on goto setup
if %1 == off goto teardown
goto help

:setup
if .%2 == . goto help
if .%3 == . goto help

echo Enabling and setting up...
netsh wlan set hostednetwork mode=allow ssid=%2 key=%3 keyUsage=temporary
echo Starting...
netsh wlan start hostednetwork
echo Done!
goto end

:teardown
echo Stopping...
netsh wlan stop hostednetwork
echo Disabling...
netsh wlan set hostednetwork mode=disallow
echo Done!
goto end

:help
echo.
echo Usage: %0 state SSID key
echo.
echo What it does: Sets up and enables or disables ad-hoc WiFi network.
echo What it needs: Admin rights.
echo.
echo Notes: Key is only stored for the session, state can be on/off.
echo.
goto end

:end
pause
