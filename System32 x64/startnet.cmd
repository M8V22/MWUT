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
regedit /s "X:\Windows\System32\Registry.reg"

goto NetDrives

:choice
set choice=0
cls
echo Matija's Windows Utility Toolkit								      %TIME:~0,5% %DATE:~4%
echo.
echo.
echo Select an action: 
echo.
echo 1)   WinNTSetup				16)  BOOTICE
echo 2)   Windows Setup			17)  ProduKey
echo 3)   Macrium Reflect			18)  HWiNFO
echo 4)   Multi Commander			19)  TestDisk
echo 5)   ImgDrive				20)  Mozilla Firefox
echo 6)   Macrorit Partition Expert		21)  AnyBurn
echo 7)   7-Zip File Manager			22)  DiskPart
echo 8)   Remap network drives		23)  PE Network Manager
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
if %choice%==4	goto MultiCommander
if %choice%==5	start "" "X:\Program Files\ImgDrive\ImgDrivePortable_x64.exe"
if %choice%==6	goto PartitionExpert
if %choice%==7	start "" "X:\Program Files\7-Zip\7zFM.exe"
if %choice%==8	goto NetDrives
if %choice%==9	net use Y: \\192.168.1.10\Data /U:Admin *
if %choice%==10	ERDLogon "X:\Windows\System32\CompMgmt.exe"
if %choice%==11	start "" "X:\Windows\System32\diskcmdr.exe"
if %choice%==12	ERDLogon "X:\Windows\System32\Locksmith.exe"
if %choice%==13	ERDLogon "X:\Windows\System32\SfcScan.exe"
if %choice%==14	ERDLogon "X:\Windows\System32\HotfixUninstall.exe"
if %choice%==15	start "" "X:\Windows\System32\DiskWipe.exe"
if %choice%==16	start "" "X:\Program Files\BOOTICE\BOOTICEx64_2016.06.17_v1.3.4.0.exe"
if %choice%==17	start "" "X:\Program Files\ProduKey\ProduKey.exe" /external
if %choice%==18	start "" "X:\Program Files\HWiNFO\HWiNFO64.exe"
if %choice%==19	goto TestDisk
if %choice%==20	goto Firefox
if %choice%==21	goto AnyBurn
if %choice%==22	start "" diskpart.exe
if %choice%==23	goto PENetwork
if %choice%==24	start "" "X:\Program Files\NTPWEdit\ntpwedit64.exe"
if %choice%==25	start "" "X:\Program Files\GImageX\gimagex_x64.exe"
if %choice%==26	start
if %choice%==27	start "" notepad.exe
if %choice%==28	start "" taskmgr.exe
if %choice%==29	wpeutil Shutdown
if %choice%==30	wpeutil Reboot

goto choice


:NetDrives
echo.
echo Connecting network drives...
echo.
net use * /delete /Y > nul 2> nul
net use Z: \\Server\Servis /U:Server\Matija 2210 > nul 2> nul && (
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##Server#Servis" /f /v "_LabelFromReg" /t REG_SZ /d "Servis on Server" > nul 2> nul
  echo Mapped Servis on Server to local drive Z:
) || (
  net use Z: \\Matija-Laptop\Servis /U:Matija-Laptop\Matija 2210 > nul 2> nul && (
    reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##Matija-Laptop#Servis" /f /v "_LabelFromReg" /t REG_SZ /d "Servis on Matija-Laptop" > nul 2> nul
    echo Mapped Servis on Matija-Laptop to local drive Z:
  )
)
net use Y: \\Matija-PC.\Servis /U:Matija-PC\Matija 2210 > nul 2> nul && (
  reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2\##Matija-PC.#Servis" /f /v "_LabelFromReg" /t REG_SZ /d "Servis on Matija-PC" > nul 2> nul
  echo Mapped Servis on Matija-PC to local drive Y:
)
timeout /t 3 > nul

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