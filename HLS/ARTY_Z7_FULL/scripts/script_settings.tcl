# --------------------------------------------------------------------
# --   *****************************
# --   *   Trenz Electronic GmbH   *
# --   *   Holzweg 19A             *
# --   *   32257 Bünde             *
# --   *   Germany                 *
# --   *****************************
# --------------------------------------------------------------------
# -- $Author: Hartfiel, John $
# -- $Email: j.hartfiel@trenz-electronic.de $
# --------------------------------------------------------------------
# -- Change History:
# ------------------------------------------
# -- $Date: 2016/02/02 | $Author: Hartfiel, John
# -- - initial release
# ------------------------------------------
# -- $Date: 2017/06/13  | $Author: Hartfiel, John
# -- - new release version
# ------------------------------------------
# -- $Date: 2017/06/28  | $Author: Hartfiel, John
# -- -  new board part csv version
# ------------------------------------------
# -- $Date: 2017/07/10  | $Author: Hartfiel, John
# -- -  new script version
# ------------------------------------------
# -- $Date:  2017/09/07  | $Author: Hartfiel, John
# -- - add new document history style
# -- -  new script version
# -- -  add tmp path variable
# -- -  change sdsoc path variable
# ------------------------------------------
# -- $Date: 0000/00/00  | $Author:
# -- - 
# --------------------------------------------------------------------
# --------------------------------------------------------------------
namespace eval ::TE {

