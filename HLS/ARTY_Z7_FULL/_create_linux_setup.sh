#! /bin/sh

# --------------------------------------------------------------------
# --   *****************************
# --   *   Trenz Electronic GmbH   *
# --   *   Holzweg 19A             *
# --   *   32257 Bünde   		      *
# --   *   Germany                 *
# --   *****************************
# --------------------------------------------------------------------
# --$Autor: Hartfiel, John $
# --$Email: j.hartfiel@trenz-electronic.de $
# --$Create Date:2017/01/13 $
# --$Modify Date: 2017/09/22 $
# --$Version: 1.1 $
# -- 1.1 Changes
# --   copy also workaround script _awk_fix.sh
# --   sets executable for all copied scripts
# --------------------------------------------------------------------
# --------------------------------------------------------------------
# init
function pause(){
   read -p "$*"
}

function te_base(){
echo "--------------------------------------------------------------------" 
echo "------------------------TE Reference Design-------------------------"
echo "--------------------------------------------------------------------"
echo "-- (c)  Go to CMD-File Generation (Manual setup)                    "
echo "-- (d)  Go to Documentation (Web Documentation)                     "
echo "-- (x)  Exit Batch (nothing is done!)                               "
echo "-- (0)  Create minimum setup of CMD-Files and exit Batch            "
echo "-- (1)  Create maximum setup of CMD-Files and exit Batch            "
echo "----                                                                "
echo " Select (ex.:'0' for min setup):"                                      
read new_base
if [ "${new_base}" == "d" ]; then te_doc ; fi
if [ "${new_base}" == "c" ]; then te_cmd ; fi
if [ "${new_base}" == "x" ]; then exit 1 ; fi
if [ "${new_base}" == "0" ]; then te_min ; te_last; fi
if [ "${new_base}" == "1" ]; then te_max ; te_last; fi
te_base
}

function te_doc(){
echo "--------------------------------------------------------------------"
echo "-------------------------TE Documentation---------------------------"
echo "--------------------------------------------------------------------"
echo "-- (b)  Go to Base Menue                                            "
echo "-- (x)  Exit Batch(nothing is done!)                                "
echo "-- (0)  Trenz Electronic Wiki                                       "
echo "-- (1)  Trenz Electronic Wiki: Vivado/SDK/SDSoC                     "
echo "-- (1a) Trenz Electronic Wiki: Vivado/SDK/SDSoC-Board Part Flow     "
echo "-- (2)  Trenz Electronic Wiki: Project Delivery                     "
echo "-- (2a) Trenz Electronic Wiki: Project Delivery-Quick Start         "
echo "-- (2b) Trenz Electronic Wiki: Project Delivery-CMD Description     "
echo "-- (2c) Trenz Electronic Wiki: Select correct TE Board part file    "
echo "-- (3)  Trenz Electronic Wiki: PetaLinux KickStart                  "
echo "-- (4)  Trenz Electronic Downloads                                  "
echo "----                                                                "
echo " Select Document (ex.:'0' for Wiki ,'b' go to Base Menue):"                                      
read new_doc
if [ "${new_doc}" == "b" ]; then te_base; fi
if [ "${new_doc}" == "x" ]; then exit 1; fi
if [ "${new_doc}" == "0" ]; then xdg-open https://wiki.trenz-electronic.de/display/PD/Trenz+Electronic+Documentation ; fi
if [ "${new_doc}" == "1" ]; then xdg-open https://wiki.trenz-electronic.de/pages/viewpage.action?pageId=14746264 ; fi
if [ "${new_doc}" == "1a" ]; then xdg-open https://wiki.trenz-electronic.de/display/PD/Vivado+Board+Part+Flow ; fi
if [ "${new_doc}" == "2" ]; then xdg-open https://wiki.trenz-electronic.de/display/PD/Project+Delivery ; fi
if [ "${new_doc}" == "2a" ]; then xdg-open https://wiki.trenz-electronic.de/display/PD/Project+Delivery#ProjectDelivery-QuickStart ; fi
if [ "${new_doc}" == "2b" ]; then xdg-open https://wiki.trenz-electronic.de/display/PD/Project+Delivery#ProjectDelivery-LinuxCommandFiles ; fi
if [ "${new_doc}" == "2c" ]; then xdg-open https://wiki.trenz-electronic.de/display/PD/TE+Board+Part+Files ; fi
if [ "${new_doc}" == "3" ]; then xdg-open https://wiki.trenz-electronic.de/display/PD/PetaLinux+KICKstart ; fi
if [ "${new_doc}" == "4" ]; then xdg-open https://shop.trenz-electronic.de/en/Download/?path=Trenz_Electronic ; fi

te_doc
}     

