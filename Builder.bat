@echo off
title MWUT Builder
echo Matija's Windows Utility Toolkit Builder

:choice
echo.
echo.
echo.
echo 1	Copy Windows PE 10 (x64) and Windows PE 3.1 (x86) to %~dp0Media
echo 2	Mount Windows PE 10 image
echo 3	Mount Windows PE 3.1 image
echo 4	Set scratch space to 512 MB (PE 3.1 and 10)
echo 5	Copy ReAgent files (PE 10)
echo 6	Add File Management API (PE 10)
echo 7	Integrate NVMe hotfix (KB2990941 and KB3087873, PE 3.1)
echo 8	Add all x64 drivers in %~dp0Drivers (PE 10)
echo 9	Add all x86 drivers in %~dp0Drivers (PE 3.1)
echo 10	Unmount Windows PE image and save changes
echo 11	Modify BCD Boot files
echo 12	Create ISO using OSCDIMG
echo 13	Create Bootable USB Flash Drive
echo 14	Unmount Windows PE image without saving changes
echo.
set /p choice=Choose an option: 

if %choice%==1 goto Copy
if %choice%==2 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Mount-Image /ImageFile:"%~dp0Media\Boot\WinPE10.wim" /Index:1 /MountDir:"%~dp0Mount"
if %choice%==3 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Mount-Image /ImageFile:"%~dp0Media\Boot\WinPE3.wim" /Index:1 /MountDir:"%~dp0Mount"
if %choice%==4 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Set-ScratchSpace:512 /Image:"%~dp0Mount"
if %choice%==5 goto ReAgent
if %choice%==6 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Add-Package /Image:"%~dp0Mount" /PackagePath:"%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\WinPE_OCs\WinPE-FMAPI.cab"
if %choice%==7 goto NVMe
if %choice%==8 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Add-Driver /Driver:"%~dp0Drivers\x64" /Recurse /Image:"%~dp0Mount"
if %choice%==9 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Add-Driver /Driver:"%~dp0Drivers\x86" /Recurse /Image:"%~dp0Mount"
if %choice%==10 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Unmount-Image /MountDir:"%~dp0Mount" /Commit
if %choice%==11 goto BCD
if %choice%==12 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe" -bootdata:2#p0,e,b"%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\etfsboot.com"#pEF,e,b"%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\efisys.bin" -u1 -udfver102 -l"Matija's Windows Utility Toolkit" "%~dp0Media" "%~dp0MWUT 4.0.iso"
if %choice%==13 goto USB
if %choice%==14 "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Unmount-Image /MountDir:"%~dp0Mount" /Discard

goto choice


:Copy
if exist "%~dp0Media" (
	echo Delete
	rmdir /s "%~dp0Media"
)
mkdir "%~dp0Media\en-us"
mkdir "%~dp0Media\Boot\en-us"
mkdir "%~dp0Media\Boot\Fonts"
mkdir "%~dp0Media\Boot\Resources"
mkdir "%~dp0Media\EFI\Boot"
mkdir "%~dp0Media\EFI\Microsoft\Boot\Resources"
mkdir "%~dp0Media\EFI\Microsoft\Boot\en-us"
mkdir "%~dp0Media\EFI\Microsoft\Boot\Fonts"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\Boot\en-us\*.*" "%~dp0Media\Boot\en-us"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\Boot\Fonts\*.*" "%~dp0Media\Boot\Fonts"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\Boot\Resources\bootres.dll" "%~dp0Media\Boot\Resources\bootres.dll"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\Boot\*.*" "%~dp0Media\Boot"
copy "%PROGRAMFILES%\Windows AIK\Tools\PETools\x86\bootmgr" "%~dp0Media\bootmgr"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\en-us\bootmgr.efi.mui" "%~dp0Media\en-us\bootmgr.efi.mui"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\bootmgr.efi" "%~dp0Media\bootmgr.efi"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Microsoft\Boot\*.*" "%~dp0Media\EFI\Microsoft\Boot"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Microsoft\Boot\Resources\bootres.dll" "%~dp0Media\EFI\Microsoft\Boot\Resources\bootres.dll"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Microsoft\Boot\en-us\*.*" "%~dp0Media\EFI\Microsoft\Boot\en-us"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Microsoft\Boot\Fonts\*.*" "%~dp0Media\EFI\Microsoft\Boot\Fonts"
xcopy /herky "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\Media\EFI\Boot" "%~dp0Media\EFI\Boot"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment\amd64\en-us\winpe.wim" "%~dp0Media\Boot\WinPE10.wim"
copy "%PROGRAMFILES%\Windows AIK\Tools\PETools\x86\winpe.wim" "%~dp0Media\Boot\WinPE3.wim"
goto choice


