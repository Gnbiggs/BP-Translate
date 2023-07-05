@echo off

REM Check if the PowerShell script has been run before
if exist "C:\BP-Translate\File.txt" (
    echo Running BP-Translator.
) else (
    echo Setting up BP-Translator so it can be ran.
	
    REM Run the PowerShell script
    powershell -File "C:\BP-Translate\folders\PowerShell-Scripts\applicationSetup.ps1"
	
    REM Create a log file to indicate that the PowerShell script has been run
    echo > "C:\BP-Translate\files\log.txt"
)

timeout 5 > NUL

REM starting BP-Translator
echo BP-Translator and Game starting, don't click anything or move your mouse unless the game doesn't start within 1 Minute

powershell -File "C:\BP-Translate\folders\PowerShell-Scripts\RunBP-Translate.ps1

timeout 20 > NUL

exit