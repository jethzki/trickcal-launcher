@echo off
cd /d "%~dp0"

echo Starting MuMu Player...

start "" "C:\Program Files\Netease\MuMuPlayerGlobal-12.0\nx_main\MuMuNxMain.exe" -v 0

timeout /t 20 >nul

echo Starting Trickcal script...

powershell -NoExit -ExecutionPolicy Bypass -File "auto-start-trickcal.ps1"
pause