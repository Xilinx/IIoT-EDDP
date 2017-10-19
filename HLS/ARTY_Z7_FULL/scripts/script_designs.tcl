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
# -- $Date: 2016/02/04 | $Author: Hartfiel, John
# -- - initial release
# ------------------------------------------
# -- $Date: 2010/03/06  | $Author: Hartfiel, John
# -- - miscellaneous
# ------------------------------------------
# -- $Date:  2017/09/06  | $Author: Hartfiel, John
# -- - add new document history style
# -- - add sdsoc generation
# ------------------------------------------
# -- $Date: 0000/00/00  | $Author:
# -- - 
# --------------------------------------------------------------------
# --------------------------------------------------------------------
namespace eval ::TE {
  namespace eval INIT {
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # initial functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--basic_inits: initial some variables and list 
    proc basic_inits {} {
      if {[catch {TE::INIT::print_version} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-71 ERROR "Script (TE::INIT::print_version) failed: $result."; return -code error}
      if {[catch {TE::INIT::print_environment_settings} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-72 ERROR "Script (TE::INIT::print_environment_settings) failed: $result."; return -code error}
      if {[catch {TE::INIT::init_pathvar} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-73 ERROR "Script (TE::INIT::init_pathvar) failed: $result."; return -code error}
      if {[catch {TE::INIT::init_boardlist} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status;create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-74 ERROR "Script (TE::INIT::init_boardlist) failed: $result."; return -code error}
      if {[catch {TE::INIT::init_app_list} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-75 ERROR "Script (TE::INIT::init_app_list) failed: $result."; return -code error}
      if {[catch {TE::INIT::init_zip_ignore_list} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-76 ERROR "Script (TE::INIT::init_zip_ignore_list) failed: $result."; return -code error}
      if {[catch {TE::INIT::init_mod_list} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-77 ERROR "Script (TE::INIT::init_mod_list) failed: $result."; return -code error}
      if {[catch {TE::INIT::init_usr_tcl} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-78 ERROR "Script (TE::INIT::init_usr_tcl) failed: $result."; return -code error}
      if {[file exists ${TE::SET_PATH}/development_settings.tcl]} {
        TE::UTILS::te_msg TE_INIT-79 INFO "Source ${TE::SET_PATH}/development_settings.tcl."
        if {[catch {source ${TE::SET_PATH}/development_settings.tcl} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-80 ERROR "Script (source development_settings.tcl) failed: $result."; return -code error}
      }
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished initial functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # cmd functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--run_te_procedure: run tcl Function from cmd file
    proc run_te_procedure {TCL_PROCEDURE BOARD} {
      TE::UTILS::te_msg TE_INIT-81 INFO "Run TE::INIT::run_te_procedure $TCL_PROCEDURE $BOARD"
      #--
      if {[catch {TE::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-82 ERROR "Script (TE::INIT::remove_status_files) failed: $result."; return -code error}
      #--
      #Attention not all Procedures can start directly from shell
      if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-83 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}
      if {[catch {init_board [TE::BDEF::find_id $BOARD] 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-84 ERROR "Script (TE::INIT::init_board /[TE::BDEF::find_id/]) failed: $result."; return -code error}
      if {[catch {eval $TCL_PROCEDURE} result]} {abort_status "Error Run TE-TCLProcedure from batch file..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-85 ERROR "Script (${TCL_PROCEDURE}) failed: $result."; return -code error}
    }
    #--------------------------------
    #--clear_project_all:todo:use run_te_procedure
    proc clear_project_all {} {
      TE::UTILS::te_msg TE_INIT-86 INFO "Run TE::INIT::clear_project_all "
      if {[catch {TE::UTILS::clean_all_generated_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-87 ERROR "Script (TE::UTILS::clean_all_generated_files) failed: $result."; return -code error}
    }
    #--------------------------------
    #--run_labtools:todo:use run_te_procedure
    proc run_labtools {BOARD} {
      TE::UTILS::te_msg TE_INIT-88 INFO "Run TE::INIT::run_labtools $BOARD"
      #--
      if {[catch {TE::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-89 ERROR "Script (TE::INIT::remove_status_files) failed: $result."; return -code error}
      #--
      if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-90 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}
      if {[catch {init_board [TE::BDEF::find_id $BOARD] 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-91 ERROR "Script (TE::INIT::init_board /[TE::BDEF::find_id/]) failed: $result."; return -code error}
      if {[catch {TE::INIT::generate_labtools_project GUI} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-92 ERROR "Script (TE::INIT::generate_labtools_project) failed: $result."; return -code error}
    }
    #--------------------------------
    #--program_zynq_bin:
    proc program_zynq_bin {USE_BASEFOLDER BOARD SWAPP LABTOOLS} {
      TE::UTILS::te_msg TE_INIT-93 INFO "Run TE::INIT::program_zynq_bin $USE_BASEFOLDER $BOARD $SWAPP $LABTOOLS"
      #--
      if {[catch {TE::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-94 ERROR "Script (TE::INIT::remove_status_files) failed: $result."; return -code error}
      #--
      set return_filename ""
      if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-95 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}
      if {$LABTOOLS} {
        if {[catch {TE::INIT::generate_labtools_project} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-96 ERROR "Script (TE::INIT::generate_labtools_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [TE::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP -used_basefolder_binfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-97 ERROR "Script (TE::pr_program_flash_binfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [TE::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-98 ERROR "Script (TE::pr_program_flash_binfile) failed: $result."; return -code error}
        }
      } else {
        #dummi project need for jtag reboot memory
        set curpath [pwd]
        if {[catch {TE::INIT::generate_dummi_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-169 ERROR "Script (TE::INIT::generate_dummi_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [TE::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP -used_basefolder_binfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-99 ERROR "Script (TE::pr_program_flash_binfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [TE::pr_program_flash_binfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-100 ERROR "Script (TE::pr_program_flash_binfile) failed: $result."; return -code error}
        }
        if {[catch {TE::INIT::delete_dummi_project $curpath} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-101 ERROR "Script (TE::INIT::delete_dummi_project) failed: $result."; return -code error}
      }
      TE::UTILS::te_msg TE_INIT-102 INFO "Programming Flash without Error (Programming File: ${return_filename})  \n \
        ------"
    }
    #--------------------------------
    #--program_fpga_mcs:
    proc program_fpga_mcs {USE_BASEFOLDER BOARD SWAPP LABTOOLS} {
      TE::UTILS::te_msg TE_INIT-103 INFO "Run TE::INIT::program_fpga_mcs $USE_BASEFOLDER $BOARD $SWAPP $LABTOOLS"
      #--
      if {[catch {TE::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-104 ERROR "Script (TE::INIT::remove_status_files) failed: $result."; return -code error}
      #--
      set return_filename ""
      if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-105 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}
      if {$LABTOOLS} {
        if {[catch {TE::INIT::generate_labtools_project} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-106 ERROR "Script (TE::INIT::generate_labtools_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [TE::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP -used_basefolder_mcsfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-107 ERROR "Script (TE::pr_program_flash_mcsfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [TE::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-108 ERROR "Script (TE::pr_program_flash_mcsfile) failed: $result."; return -code error}
        }
      } else {
        #dummi project need for jtag reboot memory
        set curpath [pwd]
        if {[catch {TE::INIT::generate_dummi_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-109 ERROR "Script (TE::INIT::generate_dummi_project) failed: $result."; return -code error}
        if {$USE_BASEFOLDER} {
          if {[catch {set return_filename [TE::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP -used_basefolder_mcsfile]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-110 ERROR "Script (TE::pr_program_flash_mcsfile) failed: $result."; return -code error}
        } else {
          if {[catch {set return_filename [TE::pr_program_flash_mcsfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Zynq Flash configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-111 ERROR "Script (TE::pr_program_flash_mcsfile) failed: $result."; return -code error}
        }
        if {[catch {TE::INIT::delete_dummi_project $curpath} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-112 ERROR "Script (TE::INIT::delete_dummi_project) failed: $result."; return -code error}
      }
      TE::UTILS::te_msg TE_INIT-113 INFO "Programming Flash without Error (Programming File: ${return_filename})  \n \
        ------"
    }
    #--------------------------------
    #--program_fpga_bit:
    proc program_fpga_bit {USE_BASEFOLDER BOARD SWAPP LABTOOLS} {
      TE::UTILS::te_msg TE_INIT-114 INFO "Run TE::INIT::program_fpga_bit $USE_BASEFOLDER $BOARD $SWAPP $LABTOOLS"
      #--
      if {[catch {TE::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-115 ERROR "Script (TE::INIT::remove_status_files) failed: $result."; return -code error}
      #--
      set return_filename ""
      if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-116 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}
      if {$LABTOOLS} {
        if {[catch {TE::INIT::generate_labtools_project} result]} {abort_status "Error Generate LabTools Project..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-117 ERROR "Script (TE::INIT::generate_labtools_project) failed: $result."; return -code error}
          if {$USE_BASEFOLDER} {
            if {[catch {set return_filename [TE::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP -used_basefolder_bitfile]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-118 ERROR "Script (TE::pr_program_jtag_bitfile) failed: $result."; return -code error}
          } else {
            if {[catch {set return_filename [TE::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-119 ERROR "Script (TE::pr_program_jtag_bitfile) failed: $result."; return -code error}
          }
        } else {
        #dummi project need for jtag reboot memory
        set curpath [pwd]
        if {[catch {TE::INIT::generate_dummi_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-120 ERROR "Script (TE::INIT::generate_dummi_project) failed: $result."; return -code error}
          if {$USE_BASEFOLDER} {
            if {[catch {set return_filename [TE::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP -used_basefolder_bitfile]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-121 ERROR "Script (TE::pr_program_jtag_bitfile) failed: $result."; return -code error}
          } else {
            if {[catch {set return_filename [TE::pr_program_jtag_bitfile -used_board $BOARD -swapp $SWAPP]} result]} {abort_status "Error external Bitfile configuration..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-122 ERROR "Script (TE::pr_program_jtag_bitfile) failed: $result."; return -code error}
          }
        if {[catch {TE::INIT::delete_dummi_project $curpath} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-123 ERROR "Script (TE::INIT::delete_dummi_project) failed: $result."; return -code error}
      }
      TE::UTILS::te_msg TE_INIT-124 INFO "Programming FPGA without Error (Programming File: ${return_filename})  \n \
        ------"
    }
    #--------------------------------
    #--run_sdk:
    proc run_sdk {BOARD} {
      TE::UTILS::te_msg TE_INIT-125 INFO "Run TE::INIT::run_sdk $BOARD"
      #--
      if {[catch {TE::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-126 ERROR "Script (TE::INIT::remove_status_files) failed: $result."; return -code error}
      #--
      if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-127 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}
      if {[catch {TE::sw_run_sdk -prebuilt_hdf [TE::BDEF::find_id $BOARD]} result]} {abort_status "Error external SDK starting..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-128 ERROR "Script (TE::sw_run_sdk) failed: $result."; return -code error}
    }
    #--------------------------------
    #--run_project: VIVADO project
    proc run_project {BOARD RUN GUI CLEAN} {
      TE::UTILS::te_msg TE_INIT-129 INFO "Run TE::INIT::run_project $BOARD $RUN $GUI $CLEAN"
      #--
      if {[catch {TE::INIT::remove_status_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-130 ERROR "Script (TE::INIT::remove_status_files) failed: $result."; return -code error}
      #--
      if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-131 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}

      switch $CLEAN {
        0 {}
        1 {
            if {[catch {TE::UTILS::clean_vivado_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-132 ERROR "Script (TE::UTILS::clean_vivado_project) failed: $result."; return -code error}
          }
        2 {
            if {[catch {TE::UTILS::clean_vivado_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-133 ERROR "Script (TE::UTILS::clean_vivado_project) failed: $result."; return -code error}
            if {[catch {TE::UTILS::clean_workspace_hsi} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-134 ERROR "Script (TE::UTILS::clean_workspace_hsi) failed: $result."; return -code error}
          }
        3 {
            if {[catch {TE::UTILS::clean_all_generated_files} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-135 ERROR "Script (TE::UTILS::clean_all_generated_files) failed: $result."; return -code error}
          }
        4 {
            if {[catch {TE::UTILS::clean_all_generated_files;TE::UTILS::clean_prebuilt_all} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status;  TE::UTILS::te_msg TE_INIT-136 ERROR "Script (TE::UTILS::clean_all_generated_files , TE::UTILS::clean_prebuilt_all) failed: $result."; return -code error}
          }
        default {abort_status "Error Initialisation..."; create_allboardfiles_status; return -code error "Error: Design clean option $CLEAN not available, use [show_help]";}
      }
      if {$RUN > 0 } {
        if {[catch {init_board [TE::BDEF::find_id $BOARD] 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status;  TE::UTILS::te_msg TE_INIT-137 ERROR "Script (TE::INIT::init_board /[TE::BDEF::find_id/]) failed: $result."; return -code error}
      }
      switch $RUN {
        -1 {TE::UTILS::te_msg TE_INIT-138 INFO " Clear only Mode selected..."}
        0 {start_existing_project $GUI }
        1 {generate_single_project $GUI }
        2 {generate_single_project_all $GUI }
        3 {generate_board_file_project_all $GUI 0}
        4 {generate_board_file_project_all $GUI 1}
        default {abort_status "Error Initialisation..."; create_allboardfiles_status; return -code error "Error: Design run option $OPT not available, use [show_help]";}
      }
      TE::UTILS::te_msg TE_INIT-139 INFO "Run project finished without Error. \n \
        ------"
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished cmd functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # project design functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--generate_dummi_project: for external programming without labtools and sdk only 
    proc generate_dummi_project {} {
      file mkdir $TE::VPROJ_PATH/tmp 
      cd $TE::VPROJ_PATH/tmp 
      TE::UTILS::te_msg TE_INIT-140 STATUS "Create temporary vivado project in: [pwd]"
      ::create_project -force tmp $TE::VPROJ_PATH/tmp 
    }  
    #--------------------------------
    #--delete_dummi_project: for external programming without labtools and sdk only 
    proc delete_dummi_project {oldpath} {
      ::close_project
      TE::UTILS::te_msg TE_INIT-141 STATUS "Delete temporary vivado project in: [pwd]"
      cd $oldpath
      if {[catch {file delete -force -- $TE::VPROJ_PATH/tmp} result ]} {      
        # somtimes is locked from other process
        # puts "Info:(TE) Can't delete temporary folder."
      }
    }
    #--------------------------------
    #--start_existing_project: 
    proc start_existing_project {GUI} {
      if { [file exists $TE::VPROJ_PATH] } { 
        cd  $TE::VPROJ_PATH
        if { [file exists ${TE::VPROJ_NAME}.xpr] } { 
          TE::UTILS::te_msg TE_INIT-142 STATUS "Open existing project (File: ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.xpr)."
          if {[catch {TE::VIV::open_project} result]} { TE::UTILS::te_msg TE_INIT-143 ERROR "Script (TE::VIV::open_project) failed: $result."; return -code error}
          if {$GUI >= 1} {start_gui}
        } else {
            return -code error "Error: $TE::VPROJ_NAME.xpr not found in [pwd]";
          }
      } else {
        return -code error "Error: ${TE::VPROJ_PATH}/$TE::VPROJ_NAME.xpr not found";
      }	
      #---------------------------------------------
    }
    #--------------------------------
    #--generate_single_project: 
    proc generate_single_project {GUI } {
      if { [file exists $TE::VPROJ_PATH] } { 
        cd  $TE::VPROJ_PATH
        if { [file exists *.xpr] } { 
          return -code error "Error: Project folder not empty, clear [pwd]";
        }
      } else {
       TE::UTILS::te_msg TE_INIT-144 STATUS "Generate new project (Path: ${TE::VPROJ_PATH})."
       file mkdir $TE::VPROJ_PATH
       cd  $TE::VPROJ_PATH
       if {[catch {TE::VIV::create_project} result]} { TE::UTILS::te_msg TE_INIT-145 ERROR "Script (TE::VIV::create_project) failed: $result."; return -code error}
        if {$GUI == 1} { start_gui }
        if {[catch {TE::VIV::import_design} result]} { TE::UTILS::te_msg TE_INIT-146 ERROR "Script (TE::VIV::import_design) failed: $result."; return -code error}
        if {$GUI == 2} { start_gui }
      }	
    }
    #--------------------------------
    #--generate_single_project_all: 
    proc generate_single_project_all {GUI} {
      if {$GUI == 1} { generate_single_project 1 } else {generate_single_project 0 }
      #--------------------------------------------------------
      run_current_project_all
      #--------------------------------------------------------
      if {$GUI == 2} { start_gui}
    }
    #--------------------------------
    #--generate_board_file_project_all: 
    proc generate_board_file_project_all {GUI SDSOC} {
    
    
      foreach sublist $TE::BDEF::BOARD_DEFINITION {
        set rundesign true
        set id [lindex $sublist 0]
        if {$id ne "ID" } {
          if {[llength $TE::DESIGNRUNS] > 0} {
            if {[lsearch -exact $TE::DESIGNRUNS $id] == -1} {
              TE::UTILS::te_msg TE_INIT-147 STATUS "Skip ID: $id"
              set rundesign false
            }
          }
          if {$rundesign == true} {
            TE::UTILS::te_msg TE_INIT-148 STATUS "Run project id $id (Path: [pwd]) \n \
            ------"
            if {[catch {TE::UTILS::clean_vivado_project} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-149 ERROR "Script (TE::UTILS::clean_vivado_project) failed: $result."; return -code error}
            if {[catch {TE::UTILS::clean_workspace_hsi} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-150 ERROR "Script (TE::UTILS::clean_workspace_hsi) failed: $result."; return -code error}
            if {[catch {init_board $id 0} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-151 ERROR "Script (TE::init_board) failed: $result."; return -code error}
            if {[catch {generate_single_project_all  0} result]} {abort_status "Error generate projects..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-152 ERROR "Script (TE::generate_single_project_all) failed: $result."; return -code error}
            if {$SDSOC == 1 } {
              if {[catch {TE::ADV::beta_util_sdsoc_project} result]} {abort_status "Error generate projects..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-170 ERROR "Script (TE::generate_single_project_all) failed: $result."; return -code error}
            }
            TE::VIV::close_project
          }
        }
      }
      create_allboardfiles_status
    }
    #--------------------------------
    #--run_current_project_all: 
    proc run_current_project_all {} {
      # if {[catch {TE::VIV::build_design ${TE::GEN_HW_BIT} ${TE::GEN_HW_MCS} ${TE::GEN_HW_RPT}} result]} {TE::VIV::report_summary;set message "Error:(TE) Script (TE::VIV::build_design) failed: $result."; abort_status $emessage; puts $emessage; return -code error}
      set hw_options [list]
      if {!${TE::GEN_HW_BIT}} {lappend hw_options "-disable_bitgen"; TE::UTILS::te_msg TE_INIT-153 WARNING "Auto-generation of Bit-file is disabled."}
      if {!${TE::GEN_HW_RPT}} {lappend hw_options "-disable_reports"; TE::UTILS::te_msg TE_INIT-154 WARNING "Auto-generation of Report-file is disabled."}
      if {!${TE::GEN_HW_HDF}} {lappend hw_options "-disable_hdf"; TE::UTILS::te_msg TE_INIT-155 WARNING "Auto-generation of HDF-file is disabled."}
      if {!${TE::GEN_HW_MCS}} {lappend hw_options "-disable_mcsgen"; TE::UTILS::te_msg TE_INIT-156 WARNING "Auto-generation of MCS-file is disabled."}
      if {[catch {eval TE::hw_build_design ${hw_options}} result]} {TE::VIV::report_summary;set emessage "Error: Script (TE::hw_build_design) failed: $result."; abort_status $emessage;  create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-157 ERROR "$emessage" ; return -code error}
      #----------------------------------------------------------
      set sw_options [list]
      if {!${TE::GEN_SW_HSI}}     {lappend sw_options "-no_hsi"; TE::UTILS::te_msg TE_INIT-158 WARNING "Auto-generation of ELF-files is disabled."}
      if {!${TE::GEN_SW_BIF}}     {lappend sw_options "-no_bif"; TE::UTILS::te_msg TE_INIT-159 WARNING "Auto-generation of BIF-files is disabled."}
      if {!${TE::GEN_SW_BIN}}     {lappend sw_options "-no_bin"; TE::UTILS::te_msg TE_INIT-160 WARNING "Auto-generation of BIN-files is disabled."}
      if {!${TE::GEN_SW_BITMCS}}  {lappend sw_options "-no_bitmcs"; TE::UTILS::te_msg TE_INIT-161 WARNING "Auto-generation of BIT-files and MCS-files is disabled."}
      if {${TE::GEN_SW_USEPREBULTHDF}}  {lappend sw_options "-prebuilt_hdf_only"; lappend sw_options "$TE::SHORTDIR"; TE::UTILS::te_msg TE_INIT-162 WARNING "Prebuilt HDF is used."}
      if {${TE::GEN_SW_FORCEBOOTGEN}}  {lappend sw_options "-force_bin"; TE::UTILS::te_msg TE_INIT-163 WARNING "Force Boot.bin is used."}
      lappend sw_options "-clear"
      if {[catch {eval TE::sw_run_hsi ${sw_options}} result]} { set emessage "Error: Script (TE::sw_run_hsi) failed: $result."; abort_status $emessage; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-164 ERROR "$emessage" ; return -code error}
      abort_status "Ok"
    }
    #--------------------------------
    #--generate_labtools_project: 
    proc generate_labtools_project { {gui ""} } {
      if { [file exists $TE::VLABPROJ_PATH] } { 
        cd  $TE::VLABPROJ_PATH
        if { [file exists ${TE::VPROJ_NAME}.lpr] } { 
          if {[catch {TE::VLAB::open_project} result]} { TE::UTILS::te_msg TE_INIT-165 ERROR "Script (TE::VLAB::open_project) failed: $result."; return -code error}
        } else {
          if {[catch {TE::VLAB::create_project} result]} { TE::UTILS::te_msg TE_INIT-166 ERROR "Script (TE::VLAB::create_project) failed: $result."; return -code error}
        }
      } else {
       TE::UTILS::te_msg TE_INIT-167 STATUS "Generate new project (Path: $TE::VLABPROJ_PATH)"
       file mkdir $TE::VLABPROJ_PATH
       cd  $TE::VLABPROJ_PATH
       if {[catch {TE::VLAB::create_project} result]} { TE::UTILS::te_msg TE_INIT-168 ERROR "Script (TE::VLAB::create_project) failed: $result."; return -code error}
      }	
      if {$gui ne ""} {
        start_gui
      }
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished project design functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # status files functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--remove_status_files: 
    proc remove_status_files {} {
      if { [file exists ${TE::LOG_PATH}/allboardparts.txt] } {
        file delete -force ${TE::LOG_PATH}/allboardparts.txt
      }
      if { [file exists ${TE::LOG_PATH}/status.txt] } {
        file delete -force ${TE::LOG_PATH}/status.txt
      }
    }
    #--------------------------------
    #--create_allboardfiles_status: 
    proc create_allboardfiles_status {} {
      set report_file ${TE::LOG_PATH}/allboardparts.txt
      set fp_w [open ${report_file} "w"]
      puts $fp_w "it's generate only for powershell polling..."
      close $fp_w
    }
    #--------------------------------
    #--abort_status: 
    proc abort_status {message} {
      set report_file ${TE::LOG_PATH}/status.txt

      if { ![file exists ${report_file}]} {
        set fp_w [open ${report_file} "w"]
        puts $fp_w "Run ${TE::BOARDPART} with Status $message"
        close $fp_w
      } else {
        set fp_a [open ${report_file} "a"]
        puts $fp_a "Run ${TE::BOARDPART} with Status $message"
        close $fp_a
      }
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished status files functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  # -----------------------------------------------------------------------------------------------------------------------------------------
  }
  puts "INFO:(TE) Load Designs script finished"
}


