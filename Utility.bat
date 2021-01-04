@echo off
echo Mount or unmount:
echo.

:choice
echo.
echo A	Mount
echo B	Unmount
echo C	Set Scratch Space to 32 MB
echo D	Set Scratch Space to 64 MB
echo E	Set Scratch Space to 128 MB
echo F	Set Scratch Space to 256 MB (recommended)
echo G	Set Scratch Space to 512 MB
echo H	Add all drivers in Drivers directory
echo I	Create ISO using oscdimg
echo J	Integrate NVMe hotfix (KB2990941 and KB3087873)
echo.

set /p choice=A/B/C:
	
if %choice%==a Dism /Mount-Wim /WimFile:"D:\Servis\My Projects\MWUT\Boot\winpe.wim" /Index:1 /MountDir:"D:\Servis\My Projects\MWUT\Temp"
if %choice%==b Dism /Unmount-Wim /MountDir:"D:\Servis\My Projects\MWUT\Temp" /Commit
if %choice%==c Dism /Set-ScratchSpace:32 /Image:"D:\Servis\My Projects\MWUT\Temp"
if %choice%==d Dism /Set-ScratchSpace:64 /Image:"D:\Servis\My Projects\MWUT\Temp"
if %choice%==e Dism /Set-ScratchSpace:128 /Image:"D:\Servis\My Projects\MWUT\Temp"
if %choice%==f Dism /Set-ScratchSpace:256 /Image:"D:\Servis\My Projects\MWUT\Temp"
if %choice%==g Dism /Set-ScratchSpace:512 /Image:"D:\Servis\My Projects\MWUT\Temp"
if %choice%==h Dism /Add-Driver /Driver:"D:\Servis\My Projects\MWUT\Drivers" /Recurse /Image:"D:\Servis\My Projects\MWUT\Temp"
if %choice%==i "C:\program Files\Windows AIK\Tools\amd64\Oscdimg.exe" -b"D:\Servis\My Projects\MWUT\Boot\grldr_cd.bin" -u1 -udfver102 -l"Matija's Windows Utility Toolkit" "D:\Servis\My Projects\MWUT\ISO" "D:\Servis\My Projects\MWUT\MWUT 2.0 x64.iso"
if %choice%==j goto NVMe
goto choice

:NVMe

Dism /Image:"D:\Servis\My Projects\MWUT\Temp" /Add-Package /PackagePath:"D:\Servis\Microsoft\Windows Updates\Windows 7 SP1 x64\Windows6.1-KB2990941-v3-x64.msu"
Dism /Image:"D:\Servis\My Projects\MWUT\Temp" /Add-Package /PackagePath:"D:\Servis\Microsoft\Windows Updates\Windows 7 SP1 x64\Windows6.1-KB3087873-v2-x64.msu"

goto choice