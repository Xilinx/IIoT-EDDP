
set pfm_name "my_patform_project"
set xsa_file "./design_1_wrapper.xsa"

setws ./ws_script


####################################################
# Create the platform project and build it
#   - will include fsbl and pmu by default
#   - enables FSBL debug prints
####################################################

  platform create \
  	-name $pfm_name \
  	-hw $xsa_file
  
  platform active $pfm_name
  
  platform config -extra-compiler-flags fsbl "-DFSBL_DEBUG_INFO"
  
  
  ####################################################
  # Remove rfdc driver from FSBL
  ####################################################
  
  # list domains with: domain list
  domain active zynqmp_fsbl
  
  # List IP/driver with: bsp getdrivers
  
  bsp setdriver -ip usp_rf_data_converter_0 -driver none
  
  
  ####################################################
  # Remove rfdc driver from PMUFW
  ####################################################
  
  domain active zynqmp_pmufw
  bsp setdriver -ip usp_rf_data_converter_0 -driver none
  
  
  ####################################################
  # Create a53_0 baremetal BSP
  #  - enable libmetal
  ####################################################
  
  domain create \
  	-name my_bsp_a53_0 \
  	-proc psu_cortexa53_0 \
  	-os standalone
  
  bsp setlib libmetal
  
  
  ####################################################
  # Create r5_0 baremetal BSP
  #  - enable lwip
  ####################################################
  
  domain create \
  	-name my_bsp_r5_0 \
  	-proc psu_cortexr5_0 \
  	-os standalone
  
  bsp setlib lwip211


  ####################################################
  # Build the platform
  ####################################################

  platform write
  platform generate


####################################################
# Create a system project containing R5 lwip
# and A53 hello world
####################################################

  ####################################################
  # A53 Hello create/build
  ####################################################

  # To list domains in platform use: platform report
  # To list app templates use: repo -apps
  app create -name my_hello_a53 -platform [platform active] -sysproj my_system_prj -domain my_bsp_a53_0 -template {Hello World}
  app config -name my_hello_a53 -set compiler-optimization {None (-O0)}
  app build  -name my_hello_a53


  ####################################################
  # R5 LWIP create/build
  ####################################################

  app create -name my_lwip -platform [platform active] -sysproj my_system_prj -domain my_bsp_r5_0 -template {lwIP Echo Server}
  app config -name my_lwip -set compiler-optimization {None (-O0)}
  app build  -name my_lwip


