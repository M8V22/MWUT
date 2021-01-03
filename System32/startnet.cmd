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
setres h1024 v768 b32 > null
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
echo 3)   Notepad				14)  WinCDEmu
echo 4)   Remote Desktop connection		15)  WinNTSetup
echo 5)   DiskPart				16)  Mozilla Firefox
echo 6)   Process Explorer			17)  TestDisk
echo 7)   7-Zip File Manager			18)  Rufus
echo 8)   Macrium Reflect			19)  InfraRecorder
echo 9)   AOMEI Partition Assistant		20)  Change Resolution
echo 10)  BOOTICE				21)  Shutdown
echo 11)  NTPWEdit				22)  Restart	
echo.

set /p choice=My choice is: 

if %choice%==1	start "" "X:\Program Files\PENetwork\PENetwork.exe"
if %choice%==2	start
if %choice%==3	start "" notepad.exe
if %choice%==4	start "" mstsc.exe
if %choice%==5	start "" diskpart.exe
if %choice%==6	start "" procexp.exe /AcceptEULA
if %choice%==7	start "" "X:\Program Files\7-Zip\7zFM.exe"
if %choice%==8	goto Reflect
if %choice%==9	goto PartitionAssistant
if %choice%==10	start "" "X:\Program Files\BOOTICE\BOOTICEx86_2016.06.17_v1.3.4.0.exe"
if %choice%==11	start "" "X:\Program Files\NTPWEdit\ntpwedit.exe"
if %choice%==12	start "" "X:\Program Files\ProduKey\ProduKey.exe"
if %choice%==13	start "" "X:\Program Files\HWiNFO\HWiNFO32.exe"
if %choice%==14	start "" "X:\Program Files\WinCDEmu\PortableWinCDEmu-4.0.exe"
if %choice%==15	start "" "X:\Program Files\WinNTSetup\WinNTSetup_x86.exe"
if %choice%==16	goto Firefox
if %choice%==17	goto TestDisk
if %choice%==18	start "" "X:\Program Files\Rufus\Rufus-3.9p.exe"
if %choice%==19	goto InfraRecorder
if %choice%==20	goto Resolution
if %choice%==21	wpeutil Shutdown
if %choice%==22	wpeutil Reboot

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

if %choice%==1 setres h800 v600 b32
if %choice%==2 setres h1024 v768 b32
if %choice%==3 setres h1280 v720 b32
if %choice%==4 setres h1280 v768 b32
if %choice%==5 setres h1280 v800 b32
if %choice%==6 setres h1280 v1024 b32
if %choice%==7 setres h1360 v768 b32
if %choice%==8 setres h1360 v1024 b32
if %choice%==9 setres h1366 v768 b32
if %choice%==10 setres h1440 v900 b32
if %choice%==11 setres h1600 v900 b32
if %choice%==12 setres h1600 v1200 b32
if %choice%==13 setres h1920 v1080 b32

goto choice


:Reflect

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrium Reflect" -y "X:\Program Files\Macrium Reflect\Reflect.7z"
start "" "X:\Program Files\Macrium Reflect\Reflect.exe"

goto choice


:PartitionAssistant

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\AOMEI Partition Assistant" -y "X:\Program Files\AOMEI Partition Assistant\PartitionAssistant.7z"
start "" "X:\Program Files\AOMEI Partition Assistant\PartAssist.exe"

goto choice


:Firefox

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Mozilla Firefox" -y "X:\Program Files\Mozilla Firefox\Firefox.7z"

regsvr32 /s "X:\Program Files\Mozilla Firefox\AccessibleHandler.dll"

reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.6.0 ESR (x86 en-US)\Main" /v "Install Directory" /d "X:\Program Files\Mozilla Firefox" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.6.0 ESR (x86 en-US)\Main" /v "PathToExe" /d "X:\Program Files\Mozilla Firefox\firefox.exe" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.6.0 ESR (x86 en-US)\Uninstall" /v "Description" /d "Mozilla Firefox 68.6.0 ESR (x86 en-US)" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.6.0 ESR (x86 en-US)" /ve /d "68.6.0 ESR (x86 en-US)" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.6.0 ESR\bin" /v "PathToExe" /d "X:\Program Files\Mozilla Firefox\firefox.exe" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.6.0 ESR\extensions" /v "Components" /d "X:\Program Files\Mozilla Firefox\components" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.6.0 ESR\extensions" /v "Plugins" /d "X:\Program Files\Mozilla Firefox\plugins" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.6.0 ESR" /v "GeckoVer" /d "68.6.0" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox ESR" /ve /d "68.6.0" /f
reg add "HKLM\Software\Mozilla\Mozilla Firefox ESR" /v "CurrentVersion" /d "68.6.0 ESR (x86 en-US)" /f

reg add "HKLM\Software\Classes\.shtml" /ve /d "shtmlfile" /f
reg add "HKLM\Software\Classes\.shtml" /v "Content Type" /d "text/html" /f
reg add "HKLM\Software\Classes\.shtml" /v "Perceived Type" /d "text" /f
reg add "HKLM\Software\Classes\.xht" /ve /d "xhtfile" /f
reg add "HKLM\Software\Classes\.xht" /v "Content Type" /d "application/xhtml+xml" /f
reg add "HKLM\Software\Classes\.xhtml" /ve /d "xhtmlfile" /f
reg add "HKLM\Software\Classes\.xhtml" /v "Content Type" /d "application/xhtml+xml" /f

start "" "X:\Program Files\Mozilla Firefox\firefox.exe" https://www.google.hr

goto choice


:InfraRecorder

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\InfraRecorder" -y "X:\Program Files\InfraRecorder\InfraRecorder.7z"
start "" "X:\Program Files\InfraRecorder\infrarecorder.exe"

goto choice


:TestDisk

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\TestDisk" -y "X:\Program Files\TestDisk\TestDisk.7z"
start "" "X:\Program Files\TestDisk\testdisk_win.exe"

goto choice