function te_cmd(){
echo "--------------------------------------------------------------------"
echo "--------------------------Create CMD Files--------------------------"
echo "--------------------------------------------------------------------"
echo "-- Available CMD Files:                                             "
echo "-- (b)  Go to Base Menue                                            "
echo "-- (x)  Exit CMD Generation                                         "
# echo "-- ( )  design_basic_settings.cmd (generated always, if not exist)"
echo "-- (min)Generate minimum CMD setup (recommended)                         "
echo "-- (max)Generate maximum CMD setup                        (not available)"
echo "-- (1)  design_clear_design_folders.cmd                   (not available)"
echo "-- (2)  design_run_project_batchmode.cmd                  (not available)"
echo "-- (3)  development_design_run_prebuilt_all_batchmode.cmd (not available)"
echo "-- (4)  development_hsi_console.cmd                       (not available)"
echo "-- (5)  development_utilities_backup.cmd                  (not available)"
echo "-- (6)  development_utilities_backup_noprebuilt.cmd       (not available)"
echo "-- (7)  labtools_open_project_guimode.cmd                 (not available)"
echo "-- (8)  program_flash_binfile.cmd                         (not available)"
echo "-- (9)  program_flash_mcsfile.cmd                         (not available)"
echo "-- (10) program_fpga_bitfile.cmd                          (not available)"
echo "-- (11) sdk_create_prebuilt_project_guimode.cmd           (not available)"
echo "-- (12) vivado_create_project_batchmode.cmd               (not available)"
echo "-- (13) vivado_create_project_guimode.cmd                                "
echo "-- (14) vivado_open_existing_project_guimode.cmd                         "
echo "----     "
echo " Select CMD Files (ex.:'min' for minimum setup, 'x' for exit):"                                      
read new_cmd
if [ "${new_cmd}" == "b" ]; then te_base; fi
if [ "${new_cmd}" == "x" ]; then te_last; fi
if [ "${new_cmd}" == "min" ]; then te_min; te_last; fi
if [ "${new_cmd}" == "max" ]; then te_max; te_last; fi
if [ "${new_cmd}" == "1" ]; then te_1; fi
if [ "${new_cmd}" == "2" ]; then te_2; fi
if [ "${new_cmd}" == "3" ]; then te_3; fi
if [ "${new_cmd}" == "4" ]; then te_4; fi
if [ "${new_cmd}" == "5" ]; then te_5; fi
if [ "${new_cmd}" == "6" ]; then te_6; fi
if [ "${new_cmd}" == "7" ]; then te_7; fi
if [ "${new_cmd}" == "8" ]; then te_8; fi
if [ "${new_cmd}" == "9" ]; then te_9; fi
if [ "${new_cmd}" == "10" ]; then te_10; fi
if [ "${new_cmd}" == "11" ]; then te_11; fi
if [ "${new_cmd}" == "12" ]; then te_12; fi
if [ "${new_cmd}" == "13" ]; then te_13; fi
if [ "${new_cmd}" == "14" ]; then te_14; fi
te_cmd                                                                
}
function te_min(){
  if [ -e "${sh_folder}/vivado_create_project_guimode.sh" ]; then cp ${sh_folder}/vivado_create_project_guimode.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/vivado_open_existing_project_guimode.sh" ]; then cp ${sh_folder}/vivado_open_existing_project_guimode.sh ${bashfile_path}; fi
}                                                                   
   
function te_max(){
  if [ -e "${sh_folder}/design_clear_design_folders.sh" ]; then cp ${sh_folder}/design_clear_design_folders.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/design_run_project_bashmode.sh" ]; then cp ${sh_folder}/design_run_project_bashmode.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/development_design_run_prebuilt_all_bashmode.sh" ]; then cp ${sh_folder}/development_design_run_prebuilt_all_bashmode.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/development_hsi_console.sh" ]; then cp ${sh_folder}/development_hsi_console.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/development_utilities_backup.sh" ]; then cp ${sh_folder}/development_utilities_backup.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/development_utilities_backup_noprebuilt.sh" ]; then cp ${sh_folder}/development_utilities_backup_noprebuilt.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/labtools_open_project_guimode.sh" ]; then cp ${sh_folder}/labtools_open_project_guimode.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/program_flash_binfile.sh" ]; then cp ${sh_folder}/program_flash_binfile.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/program_flash_mcsfile.sh" ]; then cp ${sh_folder}/program_flash_mcsfile.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/program_fpga_bitfile.sh" ]; then cp ${sh_folder}/program_fpga_bitfile.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/sdk_create_prebuilt_project_guimode.sh" ]; then cp ${sh_folder}/sdk_create_prebuilt_project_guimode.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/vivado_create_project_bashmode.sh" ]; then cp ${sh_folder}/vivado_create_project_bashmode.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/vivado_create_project_guimode.sh" ]; then cp ${sh_folder}/vivado_create_project_guimode.sh ${bashfile_path}; fi
  if [ -e "${sh_folder}/vivado_open_existing_project_guimode.sh" ]; then cp ${sh_folder}/vivado_open_existing_project_guimode.sh ${bashfile_path}; fi  
}                                                                   
     
