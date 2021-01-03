@echo off
title Matija's Windows Utility Toolkit
echo Welcome!!!
echo.
echo Initializing ...
echo.
echo Use command Drvload to load a missing driver
wpeinit
wpeutil SetKeyboardLayout 041a:0000041a > null
wpeutil SetUserLocale hr-HR > null
wpeutil InitializeNetwork > null
nircmd setdisplay 1024 768 32
regsvr32 /s mstscax.dll

:choice
set choice=0
cls
echo Matija's Windows Utility Toolkit
echo.
echo.
echo Select an action: 
echo.
echo 1)   PE Network Manager			12)  ProduKey
echo 2)   Command Prompt			13)  HWiNFO
echo 3)   Notepad				14)  ImgDrive
echo 4)   Remote Desktop connection		15)  WinNTSetup
echo 5)   DiskPart				16)  Mozilla Firefox
echo 6)   Process Explorer			17)  TestDisk
echo 7)   7-Zip File Manager			18)  InfraRecorder
echo 8)   Macrium Reflect			19)  Change Resolution
echo 9)   Macrorit Partition Expert		20)  Shutdown
echo 10)  BOOTICE				21)  Restart
echo 11)  NTPWEdit
echo.

set /p choice=My choice is: 

if %choice%==1	start "" "X:\Program Files\PENetwork\PENetwork.exe"
if %choice%==2	start
if %choice%==3	start "" notepad.exe
if %choice%==4	start "" mstsc.exe
if %choice%==5	start "" diskpart.exe
if %choice%==6	start "" procexp64.exe /AcceptEULA
if %choice%==7	start "" "X:\Program Files\7-Zip\7zFM.exe"
if %choice%==8	goto Reflect
if %choice%==9	goto PartitionExpert
if %choice%==10	start "" "X:\Program Files\BOOTICE\BOOTICEx64_2016.06.17_v1.3.4.0.exe"
if %choice%==11	start "" "X:\Program Files\NTPWEdit\ntpwedit64.exe"
if %choice%==12	start "" "X:\Program Files\ProduKey\ProduKey.exe"
if %choice%==13	start "" "X:\Program Files\HWiNFO\HWiNFO64.exe"
if %choice%==14	start "" "X:\Program Files\ImgDrive\ImgDrivePortable_x64.exe"
if %choice%==15	goto WinNTSetup
if %choice%==16	goto Firefox
if %choice%==17	goto TestDisk
if %choice%==18	goto InfraRecorder
if %choice%==19	goto Resolution
if %choice%==20	wpeutil Shutdown
if %choice%==21	wpeutil Reboot

goto choice


:Resolution

echo Select screen resolution:
echo.
echo 1	800x600
echo 2	1024x768
echo 3	1280x720
echo 4	1280x768
echo 5	1280x800
echo 6	1280x1024
echo 7	1360x768
echo 8	1360x1024
echo 9	1366x768
echo 10	1440x900
echo 11	1600x900
echo 12	1600x1200
echo 13	1920x1080
echo.

set /p choice=My choice is: 

if %choice%==1 nircmd setdisplay 800 600 32
if %choice%==2 nircmd setdisplay 1024 768 32
if %choice%==3 nircmd setdisplay 1280 720 32
if %choice%==4 nircmd setdisplay 1280 768 32
if %choice%==5 nircmd setdisplay 1280 800 32
if %choice%==6 nircmd setdisplay 1280 1024 32
if %choice%==7 nircmd setdisplay 1360 768 32
if %choice%==8 nircmd setdisplay 1360 1024 32
if %choice%==9 nircmd setdisplay 1366 768 32
if %choice%==10 nircmd setdisplay 1440 900 32
if %choice%==11 nircmd setdisplay 1600 900 32
if %choice%==12 nircmd setdisplay 1600 1200 32
if %choice%==13 nircmd setdisplay 1920 1080 32

goto choice


:Reflect

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrium Reflect" -y "X:\Program Files\Macrium Reflect\Reflect.7z"
start "" "X:\Program Files\Macrium Reflect\Reflect.exe"

goto choice


:PartitionExpert

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrorit Partition Expert" -y "X:\Program Files\Macrorit Partition Expert\PartitionExpert.7z"
start "" "X:\Program Files\Macrorit Partition Expert\dm.exe"

goto choice


:WinNTSetup

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\WinNTSetup" -y "X:\Program Files\WinNTSetup\WinNTSetup.7z"
start "" "X:\Program Files\WinNTSetup\WinNTSetup_x64.exe"

goto choice


:Firefox

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Mozilla Firefox" -y "X:\Program Files\Mozilla Firefox\Firefox68.7.0esr.7z"

regsvr32 /s "X:\Program Files\Mozilla Firefox\AccessibleHandler.dll"

reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.7.0 ESR (x64 en-US)\Main" /v "Install Directory" /d "X:\Program Files\Mozilla Firefox" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.7.0 ESR (x64 en-US)\Main" /v "PathToExe" /d "X:\Program Files\Mozilla Firefox\firefox.exe" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.7.0 ESR (x64 en-US)\Uninstall" /v "Description" /d "Mozilla Firefox 68.7.0 ESR (x64 en-US)" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.7.0 ESR (x64 en-US)" /ve /d "68.7.0 ESR (x64 en-US)" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.7.0 ESR\bin" /v "PathToExe" /d "X:\Program Files\Mozilla Firefox\firefox.exe" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.7.0 ESR\extensions" /v "Components" /d "X:\Program Files\Mozilla Firefox\components" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.7.0 ESR\extensions" /v "Plugins" /d "X:\Program Files\Mozilla Firefox\plugins" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.7.0 ESR" /v "GeckoVer" /d "68.7.0" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox ESR" /ve /d "68.7.0" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox ESR" /v "CurrentVersion" /d "68.7.0 ESR (x64 en-US)" /f

reg add "HKLM\Software\Classes\.shtml" /ve /d "shtmlfile" /f
reg add "HKLM\Software\Classes\.shtml" /v "Content Type" /d "text/html" /f
reg add "HKLM\Software\Classes\.shtml" /v "Perceived Type" /d "text" /f
reg add "HKLM\Software\Classes\.xht" /ve /d "xhtfile" /f
reg add "HKLM\Software\Classes\.xht" /v "Content Type" /d "application/xhtml+xml" /f
reg add "HKLM\Software\Classes\.xhtml" /ve /d "xhtmlfile" /f
reg add "HKLM\Software\Classes\.xhtml" /v "Content Type" /d "application/xhtml+xml" /f

start "" "X:\Program Files\Mozilla Firefox\firefox.exe" https://www.google.hr

goto choice


:TestDisk

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\TestDisk" -y "X:\Program Files\TestDisk\testdisk-7.1.win64.7z"
start "" "X:\Program Files\TestDisk\testdisk_win.exe"

goto choice


:InfraRecorder

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\InfraRecorder" -y "X:\Program Files\InfraRecorder\InfraRecorder.7z"
start "" "X:\Program Files\InfraRecorder\infrarecorder.exe"

goto choice
