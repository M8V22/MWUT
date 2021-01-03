AMD USB3 Driver
===================================
Version 2.0.0.0048

Description
-------------------------
This driver supports the xHCI controller in AMD chipsets and USB3 Hub

### Chipset Supported:
* Zeppelin
	
### Operating System Supported:
* Microsoft Windows 7 x64	


### Known Issues:
* N\A

Revision History
-----------------

2.0.0.0048 12/11/2017
* Initial release

Installation Instructions
-------------------------

**NOTE**:  As with all driver installations on Windows, you need to login as Administrator or have administrator rights for your domain login.

To install the driver, copy the installation files to a temporary directory, then use the "Device Manager" to perform an "Update Driver" operation as follows.  

1. Select "Control Panel" from Start Menu.
2. Select "Classic View" from the left pane.
3. Invoke Device Manager. 
4. There should be a device in the section named "Other Devices" with name "Universal Serial Bus (USB) Controller ", with Hardware Id as *PCI\VEN_1022&DEV_145C*.
5. Right-click on "Unknown Device", and click on "Update Driver".
6. Select "Browse my computer for driver software".
7. Click "Browse" to choose the installation files and click "OK".
8. A box will appear: "The wizard has finished installing the software", click "Finish" to complete the controller driver installation.
9. Now there should be a device in the section named "Other Devices" with name "Unkown Device", with Hardware Id as *AMDUSB3\ROOT_HUB3*.
10. Right-click on "Unknown Device", and click on "Update Driver".
11. Select "Browse my computer for driver software".
12. Click "Browse" to choose the installation files and click "OK".
13. A box will appear: "The wizard has finished installing the software", click "Finish" to complete the hub driver installation.
 
Update Instructions:
---------------------------

**NOTE**:  As with all driver installations on Windows, you need to login as Administrator or have administrator rights for your domain login.

To install the driver, copy the installation files to a temporary directory, then use the "Device Manager" to perform an "Update Driver" operation as follows.  

1. Select "Control Panel" from Start Menu.
2. Select "Classic View" from the left pane.
3. Invoke Device Manager. 
4. There should be a device section named "AMD Root Hub(xHCI)"
5. Right-click on "AMD Root Hub(xHCI)", and click on "Update Driver".
6. Select "Browse my computer for driver software".
7. Click "Browse" to choose the installation files and click "OK".
8. A box will appear: "The wizard has finished installing the software", click "Finish" to complete the hub driver installation.
9. Now there should be a device in the section named "Other Devices" with name "AMD USB3 Host Controller"
10. Right-click on "AMD USB3 Host Controller", and click on "Update Driver".
11. Select "Browse my computer for driver software".
12. Click "Browse" to choose the installation files and click "OK".
13. A box will appear: "The wizard has finished installing the software", click "Finish" to complete the controller driver installation.


Uninstall Instructions:
---------------------------

**NOTE**:  As with all driver installations on Windows, you need to login as Administrator or have administrator rights for your domain login.

1. Select "Control Panel" from Start Menu.
2. Select "Classic View" from the left pane.
3. Invoke Device Manager. 
4. There should be a device section named "AMD Root Hub(xHCI)" 
5. Right-click on the “AMD Root Hub(xHCI)”, and click on "Uninstall".
6. Select "Delete the driver software for this device".
7. Click "OK".
4. There should be a device section named "AMD USB3 Host Controller" 
5. Right-click on the “AMD Root Hub(xHCI)”, and click on "Uninstall".
6. Select "Delete the driver software for this device".
7. Click "OK".

Copyright
---------------------------
(c) Copyright 2012~2017 Advanced Micro Devices, Inc.  All rights reserved.

LIMITATION OF LIABILITY:  THE MATERIALS ARE PROVIDED AS IS WITHOUT ANY EXPRESS OR IMPLIED WARRANTY OF ANY KIND INCLUDING WARRANTIES OF MERCHANTABILITY, NONINFRINGEMENT OF THIRD-PARTY INTELLECTUAL PROPERTY, OR FITNESS FOR ANY PARTICULAR PURPOSE. IN NO EVENT SHALL AMD OR ITS SUPPLIERS BE LIABLE FOR ANY DAMAGES WHATSOEVER (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF PROFITS, BUSINESS INTERRUPTION, LOSS OF INFORMATION) ARISING OUT OF THE USE OF OR INABILITY TO USE THE MATERIALS, EVEN IF AMD HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. BECAUSE SOME JURISDICTIONS PROHIBIT THE EXCLUSION OR LIMITATION OF LIABILITY FOR
CONSEQUENTIAL OR INCIDENTAL DAMAGES, THE ABOVE LIMITATION MAY NOT APPLY TO YOU.

AMD does not assume any responsibility for any errors which may appear in the 
Materials nor any responsibility to support or update the Materials.  AMD
retains the right to make changes to its test specifications at any time, 
without notice.  NO SUPPORT OBLIGATION: AMD is not obligated to furnish, support, or make any further information, software, technical information, know-how, or 
show-how available to you. 

U.S. GOVERNMENT RESTRICTED RIGHTS: The Materials and documentation are provided with RESTRICTED RIGHTS.  Use, duplication or disclosure by the Government is subject to restrictions as set forth in FAR52.227014 and DFAR252.227-7013, et seq., or its successor.  Use of the Materials by the Government constitutes acknowledgment of AMD's proprietary rights in them.