  # -----------------------------------------------------------------------------------------------------------------------------------------
  # TE variable declaration
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # overwrite Setting:
  # create TCL file: <design_name>/settings/development_settings.tcl
  # overwrite example:
  # set TE::<property> <value>
  # set TE::GEN_HW_BIT false
  # -----------------------------------
  # Unsupported Settings:
  # ---------------------
  # Currently only one BD is allowed
  # Multi BD Design is official not supported (maybe not all functions run correctly):
  # For Multi BD Design do following:
  # 1. set variable BD_MULTI to true
  # 2. Make own Top-level File (Name: <design_name>_top) in the folder  "<design_name>/hdl/" with file name: "<design_name>_top.vhd" or "<design_name>_top.v" 
  variable BD_MULTI false
  #
  variable DESIGNRUNS [list]
  # -----------------------------------
  # Build Settings:
  # Attention: there are dependencies between this properties!
  # ---------------------
  variable GEN_HW_DELETEOLDFILES  true
  variable GEN_HW_BIT             true
  variable GEN_HW_MCS             true
  variable GEN_HW_RPT             true
  variable GEN_HW_HDF             true
  variable GEN_SW_HSI             true
  variable GEN_SW_BIF             true
  variable GEN_SW_BIN             true
  variable GEN_SW_BITMCS          true
  variable GEN_SW_USEPREBULTHDF   false
  variable GEN_SW_FORCEBOOTGEN    false
  # -----------------------------------
  # Basic Settings:
  # Attention: do not change following variables manually!
  # ---------------------
  # project path
  variable BASEFOLDER 
  variable VPROJ_NAME 
  variable VPROJ_PATH 
  variable VLABPROJ_PATH 
  variable BOARDDEF_PATH 
  variable FIRMWARE_PATH 
  variable IP_PATH
  variable BD_PATH
  variable XDC_PATH
  variable HDL_PATH
  variable SET_PATH
  variable WORKSPACE_PATH
  variable WORKSPACE_HSI_PATH
  variable WORKSPACE_SDK_PATH
  variable LIB_PATH
  variable PREBUILT_PATH
  variable PREBUILT_HW_PATH 
  variable PREBUILT_SW_PATH 
  variable PREBUILT_BI_PATH 
  variable PREBUILT_OS_PATH 
  variable SCRIPT_PATH 
  variable DOC_PATH 
  variable LOG_PATH 
  variable BACKUP_PATH 
  variable ZIP_PATH 
  variable SDSOC_PATH 
  variable TMP_PATH 
  # -----------------------------------
  variable ZIP_IGNORE_LIST [list]
  # -----------------------------------
  variable BATCH_FILE_NAME
  variable VIVADO_AVAILABLE
  variable LABTOOL_AVAILABLE
  variable SDK_AVAILABLE
  variable SDSOC_AVAILABLE
  # -----------------------------------
  variable XILINXGIT_DEVICETREE
  variable XILINXGIT_UBOOT
  variable XILINXGIT_LINUX
  # -----------------------------------
  # board_files
  variable ID "NA"
  variable PRODID  "NA"
  variable BOARDPART "NA"
  variable PARTNAME "NA"
  variable SHORTDIR "NA"
  variable ZYNQFLASHTYP "NA"
  variable FPGAFLASHTYP "NA"
  variable CFGMEM_IF "NA"
  variable CFGMEM_MEMSIZE_MB "NA"
  # -----------------------------------
  #project run (use default name)
  #for renaming use prefix sim*, syn*, imp* and con*!
  variable TIMEOUT 120
  variable RUNNING_JOBS 4
  #todo: multiple runs and strategies and modified strategies 
  variable SIM_NAME sim_1
  variable SYNTH_NAME synth_1
  variable IMPL_NAME impl_1
  variable CONST_NAME constrs_1
  variable SOURCE_NAME sources_1
  # -----------------------------------
  # check csv file ids
  variable SCRIPTVER    "2017.1.05"
  variable BOARDDEF_CSV "1.3"
  variable SW_IP_CSV    "2.0"
  variable BDMOD_CSV    "1.1"
  variable ZIP_CSV      "1.0"
  # -----------------------------------
  variable SW_APPLIST [list]
  #BOARD_DEFINITION currently in BDEF todo set to init in settings
  variable BD_MOD_COMMENT [list]
  variable BD_MOD_ADD [list]
  variable BD_MOD_PCOMMENT [list]
  variable BD_MOD_PADD [list]
  variable BD_TCLNAME "NA"
  variable PR_TOPLEVELNAME "NA"
  variable IS_ZSYS false
  variable IS_ZUSYS false
  variable IS_MSYS false
  variable IS_FSYS false
  # -----------------------------------
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # finished TE variables declaration
  # -----------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  
  # -----------------------------------------------------------------------------------------------------------------------------------------
  namespace eval INIT {
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # initial functions
  # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--import_usr_tcl:     
    proc init_usr_tcl {} {
    # hidden function: official not supported
      set usr_script []
      if { ![catch {set usr_script [glob -join -dir ${TE::SET_PATH}/usr/ *.tcl]}] } {
          TE::UTILS::te_msg TE_INIT-58 INFO "Load additional user TCL-script:\n ${usr_script}"
          uplevel 1 [ list ::source ${usr_script}]
      }
    }  
    #--------------------------------
    #--print_version:  
    proc print_version {} {
      set viv_version "NA"
      if {[catch {set viv_version [lindex [split [::version] "\n"] 0]}]} { set viv_version "NA" }
      set TE::BATCH_FILE_NAME "NA"
      if {[catch {set TE::BATCH_FILE_NAME $::env(batchfile_name)}]} { set TE::BATCH_FILE_NAME "NA" }
      
      TE::UTILS::te_msg TE_INIT-0 INFO "Script Info:\n \
        Vivado Version:                             $viv_version\n \
        TE Script Version:                          $TE::SCRIPTVER\n \
        Board Part (Definition Files) CSV Version:  $TE::BOARDDEF_CSV\n \
        Software IP CSV Version:                    $TE::SW_IP_CSV\n \
        Board Design Modify CSV Version:            $TE::BDMOD_CSV\n \
        ZIP ignore CSV Version:                     $TE::ZIP_CSV\n \
        ---\n \
        Start project with:                         $TE::BATCH_FILE_NAME\n \
        ------"
    }
    #--------------------------------
    #--print_environment_settings:  
    proc print_environment_settings {} {
      set TE::VIVADO_AVAILABLE 0
      set TE::LABTOOL_AVAILABLE 0
      set TE::SDK_AVAILABLE 0
      set TE::SDSOC_AVAILABLE 0
      [catch {set TE::VIVADO_AVAILABLE  $::env(VIVADO_AVAILABLE)}]
      [catch {set TE::LABTOOL_AVAILABLE $::env(LABTOOL_AVAILABLE)}]
      [catch {set TE::SDK_AVAILABLE     $::env(SDK_AVAILABLE)}]
      [catch {set TE::SDSOC_AVAILABLE   $::env(SDSOC_AVAILABLE)}]
      TE::UTILS::te_msg TE_INIT-1 INFO "Script Environment:\n \
        Vivado Setting:     $TE::VIVADO_AVAILABLE \n \
        LabTools Setting:   $TE::LABTOOL_AVAILABLE \n \
        SDK Setting:        $TE::SDK_AVAILABLE \n \
        SDSOC Setting:      $TE::SDSOC_AVAILABLE \n \
        ------"

      if {$TE::SDK_AVAILABLE==1 && $TE::SDSOC_AVAILABLE==1} {
        TE::UTILS::te_msg TE_INIT-2 WARNING "SDK settings are overwritten by SDSOC settings."
      }
    }
    #--------------------------------
    #--init_pathvar:  
    proc init_pathvar {} {
      set tmppath [pwd]
      if {[file tail [pwd]]=="vivado"} {
        cd ..
      }
      set TE::BASEFOLDER [pwd]
      set TE::VPROJ_NAME [file tail [pwd]]
      set TE::VPROJ_PATH [pwd]/vivado
      set TE::VLABPROJ_PATH [pwd]/vivado_lab
      #--
      set TE::BOARDDEF_PATH [pwd]/board_files
      set TE::FIRMWARE_PATH [pwd]/firmware
      #--
      set TE::IP_PATH [pwd]/ip_lib
      set TE::BD_PATH [pwd]/block_design
      set TE::XDC_PATH [pwd]/constraints
      set TE::HDL_PATH [pwd]/hdl
      set TE::SET_PATH [pwd]/settings
      #--
      set TE::WORKSPACE_PATH [pwd]/workspace
      set TE::WORKSPACE_HSI_PATH ${TE::WORKSPACE_PATH}/hsi
      set TE::WORKSPACE_SDK_PATH ${TE::WORKSPACE_PATH}/sdk
      #--
      set TE::LIB_PATH [pwd]/sw_lib
      set TE::SCRIPT_PATH [pwd]/scripts
      set TE::DOC_PATH [pwd]/doc
      #--
      set TE::PREBUILT_PATH [pwd]/prebuilt
      set TE::PREBUILT_BI_PATH ${TE::PREBUILT_PATH}/boot_images
      set TE::PREBUILT_HW_PATH ${TE::PREBUILT_PATH}/hardware
      set TE::PREBUILT_SW_PATH ${TE::PREBUILT_PATH}/software
      set TE::PREBUILT_OS_PATH ${TE::PREBUILT_PATH}/os
      #--
      set TE::LOG_PATH [pwd]/v_log
      set TE::BACKUP_PATH [pwd]/backup
      #--
      set TE::ZIP_PATH ""
      [catch {set TE::ZIP_PATH $::env(ZIP_PATH)}]
      #--
      set TE::SDSOC_PATH [pwd]/../SDSoC_PFM
      #--
      set TE::TMP_PATH [pwd]/tmp
      #--
      set TE::XILINXGIT_DEVICETREE ""
      [catch {set TE::XILINXGIT_DEVICETREE $::env(XILINXGIT_DEVICETREE)}]
      set TE::XILINXGIT_UBOOT ""
      [catch {set TE::XILINXGIT_UBOOT $::env(XILINXGIT_UBOOT)}]
      set TE::XILINXGIT_LINUX ""
      [catch {set TE::XILINXGIT_LINUX $::env(XILINXGIT_LINUX)}]
      #--
      TE::UTILS::te_msg TE_INIT-3 INFO "Initial project names and paths:\n \
        TE::VPROJ_NAME:           $TE::VPROJ_NAME \n \
        TE::VPROJ_PATH:           $TE::VPROJ_PATH \n \
        TE::VLABPROJ_PATH:        $TE::VLABPROJ_PATH \n \
        TE::BOARDDEF_PATH:        $TE::BOARDDEF_PATH \n \
        TE::FIRMWARE_PATH:        $TE::FIRMWARE_PATH \n \
        TE::IP_PATH:              $TE::IP_PATH \n \
        TE::BD_PATH:              $TE::BD_PATH \n \
        TE::XDC_PATH:             $TE::XDC_PATH \n \
        TE::HDL_PATH:             $TE::HDL_PATH \n \
        TE::SET_PATH:             $TE::SET_PATH \n \
        TE::WORKSPACE_HSI_PATH:   $TE::WORKSPACE_HSI_PATH \n \
        TE::WORKSPACE_SDK_PATH:   $TE::WORKSPACE_SDK_PATH \n \
        TE::LIB_PATH:             $TE::LIB_PATH \n \
        TE::SCRIPT_PATH:          $TE::SCRIPT_PATH \n \
        TE::DOC_PATH:             $TE::DOC_PATH \n \
        TE::PREBUILT_BI_PATH:     $TE::PREBUILT_BI_PATH \n \
        TE::PREBUILT_HW_PATH:     $TE::PREBUILT_HW_PATH \n \
        TE::PREBUILT_SW_PATH:     $TE::PREBUILT_SW_PATH \n \
        TE::PREBUILT_OS_PATH:     $TE::PREBUILT_OS_PATH \n \
        TE::LOG_PATH:             $TE::LOG_PATH \n \
        TE::BACKUP_PATH:          $TE::BACKUP_PATH \n \
        TE::ZIP_PATH:             $TE::ZIP_PATH \n \
        TE::SDSOC_PATH:           $TE::SDSOC_PATH \n \
        TE::TMP_PATH:             $TE::TMP_PATH \n \
        TE::XILINXGIT_DEVICETREE: $TE::XILINXGIT_DEVICETREE \n \
        TE::XILINXGIT_UBOOT:      $TE::XILINXGIT_UBOOT \n \
        TE::XILINXGIT_LINUX:      $TE::XILINXGIT_LINUX \n \
        ------"

      cd $tmppath
    } 
    #--------------------------------
    #--init_board:  
    proc init_board {ID POS} {
      TE::BDEF::get_check_unique_name $ID $POS

      set TE::ID            [TE::BDEF::get_id $ID $POS]
      set TE::PRODID        [TE::BDEF::get_prodid $ID $POS]
      set TE::BOARDPART     [TE::BDEF::get_boardname $ID $POS]
      set TE::PARTNAME      [TE::BDEF::get_partname $ID $POS]
      set TE::SHORTDIR      [TE::BDEF::get_shortname $ID $POS]
      set TE::ZYNQFLASHTYP  [TE::BDEF::get_zynqflashtyp $ID $POS]
      set tmp [TE::BDEF::get_fpgaflashtyp $ID $POS]
      #todo extrakt CFGMEM_IF and CFGMEM_MEMSIZE_MB from FPGAFLASHTYP-name and from bitfile configuration
      set tmp [split $tmp "|"]
      if {[llength $tmp] eq 3} {
        set TE::FPGAFLASHTYP [lindex $tmp 0]
        set TE::CFGMEM_IF [lindex $tmp 1]
        set TE::CFGMEM_MEMSIZE_MB [lindex $tmp 2]
      } else {
        set TE::FPGAFLASHTYP $tmp
        set TE::CFGMEM_IF "NA"
        set TE::CFGMEM_MEMSIZE_MB "NA"
      }
      TE::UTILS::te_msg TE_INIT-4 INFO "Board Part definition:\n \
        TE::ID:             $TE::ID \n \
        TE::PRODID:         $TE::PRODID \n \
        TE::PARTNAME:       $TE::PARTNAME \n \
        TE::BOARDPART:      $TE::BOARDPART \n \
        TE::SHORTDIR:       $TE::SHORTDIR \n \
        TE::ZYNQFLASHTYP:   $TE::ZYNQFLASHTYP \n \
        TE::FPGAFLASHTYP:   $TE::FPGAFLASHTYP \n \
        ------"
    } 
    #--------------------------------
    #--init_part_only:  init fpga part if found in csv (used if board part is not defined on open project)
    proc init_part_only {partname} {
      #--check if fpga part is unique
        #-2 not found
        #-1 some same
        #0 unique
        #1 all same
      set pcheck [TE::BDEF::get_check_unique_name $partname 2]
      if {$pcheck == 0 } {
        set TE::ID            [TE::BDEF::get_id $partname 2]
        set TE::PRODID        "NA"
        set TE::BOARDPART     "NA"
        set TE::PARTNAME      [TE::BDEF::get_partname $partname 2]
        set TE::SHORTDIR      [TE::BDEF::get_shortname $partname 2]
        set TE::ZYNQFLASHTYP  [TE::BDEF::get_zynqflashtyp $partname 2]
        set tmp [TE::BDEF::get_fpgaflashtyp $partname 2]
        #todo extrakt CFGMEM_IF and CFGMEM_MEMSIZE_MB from FPGAFLASHTYP-name and from bitfile configuration
        set tmp [split $tmp "|"]
        if {[llength $tmp] eq 3} {
          set TE::FPGAFLASHTYP [lindex $tmp 0]
          set TE::CFGMEM_IF [lindex $tmp 1]
          set TE::CFGMEM_MEMSIZE_MB [lindex $tmp 2]
        } else {
          set TE::FPGAFLASHTYP $tmp
          set TE::CFGMEM_IF "NA"
          set TE::CFGMEM_MEMSIZE_MB "NA"
        }
        
        TE::UTILS::te_msg TE_INIT-5 WARNING "Board Part definition initialisation with unique part name:\n \
          TE::ID:             $TE::ID \n \
          TE::PRODID:         $TE::PRODID \n \
          TE::PARTNAME:       $TE::PARTNAME \n \
          TE::BOARDPART:      $TE::BOARDPART \n \
          TE::SHORTDIR:       $TE::SHORTDIR \n \
          TE::ZYNQFLASHTYP:   $TE::ZYNQFLASHTYP \n \
          TE::FPGAFLASHTYP:   $TE::FPGAFLASHTYP \n \
          ------"
      } elseif  {$pcheck == 1 } {
        #todo check if flash is the same on all definitions
        set TE::ID            "NA"
        set TE::PRODID        "NA"
        set TE::BOARDPART     "NA"
        set TE::PARTNAME      [TE::BDEF::get_partname $partname 2]
        #short name is fpga name
        set TE::SHORTDIR      [TE::BDEF::get_shortname $partname 2]
        set TE::ZYNQFLASHTYP  "NA"
        set TE::FPGAFLASHTYP  "NA"
        set TE::CFGMEM_IF     "NA"
        set TE::CFGMEM_MEMSIZE_MB "NA"
        TE::UTILS::te_msg TE_INIT-6 WARNING "Board Part definition initialisation with same part name:\n \
        TE::ID:             $TE::ID \n \
        TE::PRODID:         $TE::PRODID \n \
        TE::PARTNAME:       $TE::PARTNAME \n \
        TE::BOARDPART:      $TE::BOARDPART \n \
        TE::SHORTDIR:       $TE::SHORTDIR \n \
        TE::ZYNQFLASHTYP:   $TE::ZYNQFLASHTYP \n \
        TE::FPGAFLASHTYP:   $TE::FPGAFLASHTYP \n \
        ------"
      } else {
        set TE::ID            "NA"
        set TE::PRODID        "NA"
        set TE::BOARDPART     "NA"
        set TE::PARTNAME      $partname
        set TE::SHORTDIR      $partname
        set TE::ZYNQFLASHTYP  "NA"
        set TE::FPGAFLASHTYP  "NA"
        set TE::CFGMEM_IF     "NA"
        set TE::CFGMEM_MEMSIZE_MB "NA"
        puts "Warning:(TE) Part name not found, use requested name:"
        TE::UTILS::te_msg TE_INIT-7 {CRITICAL WARNING} "Board Part definition initialisation with unknown part name:\n \
        TE::ID:             $TE::ID \n \
        TE::PRODID:         $TE::PRODID \n \
        TE::PARTNAME:       $TE::PARTNAME \n \
        TE::BOARDPART:      $TE::BOARDPART \n \
        TE::SHORTDIR:       $TE::SHORTDIR \n \
        TE::ZYNQFLASHTYP:   $TE::ZYNQFLASHTYP \n \
        TE::FPGAFLASHTYP:   $TE::FPGAFLASHTYP \n \
        ------"
      }

    }
    #--------------------------------
    #--check_bdtyp: check BD typ
    proc check_bdtyp {} {
      set bd_files []
      set TE::BD_TCLNAME "NA"
      set TE::PR_TOPLEVELNAME "NA"
      set TE::IS_ZSYS   false
      set TE::IS_ZUSYS  false
      set TE::IS_MSYS   false 
      set TE::IS_FSYS   false   
      #get bd_filelist
      set bd_files [TE::UTILS::search_bd_files]
      foreach bd $bd_files {
        set TE::BD_TCLNAME  [file tail [file rootname $bd]]
        set TE::PR_TOPLEVELNAME  "[string trim $TE::BD_TCLNAME "_bd"]_wrapper"
        TE::UTILS::te_msg TE_INIT-8 INFO "Found BD-Design:\n \
          TE::BD_TCLNAME:       $TE::BD_TCLNAME \n \
          TE::PR_TOPLEVELNAME: $TE::PR_TOPLEVELNAME \n \
          ------"
        #check typ for other functions
        if {[string match *zsys* $TE::BD_TCLNAME ]} {set TE::IS_ZSYS true;          TE::UTILS::te_msg TE_INIT-9  STATUS "  TE::IS_ZSYS:         $TE::IS_ZSYS"
        } elseif {[string match *zusys* $TE::BD_TCLNAME ]} {set TE::IS_ZUSYS true;  TE::UTILS::te_msg TE_INIT-10 STATUS "  TE::IS_ZUSYS:        $TE::IS_ZUSYS"
        } elseif {[string match *msys* $TE::BD_TCLNAME ]}  {set TE::IS_MSYS true;   TE::UTILS::te_msg TE_INIT-11 STATUS "  TE::IS_MSYS:         $TE::IS_MSYS"
        } elseif {[string match *fsys* $TE::BD_TCLNAME ]}  {set TE::IS_FSYS true;   TE::UTILS::te_msg TE_INIT-12 STATUS "  TE::IS_FSYS:         $TE::IS_FSYS"
        } else {
          TE::UTILS::te_msg TE_INIT-13 WARNING "Not all TE-functions support unknown BD Filename. Use: \n \
            \"*zsys*.tcl\" for Systems with Zynq \n \
            \"*zusys*.tcl\" for Systems with UltraScale Zynq \n \
            \"*msys*.tcl\" for Systems with MicroBlaze \n \
            \"*fsys*.tcl\" for Systems with FPGA-Fabric design only \n \
            ------"
        }
      }
    }
    #--------------------------------
    #--init_boardlist: 
    proc init_boardlist {} {
      set board_files ""
      set TE::BDEF::BOARD_DEFINITION [list]
      if { [catch {set board_files [ glob $TE::BOARDDEF_PATH/*board_files_mod.csv ] }] } {
        if { [catch {set board_files [ glob $TE::BOARDDEF_PATH/*board_files.csv ] }] } {
          TE::UTILS::te_msg TE_INIT-14 WARNING "No board part definition list found (Path: ${TE::BOARDDEF_PATH})."
        }
      } else {
        TE::UTILS::te_msg TE_INIT-15 WARNING "Modified board part definition list found (File: ${board_files})."
      }
      if {$board_files ne ""} {
        TE::UTILS::te_msg TE_INIT-16 INFO "Read board part definition list (File ${board_files})."
        set fp [open "${board_files}" r]
        set file_data [read $fp]
        close $fp
        # set TE::BDEF::BOARD_DEFINITION [list]
        set data [split $file_data "\n"]
        foreach line $data {
          #  check file version ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string match *CSV_VERSION* $line] } {
            set tmp [split $line "="]
            if {[string match [lindex $tmp 1] $TE::BOARDDEF_CSV] != 1} {
              TE::UTILS::te_msg TE_INIT-17 ERROR "Wrong board part definition CSV version (${TE::BOARDDEF_PATH}/board_files.csv) get [lindex $tmp 1] expected ${TE::BOARDDEF_CSV}."
              return -code error "Wrong board part definition CSV version (${TE::BOARDDEF_PATH}/board_files.csv) get [lindex $tmp 1] expected ${TE::BOARDDEF_CSV}."
            }
          } elseif {[string match *#* $line] != 1 && [string length $line] > 0} {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #splitt and append
            set tmp [split $line ","]
            lappend TE::BDEF::BOARD_DEFINITION $tmp
          }
        }
      }
    }
    #--------------------------------
    #--init_app_list: 
    proc init_app_list {} {
      set TE::SW_APPLIST [list]
      if {[file exists  ${TE::LIB_PATH}/apps_list.csv]} { 
        TE::UTILS::te_msg TE_INIT-18 INFO "Read Software list (File: ${TE::LIB_PATH}/apps_list.csv)."
        set fp [open "${TE::LIB_PATH}/apps_list.csv" r]
        set file_data [read $fp]
        close $fp
        set data [split $file_data "\n"]
        # set fsbl_name ""
        foreach line $data {
          #  check file version ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string match *CSV_VERSION* $line] } {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #check version
            set tmp [split $line "="]
            if {[string match [lindex $tmp 1] $TE::SW_IP_CSV] != 1} {
              TE::UTILS::te_msg TE_INIT-19 ERROR "Wrong Software Definition CSV Version (${TE::LIB_PATH}/apps_list.csv) get [lindex $tmp 1] expected ${TE::SW_IP_CSV}."
              return -code error "Wrong Software Definition CSV Version (${TE::LIB_PATH}/apps_list.csv) get [lindex $tmp 1] expected $TE::SW_IP_CSV"
            }
          } elseif {[string match *#* $line] != 1 && [string length $line] > 0} {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #splitt and append
            set tmp [split $line ","]
            lappend TE::SW_APPLIST $tmp
          }
        }
        #------------------------------------------
        if {![file exists ${TE::XILINXGIT_DEVICETREE}]} {
          set tmp_index -1
          foreach sw_applist_line ${TE::SW_APPLIST} {
            incr tmp_index
            #currently remove Device Tree from list (currently only additonal files)
            if {[lindex $sw_applist_line 2] eq "DTS" } {
              TE::UTILS::te_msg TE_INIT-20 {CRITICAL WARNING} "Xilinx Devicetree git clone path not found (Path: ${TE::XILINXGIT_DEVICETREE}). Device-Tree generation will be removed from apps_list.csv"
              set TE::SW_APPLIST [lreplace $TE::SW_APPLIST $tmp_index $tmp_index]
            }
          }
        }
        #------------------------------------------
      } else {
        TE::UTILS::te_msg TE_INIT-21 INFO "No software apps_list used."
      }
    }
    #--------------------------------
    #--init_zip_ignore_list: 
    proc init_zip_ignore_list {} {
      set TE::ZIP_IGNORE_LIST [list]
      if {[file exists  ${TE::SET_PATH}/zip_ignore_list.csv]} { 
        TE::UTILS::te_msg TE_INIT-22 INFO "Read ZIP ignore list (File: ${TE::LIB_PATH}/apps_list.csv)."
        set fp [open "${TE::SET_PATH}/zip_ignore_list.csv" r]
        set file_data [read $fp]
        close $fp
        set data [split $file_data "\n"]
        foreach line $data {
          #  check file version ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string match *CSV_VERSION* $line] } {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #check version
            set tmp [split $line "="]
            if {[string match [lindex $tmp 1] $TE::ZIP_CSV] != 1} {
              TE::UTILS::te_msg TE_INIT-23 ERROR " Wrong Zip ignore definition CSV Version (${TE::SET_PATH}/zip_ignore_list.csv) get [lindex $tmp 1] expected ${TE::ZIP_CSV}."
              return -code error "Wrong Zip ignore definition CSV Version (${TE::SET_PATH}/zip_ignore_list.csv) get [lindex $tmp 1] expected ${TE::ZIP_CSV}."
            }
          } elseif {[string match *#* $line] != 1 && [string length $line] > 0} {
            #remove spaces
            set line [string map {" " ""} $line]
            #remove tabs
            set line [string map {"\t" ""} $line]
            #splitt and append
            set tmp [split $line ","]
            lappend TE::ZIP_IGNORE_LIST $tmp
          }
        }
      } else {
        TE::UTILS::te_msg TE_INIT-24 INFO "No Zip ignore list used."
      }
    }
    #--------------------------------
    #--init_mod_list: 
    proc init_mod_list {} {
      set TE::BD_MOD_COMMENT [list]
      set TE::BD_MOD_ADD [list]
      set TE::BD_MOD_PCOMMENT [list]
      set TE::BD_MOD_PADD [list]
      if {[file exists  ${TE::BD_PATH}/mod_bd.csv]} { 
        TE::UTILS::te_msg TE_INIT-25 INFO "Read BD modify list (File: ${TE::BD_PATH}/mod_bd.csv)."
        set fp [open "${TE::BD_PATH}/mod_bd.csv" r]
        set file_data [read $fp]
        close $fp
        set data [split $file_data "\n"]
        foreach line $data {
          #ignore comments and empty lines
          if {[string match *#* $line] != 1 && [string length $line] > 0} {
            #  check file version
            if {[string match *CSV_VERSION* $line] } {
              #remove spaces
              set line [string map {" " ""} $line]
              #remove tabs
              set line [string map {"\t" ""} $line]
              #check version
              set tmp [split $line "="]
              if {[string match [lindex $tmp 1] $TE::BDMOD_CSV] != 1} {
                TE::UTILS::te_msg TE_INIT-26 ERROR "  Wrong BD Modify CSV Version (${TE::BD_PATH}/mod_bd.csv) get [lindex $tmp 1] expected ${TE::BDMOD_CSV}."
                return -code error " Wrong BD Modify CSV Version (${TE::BD_PATH}/mod_bd.csv) get [lindex $tmp 1] expected $TE::BDMOD_CSV"
              }
            } else {
              #split line
              set temp [split $line ","]
              if {[llength $temp] <3} {
                TE::UTILS::te_msg TE_INIT-27 WARNING "Not enough elements on line ($line). Line ignored."
              } else {
                #get line id +remove spaces and tabs
                set line_id [string map {"\t" ""} [string map {" " ""} [lindex $temp 0]]]
                #sort
                if {$line_id eq "id"} {
                  #table header
                  #remove spaces
                  set line [string map {" " ""} $line]
                  #remove tabs
                  set line [string map {"\t" ""} $line]
                  set temp [split $line ","]
                  lappend TE::BD_MOD_COMMENT $temp
                  lappend TE::BD_MOD_ADD $temp
                  lappend TE::BD_MOD_PCOMMENT $temp
                  lappend TE::BD_MOD_PADD $temp
                } elseif {$line_id==0} {
                  # ID 0: remove(comment) line 
                  lappend TE::BD_MOD_COMMENT $temp
                } elseif {$line_id==1} {
                  # ID 1: add line 
                  if {[llength $temp] >3} {
                  # replaced removed comma from modify txt
                    set newinsert_list [list]
                    lappend newinsert_list [lindex $temp 0]
                    lappend newinsert_list [lindex $temp 1]
                    set addstring [lindex $temp 2]
                    for {set i 3} {$i < [llength $temp]} {incr i} {
                      set addstring "${addstring},[lindex $temp $i]"
                    }
                    lappend newinsert_list $addstring
                    set temp $newinsert_list
                  }
                  lappend TE::BD_MOD_ADD $temp
                } elseif {$line_id==2} {
                  # ID 2: remove(comment) property 
                  lappend TE::BD_MOD_PCOMMENT $temp
                } elseif {$line_id==3} {
                  # ID 3: add property
                  lappend TE::BD_MOD_PADD $temp
                } else {
                  #unsupported lines ignored
                  TE::UTILS::te_msg TE_INIT-28 WARNING "Unsupported id ($line_id). Line ignored."
                }
              }
            }
          }
        }
      }
    }
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # finished initial functions
  # -----------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  
  # -----------------------------------------------------------------------------------------------------------------------------------------
  }

  namespace eval BDEF {
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # board part definition functions
  # -----------------------------------------------------------------------------------------------------------------------------------------
    variable BOARD_DEFINITION [list] 
    #{"ID" "PRODID" "PARTNAME" "BOARDNAME" "SHORTDIR"} 
    #extract board definition list from board definition file "board_files.csv"
    #--------------------------------
    #--find_shortdir: 
    proc find_shortdir {NAME} {
      variable BOARD_DEFINITION
      #search in id
      set value [get_shortname $NAME 0]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-29 STATUS "Found Shortname: $value";return $value}
      #search in productid
      set value [get_shortname $NAME 1]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-30 STATUS "Found Shortname: $value";return $value}
      #search in boardname
      set value [get_shortname $NAME 3]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-31 STATUS "Found Shortname: $value";return $value}
      #search in shortname
      set value [get_shortname $NAME 4]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-32 STATUS "Found Shortname: $value";return $value}
      #search in part name (only if unique)
      if {[get_check_unique_name $NAME 2]==0} {
        set value [get_shortname $NAME 2]
        if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-33 STATUS "Found Shortname: $value";return $value}
      }
      #default
      TE::UTILS::te_msg TE_INIT-34 STATUS "No Shortname found for ${NAME}, use default "
      return "default"
    }   
    #--------------------------------
    #--find_id:     
    proc find_id {NAME} {
      variable BOARD_DEFINITION
      #search in id
      set value [get_id $NAME 0]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-35 STATUS "Found ID: $value";return $value}
      #search in productid
      set value [get_id $NAME 1]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-36 STATUS "Found ID: $value";return $value}
      #search in boardname
      set value [get_id $NAME 3]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-37 STATUS "Found ID: $value";return $value}
      #search in shortname
      set value [get_id $NAME 4]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-38 STATUS "Found ID: $value";return $value}
      #search in part name (only if unique)
      if {[get_check_unique_name $NAME 2]==0} {
        set value [get_id $NAME 2]
        if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-39 STATUS "Found ID: $value";return $value}
      }
      #default
      TE::UTILS::te_msg TE_INIT-40 STATUS "No ID found for ${NAME}, use NA "
      return "NA"
    }
    #--------------------------------
    #--find_partname:         
    proc find_partname {NAME} {
      variable BOARD_DEFINITION
      #search in id
      set value [get_partname $NAME 0]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-41 STATUS "Found part name: $value";return $value}
      #search in productid
      set value [get_partname $NAME 1]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-42 STATUS "Found part name: $value";return $value}
      #search in boardname
      set value [get_partname $NAME 3]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-43 STATUS "Found part name: $value";return $value}
      #search in shortname
      set value [get_partname $NAME 4]
      if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-44 STATUS "Found part name: $value";return $value}
      #search in part name (only if unique)
      if {[get_check_unique_name $NAME 2]==0} {
        set value [get_partname $NAME 2]
        if {$value ne "NA"} {TE::UTILS::te_msg TE_INIT-45 STATUS "Found part name: $value";return $value}
      }
      #default
      TE::UTILS::te_msg TE_INIT-46 STATUS "No part name found for ${NAME}, use NA "
      return "NA"
    }  
    #--------------------------------
    #--get_check_unique_name: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_check_unique_name {NAME POS} {
      variable BOARD_DEFINITION
      set part_count 0
      set max_count [expr [llength $BOARD_DEFINITION] -1]
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          set part_count [expr $part_count+1]
        }
      }
      #-2 not found
      #-1 some same
      #0 unique
      #1 all same
      if {$part_count==0} {
        TE::UTILS::te_msg TE_INIT-47 STATUS "Board part csv name check: $NAME not found on position $POS."
        return -2
      } elseif {$part_count==$max_count} {
        TE::UTILS::te_msg TE_INIT-48 STATUS "Board part csv name check:  All names ($NAME) are equal on position  $POS."
        return 1
      } elseif {$part_count==1} {
        TE::UTILS::te_msg TE_INIT-49 STATUS "Board part csv name check:  $NAME is unique on position $POS."
        return 0
      } else {
        TE::UTILS::te_msg TE_INIT-50 STATUS "Board part csv name check:  Only some names ($NAME) are equal on position $POS."
        return -1
      }
    }      
    #--------------------------------
    #--get_id: Name--> search name, POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6) 
    proc get_id {NAME POS} {
      variable BOARD_DEFINITION
      set last_id 0
      foreach sublist $BOARD_DEFINITION {
        if {$last_id < [lindex $sublist 0] && [lindex $sublist 0] ne "ID"} {
          set last_id [lindex $sublist 0]
        }
        # if { [string equal $NAME [lindex $sublist $POS]] } {
          # return [lindex $sublist 0]
        # }
        if { [string match -nocase $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 0]
        }
      }
      if {$NAME eq "LAST_ID"} {
        #return the the highest id from the list
        return $last_id
      }
      #default
      TE::UTILS::te_msg TE_INIT-51 STATUS "ID not found for $NAME $POS, return default: NA"
      return "NA"
    }     
    #--------------------------------
    #--get_prodid: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_prodid {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 1]
        }
      }
      #default
      TE::UTILS::te_msg TE_INIT-52 STATUS "Product ID not found for $NAME $POS, return default: NA"
      return "NA"
    }    
    #--------------------------------
    #--get_partname: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_partname {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 2]
        }
      }
      #default
      TE::UTILS::te_msg TE_INIT-53 STATUS "Part Name not found for $NAME $POS, return default: NA"
      return "NA"
    }   
    #--------------------------------
    #--get_boardname: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)  
    proc get_boardname {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 3]
        }
      }
      #default
      TE::UTILS::te_msg TE_INIT-54 STATUS "Board Name not found for $NAME $POS, return default: NA"
      return "NA"
    }  
    #--------------------------------
    #--get_shortname: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6)      
    proc get_shortname {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 4]
        }
      }
      #default
      TE::UTILS::te_msg TE_INIT-55 STATUS "Short Name not found for $NAME $POS, return default: NA"
      return "NA"
    } 
    #--------------------------------
    #--get_zynqflashtyp: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6) 
    proc get_zynqflashtyp {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 5]
        }
      }
      #default
      TE::UTILS::te_msg TE_INIT-56 STATUS "Zynq Flash typ not found for $NAME $POS, return default: NA"
      return "NA"
    }
    #--------------------------------
    #--get_fpgaflashtyp: POS: Table position ID(0)(unique)  PRODID(1)(unique),PARTNAME(2),BOARDNAME(3)(unique),SHORTNAME(4)(unique),ZYNQFLASHTYP(5),FPGAFLASHTYP(6) 
    proc get_fpgaflashtyp {NAME POS} {
      variable BOARD_DEFINITION
      foreach sublist $BOARD_DEFINITION {
        if { [string equal $NAME [lindex $sublist $POS]] } {
          return [lindex $sublist 6]
        }
      }
      #default
      TE::UTILS::te_msg TE_INIT-57 STATUS "FPGA Flash typ not found for $NAME $POS, return default: NA"
      return "NA"
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished initial functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  # -----------------------------------------------------------------------------------------------------------------------------------------
  }
  puts "INFO:(TE) Load Settings Script finished"
}