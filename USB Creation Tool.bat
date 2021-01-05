@echo off
title MWUT USB Creation Tool
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"

echo Matija's Windows Utility Toolkit USB Creation Tool
echo.
echo.
set /p Dest=Enter the destination USB Drive Letter (eg. F:): 
if not exist %Dest% (
	echo Error!! %Dest% does not exist.
	goto USB
)
echo Warning! This will delete all data on all partitions on this disk!
set /p AreYouSure=Are you sure (Y/[N])?
if /i "%AreYouSure%" NEQ "Y" GOTO End
if /i not exist MWUT*.iso echo Error! MWUT ISO image doesn't exist! && goto End
echo select volume %Dest% > "%Temp%\MWUT.txt"
echo clean >> "%Temp%\MWUT.txt"
echo create partition primary >> "%Temp%\MWUT.txt"
echo format fs=fat32 label="MWUT" quick >> "%Temp%\MWUT.txt"
echo active >> "%Temp%\MWUT.txt"
diskpart /s "%Temp%\MWUT.txt"
"%~dp0bootsect.exe" /nt60 %Dest% /mbr /force
del /f /q "%Temp%\MWUT.txt"
7z.exe x -o%Dest%\ -y MWUT*.iso
:End
echo.
echo.
pause