@echo off
title Matija's Windows Utility Toolkit
echo Welcome!!!
echo.
echo Initializing ...
echo.
echo Use command Drvload to load a missing driver
wpeinit
wpeutil SetKeyboardLayout 041a:0000041a > nul
wpeutil SetUserLocale hr-HR > nul
wpeutil InitializeNetwork > nul
nircmd setdisplay 1024 768 32
regsvr32 /s mstscax.dll
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d "1" > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d "0" > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SuperHidden" /t REG_DWORD /d "0" > nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d "1" > nul

:choice
set choice=0
cls
echo Matija's Windows Utility Toolkit
echo.
echo.
echo Select an action: 
echo.
echo 1)   PE Network Manager			13)  ImgDrive	
echo 2)   Data on 192.168.1.1 (Z:)	14)  NTPWEdit
echo 3)   Data on 192.168.1.10 (Y:)		15)  ProduKey
echo 4)   Command Prompt			16)  HWiNFO
echo 5)   Notepad				17)  Process Explorer
echo 6)   Remote Desktop Connection		18)  DiskPart
echo 7)   7-Zip File Manager			19)  TestDisk
echo 8)   Macrium Reflect			20)  Mozilla Firefox
echo 9)   Macrorit Partition Expert		21)  InfraRecorder
echo 10)  Windows Setup			22)  Change Resolution
echo 11)  WinNTSetup				23)  Shutdown
echo 12)  BOOTICE				24)  Restart
echo.

set /p choice=My choice is: 

if %choice%==1	start "" "X:\Program Files\PENetwork\PENetwork.exe"
if %choice%==2	net use Z: \\192.168.1.1\Data /U:Admin *
if %choice%==3	net use Y: \\192.168.1.10\Data /U:Admin *
if %choice%==4	start
if %choice%==5	start "" notepad.exe
if %choice%==6	start "" mstsc.exe
if %choice%==7	start "" "X:\Program Files\7-Zip\7zFM.exe"
if %choice%==8	"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrium Reflect" -y "X:\Program Files\Macrium Reflect\Reflect.7z" && start "" "X:\Program Files\Macrium Reflect\Reflect.exe"
if %choice%==9	"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrorit Partition Expert" -y "X:\Program Files\Macrorit Partition Expert\PartitionExpert.7z" && start "" "X:\Program Files\Macrorit Partition Expert\dm.exe"
if %choice%==10	goto WinSetup
if %choice%==11	"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\WinNTSetup" -y "X:\Program Files\WinNTSetup\WinNTSetup.7z" && start "" "X:\Program Files\WinNTSetup\WinNTSetup_x64.exe"
if %choice%==12	start "" "X:\Program Files\BOOTICE\BOOTICEx64_2016.06.17_v1.3.4.0.exe"
if %choice%==13	start "" "X:\Program Files\ImgDrive\ImgDrivePortable_x64.exe"
if %choice%==14	start "" "X:\Program Files\NTPWEdit\ntpwedit64.exe"
if %choice%==15	start "" "X:\Program Files\ProduKey\ProduKey.exe"
if %choice%==16	start "" "X:\Program Files\HWiNFO\HWiNFO64.exe"
if %choice%==17	start "" procexp64.exe /AcceptEULA
if %choice%==18	start "" diskpart.exe
if %choice%==19	"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\TestDisk" -y "X:\Program Files\TestDisk\testdisk-7.1.win64.7z" && start "" "X:\Program Files\TestDisk\testdisk_win.exe"
if %choice%==20	goto Firefox
if %choice%==21	"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\InfraRecorder" -y "X:\Program Files\InfraRecorder\InfraRecorder.7z" && start "" "X:\Program Files\InfraRecorder\infrarecorder.exe"
if %choice%==22	goto Resolution
if %choice%==23	wpeutil Shutdown
if %choice%==24	wpeutil Reboot

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


:WinSetup

for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%a:\Sources\install.wim set WinSetupDrive=%%a:
start "" "%WinSetupDrive%\setup.exe" /noreboot

goto choice


:Firefox

"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Mozilla Firefox" -y "X:\Program Files\Mozilla Firefox\Firefox68.9.0esr.7z"

regsvr32 /s "X:\Program Files\Mozilla Firefox\AccessibleHandler.dll"

reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.9.0 ESR (x64 en-US)\Main" /v "Install Directory" /d "X:\Program Files\Mozilla Firefox" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.9.0 ESR (x64 en-US)\Main" /v "PathToExe" /d "X:\Program Files\Mozilla Firefox\firefox.exe" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.9.0 ESR (x64 en-US)\Uninstall" /v "Description" /d "Mozilla Firefox 68.9.0 ESR (x64 en-US)" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox\68.9.0 ESR (x64 en-US)" /ve /d "68.9.0 ESR (x64 en-US)" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.9.0 ESR\bin" /v "PathToExe" /d "X:\Program Files\Mozilla Firefox\firefox.exe" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.9.0 ESR\extensions" /v "Components" /d "X:\Program Files\Mozilla Firefox\components" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.9.0 ESR\extensions" /v "Plugins" /d "X:\Program Files\Mozilla Firefox\plugins" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox 68.9.0 ESR" /v "GeckoVer" /d "68.9.0" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox ESR" /ve /d "68.9.0" /f > nul
reg add "HKLM\Software\Mozilla\Mozilla Firefox ESR" /v "CurrentVersion" /d "68.9.0 ESR (x64 en-US)" /f > nul

reg add "HKLM\Software\Classes\.shtml" /ve /d "shtmlfile" /f > nul
reg add "HKLM\Software\Classes\.shtml" /v "Content Type" /d "text/html" /f > nul
reg add "HKLM\Software\Classes\.shtml" /v "Perceived Type" /d "text" /f > nul
reg add "HKLM\Software\Classes\.xht" /ve /d "xhtfile" /f > nul
reg add "HKLM\Software\Classes\.xht" /v "Content Type" /d "application/xhtml+xml" /f > nul
reg add "HKLM\Software\Classes\.xhtml" /ve /d "xhtmlfile" /f > nul
reg add "HKLM\Software\Classes\.xhtml" /v "Content Type" /d "application/xhtml+xml" /f > nul

start "" "X:\Program Files\Mozilla Firefox\firefox.exe" https://www.google.hr

goto choice