:BCD
bcdedit /store "%~dp0Media\Boot\BCD" /set {default} device ramdisk=[boot]\Boot\WinPE10.wim,{7619dcc8-fafe-11d9-b411-000476eba25f}
bcdedit /store "%~dp0Media\Boot\BCD" /set {default} osdevice ramdisk=[boot]\Boot\WinPE10.wim,{7619dcc8-fafe-11d9-b411-000476eba25f}
bcdedit /store "%~dp0Media\Boot\BCD" /set {default} description "Mini Windows 10 (x64)"
for /f "tokens=3" %%a in ('bcdedit /store "%~dp0Media\Boot\BCD" /create /d "Mini Windows 7 (x86)" /application osloader') do set GUID=%%a
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% device ramdisk=[boot]\Boot\WinPE3.wim,{7619dcc8-fafe-11d9-b411-000476eba25f}
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% osdevice ramdisk=[boot]\Boot\WinPE3.wim,{7619dcc8-fafe-11d9-b411-000476eba25f}
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% path \Windows\System32\boot\winload.exe
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% systemroot \Windows
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% inherit {bootloadersettings}
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% locale en-US
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% winpe Yes
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% detecthal Yes
bcdedit /store "%~dp0Media\Boot\BCD" /set {bootmgr} displayorder %GUID% /addlast
for /f "tokens=3" %%a in ('bcdedit /store "%~dp0Media\Boot\BCD" /create /d "More Tools" /application bootsector') do set GUID=%%a
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% path "\Boot\grub\grldr"
bcdedit /store "%~dp0Media\Boot\BCD" /set %GUID% device boot
bcdedit /store "%~dp0Media\Boot\BCD" /set {bootmgr} displaybootmenu true
bcdedit /store "%~dp0Media\Boot\BCD" /set {bootmgr} timeout 10
bcdedit /store "%~dp0Media\Boot\BCD" /set {bootmgr} displayorder %GUID% /addlast
bcdedit /store "%~dp0Media\EFI\Microsoft\Boot\BCD" /set {default} device ramdisk=[boot]\Boot\WinPE10.wim,{7619dcc8-fafe-11d9-b411-000476eba25f}
bcdedit /store "%~dp0Media\EFI\Microsoft\Boot\BCD" /set {default} osdevice ramdisk=[boot]\Boot\WinPE10.wim,{7619dcc8-fafe-11d9-b411-000476eba25f}
bcdedit /store "%~dp0Media\EFI\Microsoft\Boot\BCD" /set {default} description "Mini Windows 10"
echo.
echo Legacy BIOS configuration:
bcdedit /store "%~dp0Media\Boot\BCD" /enum all
echo.
echo UEFI configuration:
bcdedit /store "%~dp0Media\EFI\Microsoft\Boot\BCD" /enum all

goto choice


:ReAgent
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Setup\amd64\Sources\ReAgent*.*" "%~dp0Mount\Windows\System32"
copy "%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Windows Setup\amd64\Sources\En-Us\ReAgent*.*" "%~dp0Mount\Windows\System32\En-Us"

goto choice


:NVMe
"%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Add-Package /PackagePath:"D:\Servis\Microsoft\Windows Updates\Windows 7 SP1 x86\Windows6.1-KB2990941-v3-x86.msu" /Image:"%~dp0Mount"
"%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\DISM\dism.exe" /Add-Package /PackagePath:"D:\Servis\Microsoft\Windows Updates\Windows 7 SP1 x86\Windows6.1-KB3087873-v2-x86.msu" /Image:"%~dp0Mount"

goto choice


:USB
set /p Dest=Enter the destination Drive Letter (eg. F:): 
if not exist %Dest% (
	echo Error!! %Dest% does not exist.
	goto USB
)
echo select volume %Dest% > "%Temp%\MWUT.txt"
echo clean >> "%Temp%\MWUT.txt"
echo create partition primary >> "%Temp%\MWUT.txt"
echo format fs=fat32 label="MWUT" quick >> "%Temp%\MWUT.txt"
echo active >> "%Temp%\MWUT.txt"
diskpart /s "%Temp%\MWUT.txt"
"%PROGRAMFILES(X86)%\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\BCDBoot\bootsect.exe" /nt60 %Dest% /mbr /force
del /f /q "%Temp%\MWUT.txt"
xcopy /sky "%~dp0Media\*.*" %Dest%\

goto choice