function te_1(){
  if [ -e "${sh_folder}/design_clear_design_folders.sh" ]; then cp ${sh_folder}/design_clear_design_folders.sh ${bashfile_path}; fi
}                                                                   
        
function te_2(){
  if [ -e "${sh_folder}/design_run_project_bashmode.sh" ]; then cp ${sh_folder}/design_run_project_bashmode.sh ${bashfile_path}; fi
} 
          
function te_3(){
  if [ -e "${sh_folder}/development_design_run_prebuilt_all_bashmode.sh" ]; then cp ${sh_folder}/development_design_run_prebuilt_all_bashmode.sh ${bashfile_path}; fi
}     
       
function te_4(){
  if [ -e "${sh_folder}/development_hsi_console.sh" ]; then cp ${sh_folder}/development_hsi_console.sh ${bashfile_path}; fi
}                                                                   
          
function te_5(){
  if [ -e "${sh_folder}/development_utilities_backup.sh" ]; then cp ${sh_folder}/development_utilities_backup.sh ${bashfile_path}; fi
}                                                                   
            
function te_6(){
  if [ -e "${sh_folder}/development_utilities_backup_noprebuilt.sh" ]; then cp ${sh_folder}/development_utilities_backup_noprebuilt.sh ${bashfile_path}; fi
}                                                                   
              
function te_7(){
  if [ -e "${sh_folder}/labtools_open_project_guimode.sh" ]; then cp ${sh_folder}/labtools_open_project_guimode.sh ${bashfile_path}; fi
}  
              
function te_8(){
  if [ -e "${sh_folder}/program_flash_binfile.sh" ]; then cp ${sh_folder}/program_flash_binfile.sh ${bashfile_path}; fi
}    
            
function te_9(){
  if [ -e "${sh_folder}/program_flash_mcsfile.sh" ]; then cp ${sh_folder}/program_flash_mcsfile.sh ${bashfile_path}; fi
}                                                                   
              
function te_10(){
  if [ -e "${sh_folder}/program_fpga_bitfile.sh" ]; then cp ${sh_folder}/program_fpga_bitfile.sh ${bashfile_path}; fi
}     
           
function te_11(){
  if [ -e "${sh_folder}/sdk_create_prebuilt_project_guimode.sh" ]; then cp ${sh_folder}/sdk_create_prebuilt_project_guimode.sh ${bashfile_path}; fi
}            
function te_12(){
  if [ -e "${sh_folder}/vivado_create_project_bashmode.sh" ]; then cp ${sh_folder}/vivado_create_project_bashmode.sh ${bashfile_path}; fi
}                                                                   
               
function te_13(){
  if [ -e "${sh_folder}/vivado_create_project_guimode.sh" ]; then cp ${sh_folder}/vivado_create_project_guimode.sh ${bashfile_path}; fi
}                  
function te_14(){
  if [ -e "${sh_folder}/vivado_open_existing_project_guimode.sh" ]; then cp ${sh_folder}/vivado_open_existing_project_guimode.sh ${bashfile_path}; fi
}                                                                   
   
function te_last(){
  if ! [ -e "${bashfile_path}/design_basic_settings.sh" ]; then cp ${sh_folder}/design_basic_settings.sh ${bashfile_path}; fi
  if ! [ -e "${bashfile_path}/_awk_fix.sh" ]; then cp ${sh_folder}/_awk_fix.sh ${bashfile_path}; fi
  find ${bashfile_path}/ -maxdepth 1 -name "*.sh" | xargs chmod ugo+x
  echo ---------------------------Minimal Setup----------------------------
  echo --- 1. Open "design_basic_settings.sh" with text editor
  echo --- 2.  Set Xilinx Installation path, default:  XILDIR=/opt/Xilinx/
  echo --- 3.  Set the Board Part you bought, example: PARTNUMBER=te0726-3m 
  echo ---       For available names see: ./board_files/TExxxx_board_files.csv
  echo --- 4. Save "design_basic_settings.sh"
  echo --- 5. To create vivado project, execute: ./vivado_create_project_guimode.sh
  echo --- Use Trenz Electronic Wiki for more information:
  echo ---   https://wiki.trenz-electronic.de/display/PD/Project+Delivery
  echo -------------------------------------------------------------------- 
  pause 'Press [Enter] key to continue...'
  exit 1
}
   
echo ------------------------Set design paths----------------------------
# get paths
bashfile_name=${0##*/}
bashfile_path=`pwd`

echo -- Run Design with: $bashfile_name
echo -- Use Design Path: $bashfile_path
sh_folder=${bashfile_path}/console/base_sh 
# run base menue
te_base 
