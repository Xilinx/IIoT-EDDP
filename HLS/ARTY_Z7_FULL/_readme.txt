Project Description
==========================================================================
Important notes:
 1.Please use short path name on Windows OS. The OS allows only 256 characters in normal path. 
 2.Please do not use space character on path name.
==========================================================================
1. Create Command Files and open documentation links:
  On Windows OS: run "_create_win_setup.cmd" and follow setup instructions
  On Linux OS: run "_create_linux_setup.sh"  and follow setup instructions
==============================
2. Create Vivado Project on Windows OS use instructions from option 1 of:
  =====
  https://wiki.trenz-electronic.de/display/PD/Vivado+Projects
  =====
  1.Modify start setting:
  =====
  Edit "design_basic_settings.cmd" with text editor:
    Set your vivado installation path for edit: 
      @set XILDIR=C:\Xilinx
      @set VIVADO_VERSION=2017.1
      In this example the it search in 
        C:\Xilinx\Vivado\2017.1 for VIVADO
        C:\Xilinx\SDK\2017.1 for SDK (optional for some functionality, HSI/SDK)
        C:\Xilinx\Vivado_Lab\2017.1 for VIVADO Labtools (optional for some functionality)
    Set the correct part number for your pcb variant (see board_files/TE0710_board_files.csv), edit:
      @set PARTNUMBER=1
  =====
  2.Run "vivado_create_project_guimode.cmd"
==============================
2. Create Vivado Project on Linux use instructions from option 1 of:
  =====
  https://wiki.trenz-electronic.de/display/PD/Vivado+Projects
  =====
  1.Modify start setting:
  =====
  Edit "design_basic_settings.sh" with text editor:
    Set your vivado installation path for edit: 
      @set XILDIR=/opt/Xilinx
      @set VIVADO_VERSION=2017.1
      In this example the it search in 
        /opt/Vivado/2017.1 for VIVADO
        /opt/SDK/2017.1 for SDK (optional for some functionality, HSI/SDK)
        /opt/Vivado_Lab/2017.1 for VIVADO Labtools (optional for some functionality)
    Set the correct part number for your pcb variant (see board_files/TE0710_board_files.csv), edit:
      @set PARTNUMBER=1
  =====
  2.Run "vivado_create_project_guimode.sh"
==============================
There are also other options available:
  =====
  https://wiki.trenz-electronic.de/display/PD/Vivado+Projects 
==============================
Attention:
  =====
  Run design_clear_design_folders.cmd/sh clear all generated files and folders (vivado, workspace(hsi & sdk), vlog,...)!
==============================
Basic documentations:
  =====
  Project Delivery:
  https://wiki.trenz-electronic.de/display/PD/Project+Delivery 
  ==
  VIVADO/SDK/SDSoC
  https://wiki.trenz-electronic.de/pages/viewpage.action?pageId=14746264
  ==
  Trenz Electronic SoMs
  https://wiki.trenz-electronic.de/display/PD/All+Trenz+Electronic+SoMs
  ==
  Additional Information for the are available on the download page of the design
  https://shop.trenz-electronic.de/en/Download/?path=Trenz_Electronic /<Module>/Reference_Design/<Vivado Version>/<design name>
==============================
=====
NOTES
=====