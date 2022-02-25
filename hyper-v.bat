@echo off
:: Enable or Disable Hyper-V

if .%1 == . goto help

if %1 == on goto enable
if %1 == off goto disable
goto help

:enable
echo Enabling Hyper-V...
bcdedit /set hypervisorlaunchtype auto
echo Done!
goto end

:disable
echo Disabling Hyper-V...
bcdedit /set hypervisorlaunchtype off
echo Done!
goto end

:help
echo.
echo Usage: %0 state
echo.
echo What it does: enables or disables hyper-V.
echo.
echo Notes: state can be on/off.
echo Notes: Requires a restart afterwards.
echo.
goto end

:end
