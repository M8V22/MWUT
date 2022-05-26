@echo off
title Matija's Windows Utility Toolkit
echo Welcome!!!
echo.
echo Initializing ...
echo.
echo Use command Drvload to load a missing driver
wpeinit
nircmd setdisplay 1024 768 32
wpeutil SetKeyboardLayout 041a:0000041a > nul
wpeutil SetUserLocale hr-HR > nul
wpeutil InitializeNetwork > nul
regedit /s "X:\Windows\System32\Registry.reg"

:choice
set choice=0
cls
echo Matija's Windows Utility Toolkit			      %TIME:~0,5% %DATE:~4%
echo.
echo.
echo Select an action: 
echo.
echo 1)   WinNTSetup				16)  BOOTICE
echo 2)   Windows Setup			17)  ProduKey
echo 3)   Macrium Reflect			18)  HWiNFO
echo 4)   FreeCommander			19)  HD Tune
echo 5)   ImgDrive				20)  TestDisk
echo 6)   Macrorit Partition Expert		21)  AnyBurn
echo 7)   7-Zip File Manager			22)  DiskPart
echo 8)   Data on 192.168.1.1 (Z:)		23)  PE Network Manager
echo 9)   Data on 192.168.1.10 (Y:)		24)  NTPWEdit
echo 10)  Computer Management (ERD)		25)  GImageX
echo 11)  Disk Commander (ERD)		26)  Command Prompt
echo 12)  Locksmith (ERD)			27)  Notepad
echo 13)  SFC Scan (ERD)			28)  Task Manager
echo 14)  Hotfix Uninstall (ERD)		29)  Shutdown
echo 15)  Disk Wipe (ERD)			30)  Restart
echo.
set /p choice=My choice is: 

if %choice%==1	goto WinNTSetup
if %choice%==2	goto WinSetup
if %choice%==3	goto Reflect
if %choice%==4	goto FreeCommander
if %choice%==5	start "" "X:\Program Files\ImgDrive\ImgDrivePortable_x86.exe"
if %choice%==6	goto PartitionExpert
if %choice%==7	start "" "X:\Program Files\7-Zip\7zFM.exe"
if %choice%==8	net use Z: \\192.168.1.1\Data /U:Admin *
if %choice%==9	net use Y: \\192.168.1.10\Data /U:Admin *
if %choice%==10	ERDLogon "X:\Windows\System32\CompMgmt.exe"
if %choice%==11	start "" "X:\Windows\System32\diskcmdr.exe"
if %choice%==12	ERDLogon "X:\Windows\System32\Locksmith.exe"
if %choice%==13	ERDLogon "X:\Windows\System32\SfcScan.exe"
if %choice%==14	ERDLogon "X:\Windows\System32\HotfixUninstall.exe"
if %choice%==15	start "" "X:\Windows\System32\DiskWipe.exe"
if %choice%==16	start "" "X:\Program Files\BOOTICE\BOOTICEx86_2015.02.16_v1.3.3.2.exe"
if %choice%==17	start "" "X:\Program Files\ProduKey\ProduKey.exe" /external
if %choice%==18	start "" "X:\Program Files\HWiNFO\HWiNFO32.exe"
if %choice%==19	start "" "X:\Program Files\HD Tune\HDTune.exe"
if %choice%==20	goto TestDisk
if %choice%==21	goto AnyBurn
if %choice%==22	start "" diskpart.exe
if %choice%==23	goto PENetwork
if %choice%==24	start "" "X:\Program Files\NTPWEdit\ntpwedit.exe"
if %choice%==25	start "" "X:\Program Files\GImageX\gimagex.exe"
if %choice%==26	start
if %choice%==27	start "" notepad.exe
if %choice%==28	start "" taskmgr.exe
if %choice%==29	wpeutil Shutdown
if %choice%==30	wpeutil Reboot


goto choice


:WinSetup
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist %%a:\Sources\install.wim set WinSetupDrive=%%a:
start "" "%WinSetupDrive%\setup.exe"

goto choice


:WinNTSetup
if not exist "X:\Program Files\WinNTSetup\WinNTSetup_x86.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\WinNTSetup" -y "X:\Program Files\WinNTSetup\WinNTSetup.7z"
)
start "" "X:\Program Files\WinNTSetup\WinNTSetup_x86.exe"

goto choice


:Reflect
if not exist "X:\Program Files\Macrium Reflect\ReflectBin.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrium Reflect" -y "X:\Program Files\Macrium Reflect\Reflect.7z"
)
start "" "X:\Program Files\Macrium Reflect\Reflect.exe"

goto choice


:PENetwork
if not exist "X:\Program Files\PENetwork\PENetwork.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\PENetwork" -y "X:\Program Files\PENetwork\PENetwork.7z"
)
start "" "X:\Program Files\PENetwork\PENetwork.exe"

goto choice


:PartitionExpert
if not exist "X:\Program Files\Macrorit Partition Expert\dm.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\Macrorit Partition Expert" -y "X:\Program Files\Macrorit Partition Expert\PartitionExpert.7z"
)
start "" "X:\Program Files\Macrorit Partition Expert\dm.exe"

goto choice


:FreeCommander
if not exist "X:\Program Files\FreeCommander\FreeCommander.exe" (
"X:\Program Files\7-Zip\7z.exe" x -o"X:\Program Files\FreeCommander" -y "X:\Program Files\FreeCommander\FreeCommander.7z"
)
start "" "X:\Program Files\FreeCommander\FreeCommander.exe"

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