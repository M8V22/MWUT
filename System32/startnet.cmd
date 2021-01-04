@echo off
title Matija's Windows Utility Toolkit
echo Welcome!!!
echo.
wpeutil UpdateBootInfo > nul
for /f "tokens=2* delims=	 " %%A in ('reg query HKLM\System\CurrentControlSet\Control /v PEFirmwareType') do set Firmware=%%B
if %Firmware%==0x1	echo The PC is booted in Legacy BIOS mode
if %Firmware%==0x2	echo The PC is booted in UEFI mode
echo.
echo Initializing ...
echo.
echo Use command Drvload to load a missing driver
wpeinit
powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
wpeutil SetKeyboardLayout 041a:0000041a > nul
wpeutil SetUserLocale hr-HR > nul
wpeutil InitializeNetwork > nul
reg import "X:\Windows\System32\Registry.reg" > nul

:choice
set choice=0
cls
echo Matija's Windows Utility Toolkit
echo.
echo.
echo Select an action: 
echo.
echo 1)   Data on 192.168.1.1 (Z:)		16)  Disk Wipe (ERD)
echo 2)   Data on 192.168.1.10 (Y:)		17)  BOOTICE
echo 3)   Windows Setup			18)  GImageX
echo 4)   WinNTSetup				19)  HWiNFO
echo 5)   Macrium Reflect			20)  PE Network Manager
echo 6)   Multi Commander			21)  Mozilla Firefox
echo 7)   7-Zip File Manager			22)  TestDisk
echo 8)   Macrorit Partition Expert		23)  AnyBurn
echo 9)   ImgDrive				24)  Notepad
echo 10)  ProduKey				25)  Command Prompt
echo 11)  Computer Management (ERD)		26)  Task Manager
echo 12)  Disk Commander (ERD)		27)  DiskPart
echo 13)  Locksmith (ERD)			28)  Shutdown
echo 14)  SFC Scan (ERD)			29)  Restart
echo 15)  Hotfix Uninstall (ERD)
echo.
set /p choice=My choice is: 

if %choice%==1	net use Z: \\192.168.1.1\Data /U:Admin *
if %choice%==2	net use Y: \\192.168.1.10\Data /U:Admin *
if %choice%==3	goto WinSetup
if %choice%==4	goto WinNTSetup
if %choice%==5	goto Reflect
if %choice%==6	goto MultiCommander
if %choice%==7	start "" "X:\Program Files\7-Zip\7zFM.exe"
if %choice%==8	goto PartitionExpert
if %choice%==9	start "" "X:\Program Files\ImgDrive\ImgDrivePortable_x64.exe"
if %choice%==10	start "" "X:\Program Files\ProduKey\ProduKey.exe"
if %choice%==11	ERDLogon "X:\Windows\System32\CompMgmt.exe"
if %choice%==12	ERDLogon "X:\Windows\System32\diskcmdr.exe"
if %choice%==13	ERDLogon "X:\Windows\System32\Locksmith.exe"
if %choice%==14	ERDLogon "X:\Windows\System32\SfcScan.exe"
if %choice%==15	ERDLogon "X:\Windows\System32\HotfixUninstall.exe"
if %choice%==16	ERDLogon "X:\Windows\System32\DiskWipe.exe"
if %choice%==17	start "" "X:\Program Files\BOOTICE\BOOTICEx64_2016.06.17_v1.3.4.0.exe"
if %choice%==18	start "" "X:\Program Files\GImageX\gimagex_x64.exe"
if %choice%==19	start "" "X:\Program Files\HWiNFO\HWiNFO64.exe"
if %choice%==20	goto PENetwork
if %choice%==21	goto Firefox
if %choice%==22	goto TestDisk
if %choice%==23	goto AnyBurn
if %choice%==24	start "" notepad.exe
if %choice%==25	start
if %choice%==26	start "" taskmgr.exe
if %choice%==27	start "" diskpart.exe
if %choice%==28	wpeutil Shutdown
if %choice%==29	wpeutil Reboot

goto choice


:WinSetup
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%a:\Sources\install.wim set WinSetupDrive=%%a:
start "" "%WinSetupDrive%\setup.exe"

goto choice


:WinNTSetup
if not exist "X:\Program Files\WinNTSetup\WinNTSetup_x64.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\WinNTSetup" -y "X:\Program Files\WinNTSetup\WinNTSetup.7z"
)
start "" "X:\Program Files\WinNTSetup\WinNTSetup_x64.exe"

goto choice


:Reflect
if not exist "X:\Program Files\Macrium Reflect\ReflectBin.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrium Reflect" -y "X:\Program Files\Macrium Reflect\Reflect.7z"
)
start "" "X:\Program Files\Macrium Reflect\Reflect.exe"

goto choice


:Firefox
if not exist "X:\Program Files\Mozilla Firefox\firefox.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Mozilla Firefox" -y "X:\Program Files\Mozilla Firefox\Firefox.7z"
regsvr32 /s "X:\Program Files\Mozilla Firefox\AccessibleMarshal.dll"
regsvr32 /s "X:\Program Files\Mozilla Firefox\AccessibleHandler.dll"
)
start "" "X:\Program Files\Mozilla Firefox\firefox.exe" -profile "X:\Program Files\Mozilla Firefox\profile"

goto choice


:PENetwork
if not exist "X:\Program Files\PENetwork\PENetwork.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\PENetwork" -y "X:\Program Files\PENetwork\PENetwork_x64.7z"
)
start "" "X:\Program Files\PENetwork\PENetwork.exe"

goto choice


:PartitionExpert
if not exist "X:\Program Files\Macrorit Partition Expert\dm.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrorit Partition Expert" -y "X:\Program Files\Macrorit Partition Expert\PartitionExpert.7z"
)
start "" "X:\Program Files\Macrorit Partition Expert\dm.exe"

goto choice


:MultiCommander
if not exist "X:\Program Files\Multi Commander\MultiCommander.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Multi Commander" -y "X:\Program Files\Multi Commander\MultiCommander.7z"
)
start "" "X:\Program Files\Multi Commander\MultiCommander.exe"

goto choice


:TestDisk
if not exist "X:\Program Files\TestDisk\testdisk_win.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\TestDisk" -y "X:\Program Files\TestDisk\TestDisk.7z"
)
start "" "X:\Program Files\TestDisk\testdisk_win.exe"

goto choice


:AnyBurn
if not exist "X:\Program Files\AnyBurn\AnyBurn.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\AnyBurn" -y "X:\Program Files\AnyBurn\AnyBurn.7z"
)
start "" "X:\Program Files\AnyBurn\AnyBurn.exe"

goto choice