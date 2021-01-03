Intel® USB 3.1 eXtensible Host Controller v15.2.30.280 hotfix - Release Notes
=============================================================================
This package provides drivers for Alpine Ridge USB3.1 Controller for Windows* 7, namely including:
  - Intel(R) USB 3.1 eXtensible Host Controller Driver
  - Intel(R) USB 3.1 Hub Driver

Please use the setup.exe installer to install the driver pack.
For full install or un-install of the driver package, please use the following:
- Through an elevated command prompt run 'setup.exe /freshinstall' or 'setup.exe /uninstall' commands respectively. 
Note that 'setup.exe /x' is not supported, so setup.exe /uninstall' should be used instead.

Pre-requisites 
==============
 - Intel USB3.0 driver package (separately available) should be installed as well on the system 
   in order to get full functionality (billboard, monitor etc...). 
 - Microsoft* .NET Framework 3.5 must be installed on the system

Supported Operating Systems
===========================
  Windows* 7   32-bit
  Windows* 7   64-bit

Supported USB 3.1 Controller
=============================
  L6000 Series                     (Tested with NVM rev 16)
  
Known Issues
============

Fixed Issues
============
4956036 USB driver stops to be functional after running simultaneous webcam and pendrive transfers.
4926991 System stops transferring file between USB2.0 and USB 3.0 devices via Type-C hub.
B268419 USB headset/Speaker has no output or audio distortion when attaching Type-C to USB2.0
4926959 ENHK/ZH-HK language falls back to CHS instead of CHT
4927190 USB driver won't install if logged in username includes 'space' character 


Legal Information
=================
Microsoft, Windows, and the Windows logo are trademarks, or registered trademarks of
Microsoft Corporation in the U.S. and/or other countries.

* Other names and brands may be claimed as the property of others.

Copyright(C) 2015-2016 Intel Corporation. All rights reserved.