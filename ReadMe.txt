To compile (create winpe.wim):

1.	Take winpe.wim from WAIK
2.	Mount using Utility.bat (opt. A)
3.	Copy everything from Programs to Program Files in Mount directory
4.	Copy everything from System32 to Windows\System32 in Mount directory
5.	Set scratch space (also in Utility.bat) to something appropriate (etc. 256 MB)
6.	Integrate all drivers in Drivers directory (Utility.bat scans whole directory for drivers)
7.	Unmount


To create media:

1.	Extract MWUT\Boot\Boot.7z to target directory
2.	Copy winpe.wim from MWUT\Boot to target \Boot
3.	Add extra ISO files for Acronis True Image or MSDaRT		----- or -----		delete their entries in menu.lst
4.	Create ISO with Utility.bat		----- or -----		Install grub4dos as bootloader		----- optionally -----		add more files / driver / utilities to target directory (before creating ISO)


To support HTTP boot:

1. Extract all files from MWUT\Boot\HTTP.7z to HTTP server root
2. Copy winpe.wim from MWUT\Boot to HTTP root


To boot from PXE:

1. Extract all files from MWUT\Boot\PXE.7z to PXE server root
2. Copy winpe.wim from MWUT\Boot to PXE root
3.	Add extra ISO files for Acronis True Image or MSDaRT		----- or -----		delete their entries in menu.lst
4. Configure TFTP server (Tftpd32 / Tftpd64):
	a) Base directory
	b) Bind TFTP to this address
	c) Allow "\" as virtual root
	d) Boot File: grldr
	e) DHCP options		----- or -----		Configure DHCP option 66 (TFTP server IP) on external DHCP 