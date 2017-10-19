# --------------------------------------------------------------------
# --   *****************************
# --   *   Trenz Electronic GmbH   *
# --   *   Holzweg 19A             *
# --   *   32257 Bünde             *
# --   *   Germany                 *
# --   *****************************
# --------------------------------------------------------------------
# -- $Author :  Hartfiel, John $
# -- $Email :   j.hartfiel@trenz-electronic.de$
# --------------------------------------------------------------------
# -- Change History:
# ------------------------------------------
# -- $Date: 2016/04/11 | $Author: Hartfiel, John
# -- - initial release
# ------------------------------------------
# -- $Date: 2016/10/06  | $Author: Hartfiel, John
# -- - miscellaneous
# ------------------------------------------
# -- $Date: 2017/05/05  | $Author: xpohl
# -- -sdsoc 2016.4 platform export support, new platform directory structure and new master metafile
# ------------------------------------------
# -- $Date: 2017/07/02  | $Author: xpohl
# -- - sdsoc 2017.1 modifications. Platform utility now used for creating platform
# ------------------------------------------
# -- $Date: 2017/09/07  | $Author: Hartfiel, John
# -- - add new document history style
# -- - create messages ids
# -- - clean-up script
# -- - add new SDSoC predefined path structure
# -- - split zynqmp and zynq devices 
# -- - new folder structure 
# ------------------------------------------
# -- $Date: 2000/09/25  | $Author: Hartfiel, John
# -- - bugfix check_and_modify_vivado_project messages status only
# ------------------------------------------
# -- $Date: 2017/09/27  | $Author: xpohl
# -- - removed generation of linux target when preparing platform 
# --   for collection of prebuilt files (speed optimization)
# -- - added detection of platform dependent libraries, if detected 
# --   one library for each target, they are included to platform
# -- - moved some comments to better track process of platform creation
# ------------------------------------------
# -- $Date: 2017/10/04  | $Author: Pohl, Zdenek
# -- - Fixed sdsoc platform generation for Zynq family devices
# --    - using name zynq_fsbl.elf instead of fsbl.elf (ZU+ uses zynqmp_fsbl.elf)
# --    - project design name check now has 2 branches first for zynq (ZSYS) second for zynqmp (ZUSYS)
# --    - fixed typo in linux_path for zynq target
# ------------------------------------------
# -- $Date: 0000/00/00  | $Author:
# -- -
# --------------------------------------------------------------------
# --------------------------------------------------------------------
namespace eval TE {
  namespace eval SDSOC {
    #------------------------------------
    #--create_sdsoc_structure: ...
    proc create_sdsoc_structure {} {
    #clear old sdsoc
      # file mkdir ${TE::SDSOC_PATH}
      TE::UTILS::te_msg TE_SDSOC-0 STATUS "Create new SDSOC Platform Output Folder (${TE::SDSOC_PATH})."
      if {[file exists ${TE::TMP_PATH}]} { 
        if {[catch {file delete -force ${TE::TMP_PATH}} result]} {TE::UTILS::TE_SDSOC-1 ERROR " $result"}
      }
      if {![file exists ${TE::SDSOC_PATH}]} { 
        file mkdir ${TE::SDSOC_PATH}
      }
      if {[file exists ${TE::SDSOC_PATH}/${TE::SHORTDIR}]} { 
        if {[catch {file delete -force ${TE::SDSOC_PATH}/${TE::SHORTDIR}} result]} {TE::UTILS::TE_SDSOC-2 ERROR " $result"}
      }

	  # creating tmp directory for sdsoc platform generator 
      #copy default sdsoc source to tmp
      if {[file exists ${TE::SET_PATH}/sdsoc/predefined]} {
        file copy -force ${TE::SET_PATH}/sdsoc/predefined ${TE::TMP_PATH}
      } else {
         TE::UTILS::te_msg TE_SDSOC-3 ERROR "Predefined SDSoC sources not found on ${TE::SET_PATH}/sdsoc/predefined."
         return -code error;
      }
      
      if {$TE::IS_ZUSYS} { #zynqMP
        # --------------------------------------------
        #linker scripts for standalone apps (default or for special for assembly variant)
        set linker_script ${TE::SET_PATH}/sdsoc/generic/sw/a53_standalone/lscript.ld_default
        if {[file exists ${TE::SET_PATH}/sdsoc/generic/sw/a53_standalone/lscript.ld_${TE::SHORTDIR}]} {
          set linker_script ${TE::SET_PATH}/sdsoc/generic/sw/a53_standalone/lscript.ld_${TE::SHORTDIR}
        }
        if {[file exists ${linker_script}]} {
          file copy -force ${linker_script} ${TE::TMP_PATH}/sw/a53_standalone/lscript.ld
        } else {
         TE::UTILS::te_msg TE_SDSOC-4  {CRITICAL WARNING} "Predefined Linker Scripted not found on ${TE::SET_PATH}/sdsoc/generic/sw/a53_standalone/."
        }
        # --------------------------------------------
        # prebuilt files
        # set search paths
        set prebuilt_pl_path ${TE::PREBUILT_OS_PATH}/petalinux/default
        if {[file exists ${TE::PREBUILT_OS_PATH}/petalinux/${TE::SHORTDIR}]} {
            set prebuilt_pl_path ${TE::PREBUILT_OS_PATH}/petalinux/${TE::SHORTDIR}
        }
        set prebuilt_sw_path ${TE::PREBUILT_SW_PATH}/default
        if {[file exists ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}]} {
            set prebuilt_sw_path ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}
        }
        # ---------------
        # fsbl
        set elf_list []
        if { [catch {set elf_list [ glob ${prebuilt_pl_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              # if found copy fsbl
              if {[string match *fsbl* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_linux/boot/zynqmp_fsbl.elf
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_standalone/boot/zynqmp_fsbl.elf
              }
          }
	      }
        # sdk prebuilt overwrites petalinux prebuilt
        set elf_list []
	      if { [catch {set elf_list [ glob ${prebuilt_sw_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              # if found copy fsbl
              if {[string match *fsbl* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_linux/boot/zynqmp_fsbl.elf
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_standalone/boot/zynqmp_fsbl.elf
              }
          }
	      }
        #todo message if file not found
        # ---------------
        # pmufw (for linux only)
        set elf_list []
        if { [catch {set elf_list [ glob ${prebuilt_pl_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              if {[string match *pmufw* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_linux/boot/zynqmp_pmufw.elf
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_standalone/boot/zynqmp_pmufw.elf
              }
          }
	      }
        # sdk prebuilt overwrites petalinux prebuilt
        set elf_list []
	      if { [catch {set elf_list [ glob ${prebuilt_sw_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              if {[string match *pmufw* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_linux/boot/zynqmp_pmufw.elf
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_standalone/boot/zynqmp_pmufw.elf
              }
          }
	      }
        #todo message if file not found
        # ---------------
        # bl31 (ATF) (for linux only)
        set elf_list []
        if { [catch {set elf_list [ glob ${prebuilt_pl_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              if {[string match *bl31* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_linux/boot/bl31.elf
                # file copy -force $elf ${TE::TMP_PATH}/sw/a53_standalone/boot/bl31.elf
              }
          }
	      }
        #todo message if file not found
        # ---------------
        # u-boot (for linux only)
        set elf_list []
        if { [catch {set elf_list [ glob ${prebuilt_pl_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              if {[string match *u-boot* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/a53_linux/boot/u-boot.elf
                # file copy -force $elf ${TE::TMP_PATH}/sw/a53_standalone/boot/u-boot.elf
              }
          }
	      }
        #todo message if file not found
        # ---------------
        # image.ub (for linux only)
        set image_list []
        if { [catch {set image_list [ glob ${prebuilt_pl_path}/*.ub ] }] } {
	      } else {
          foreach img $image_list {
              if {[string match *image* $img]} {
                file copy -force $image_list ${TE::TMP_PATH}/sw/a53_linux/image/image.ub
              }
          }
	      }
        #todo message if file not found
      } elseif {$TE::IS_ZSYS} { #zynq 7000
        # --------------------------------------------
        #linker scripts for standalone apps (default or for special for assembly variant)
        set linker_script ${TE::SET_PATH}/sdsoc/generic/sw/standalone/lscript.ld_default
        if {[file exists ${TE::SET_PATH}/sdsoc/generic/sw/standalone/lscript.ld_${TE::SHORTDIR}]} {
          set linker_script ${TE::SET_PATH}/sdsoc/generic/sw/standalone/lscript.ld_${TE::SHORTDIR}
        }
        if {[file exists ${linker_script}]} {
          file copy -force ${linker_script} ${TE::TMP_PATH}/sw/standalone/lscript.ld
        } else {
         TE::UTILS::te_msg TE_SDSOC-5  {CRITICAL WARNING} "Predefined Linker Scripted not found on ${TE::SET_PATH}/sdsoc/generic/sw/standalone/."
        }
        # --------------------------------------------
        # prebuilt files
        # set search paths
        set prebuilt_pl_path ${TE::PREBUILT_OS_PATH}/petalinux/default
        if {[file exists ${TE::PREBUILT_OS_PATH}/petalinux/${TE::SHORTDIR}]} {
            set prebuilt_pl_path ${TE::PREBUILT_OS_PATH}/petalinux/${TE::SHORTDIR}
        }
        set prebuilt_sw_path ${TE::PREBUILT_SW_PATH}/default
        if {[file exists ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}]} {
            set prebuilt_sw_path ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}
        }
        # ---------------
        # fsbl
        set elf_list []
        if { [catch {set elf_list [ glob ${prebuilt_pl_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              # if found copy fsbl
              if {[string match *fsbl* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/linux/boot/zynq_fsbl.elf
                file copy -force $elf ${TE::TMP_PATH}/sw/standalone/boot/zynq_fsbl.elf
              }
          }
	      }
        # sdk prebuilt overwrites petalinux prebuilt
        set elf_list []
	      if { [catch {set elf_list [ glob ${prebuilt_sw_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              # if found copy fsbl
              if {[string match *fsbl* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/linux/boot/zynq_fsbl.elf
                file copy -force $elf ${TE::TMP_PATH}/sw/standalone/boot/zynq_fsbl.elf
              }
          }
	      }
        #todo message if file not found
        # ---------------
        # u-boot (for linux only)
        set elf_list []
        if { [catch {set elf_list [ glob ${prebuilt_pl_path}/*.elf ] }] } {
	      } else {
          foreach elf $elf_list {
              if {[string match *u-boot* $elf]} {
                file copy -force $elf ${TE::TMP_PATH}/sw/linux/boot/u-boot.elf
                # file copy -force $elf ${TE::TMP_PATH}/sw/astandalone/boot/u-boot.elf
              }
          }
	      }
        #todo message if file not found
        # ---------------
        # image.ub (for linux only)
        set image_list []
        if { [catch {set image_list [ glob ${prebuilt_pl_path}/*.ub ] }] } {
	      } else {
          foreach img $image_list {
              if {[string match *image* $img]} {
                file copy -force $image_list ${TE::TMP_PATH}/sw/linux/image/image.ub
              }
          }
	      }
        #todo message if file not found
      } else {
        TE::UTILS::te_msg TE_SDSOC-6 Error "Script only for Zynq or ZynqMP systems"
        return -code error;
      }
    }
      
    #---------------------------------------------------------------------------  
      
      
      
    #------------------------------------
    #--check_vivado_project: ...
    proc check_and_modify_vivado_project {check_only} {
      set er_det false
      set war_det false
      set te_txt  "SDSOC design check: \n\
      \ Notes: \n\
      \   -Errors: could not fixed automatically.\n\
      \   -Warnings: will be fixed automatically and can be ignored.\n\
      \ Check design: starts:\n"
      if {!$check_only} { TE::UTILS::te_msg TE_SDSOC-7 STATUS "Start project modification for SDSoC."}
      
      #------------------
      #check sdsoc environment :
      #
      set te_txt "$te_txt\   - Check SDSOC environment:"
      if {!$TE::SDSOC_AVAILABLE} {
          set te_txt "$te_txt\ failed.\n"
          set er_det true
          if {!$check_only} {
            TE::UTILS::te_msg TE_SDSOC-8 ERROR $te_txt
            return -code error $te_txt
          }
      } else {set te_txt "$te_txt\ passed.\n";}
      #------------------
      # check project name (TE Script restriction)
      #
      set te_txt "$te_txt\   - Check Project Design Name:"
      if {$TE::IS_ZUSYS} {
	# check project design name for Zynq Ultrascale device family
        if {![string match *zusys*  ${TE::VPROJ_NAME}]} {
          set te_txt "$te_txt\ failed (Name must contain *zusys*).\n";
          set er_det true
          if {!$check_only} {

            TE::UTILS::te_msg TE_SDSOC-9 ERROR $te_txt
            return -code error $te_txt
          }
        } else {set te_txt "$te_txt\ passed.\n";}
      } elseif {$TE::IS_ZSYS} {  
	# check project design name for Zynq device family
        if {![string match *zsys*  ${TE::VPROJ_NAME}]} {
          set te_txt "$te_txt\ failed (Name must contain *zsys*).\n";
          set er_det true
          if {!$check_only} {

            TE::UTILS::te_msg TE_SDSOC-28 ERROR $te_txt
            return -code error $te_txt
          }
        } else {set te_txt "$te_txt\ passed.\n";}
      }
      #------------------
      #check #of bd files:
      #currently only one bdfile supported (TE restriction)
      set te_txt "$te_txt\   - Check Block Design quantity:"
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.srcs/${TE::SOURCE_NAME}/bd/ * *.bd]}] } {
          set te_txt "$te_txt\ failed (BD not available).\n";
          set er_det true
          if {!$check_only} {
            TE::UTILS::te_msg TE_SDSOC-10 ERROR $te_txt
            return -code error $te_txt
          } 
      } elseif {[llength $bd_files]>1 } {
          set te_txt "$te_txt\ failed (more than one BD).\n";
          set er_det true
          if {!$check_only} {
            TE::UTILS::te_msg TE_SDSOC-11 ERROR $te_txt
            return -code error $te_txt
          }
      } else {set te_txt "$te_txt\ passed.\n";}

      #------------------
      # check top block design name equal VPROJ_NAME
      #
      set te_txt "$te_txt\   - Check Block Design Name:"
      set bd $bd_files
      # open_bd_design $bd -quiet
      # set bd_name [get_bd_designs]
      set bd_name [open_bd_design $bd -quiet]
      if {![string match ${TE::VPROJ_NAME} $bd_name]} {
        set te_txt "$te_txt\ failed (BD (${bd_name}) unequal PRJ(${TE::VPROJ_NAME})).\n";
        set er_det true
        # set war_det true  --> change to er to war, if rename is complete implemented
        if {!$check_only} {
          #Note: TODO reload bd without close project. This is possible on this step. At the moment only failed
          # change block design name in tcl file
          # if {[file exists "${TE::BD_PATH}/${bd_name}_bd.tcl"]} {
              # #file exists, replace add correct platform name at the first line of the file
              # # open file for reading
              # set frd [open "${TE::BD_PATH}/${bd_name}_bd.tcl" r]
              
              # # open output file
              # set fwr [open "${TE::BD_PATH}/${bd_name}_bd.tcl.temp" w]
              
              # # read lines, replace required string and write result to file
              # while { [gets $frd line] >= 0 } {
            # if {[string match "set design_name *" $line]} {
                # set res "set design_name ${TE::VPROJ_NAME}"
            # } else {
                # set res $line
            # }
            # puts $fwr $res 
              # }
              
              # # close files
              # close $frd
              # close $fwr
              
              # #delete old file
              # file rename -force "${TE::BD_PATH}/${bd_name}_bd.tcl.temp" "${TE::BD_PATH}/${bd_name}_bd.tcl"
              # #Note: TODO reload bd without close project. This is possible on this step. At the moment only failed
            
           
              # return -code error "Follow steps above to setup design with new name"
          # } else {
              # return -core error "Block design TCL backup file (${TE::BD_PATH}/${bd_name}_bd.tcl) not found."
          # }	
          TE::UTILS::te_msg TE_SDSOC-12 ERROR $te_txt
          return -code error $te_txt
        }
      } else {set te_txt "$te_txt\ passed.\n";}
      close_bd_design [get_bd_designs $bd]
      #------------------
      #check board part :
      #TODO check if it works without remove board part file!!
      #board part not allowed
      set te_txt "$te_txt\   - Check Board Part:"
      if {[get_property board_part [current_project]] ne ""} {
          if {!$check_only} {
            TE::ADV::beta_hw_remove_board_part
            set te_txt "$te_txt\ passed (Board Part was removed).\n";
          } else { 
            set te_txt "$te_txt\ failed (Board Part not allowed for SDSoC).\n";
            set war_det true
          }
      } else {set te_txt "$te_txt\ passed.\n"}
      #------------------
      if {$er_det==true} {
        TE::UTILS::te_msg TE_SDSOC-13 ERROR $te_txt
      } elseif {$war_det==true} {
        TE::UTILS::te_msg TE_SDSOC-14 WARNING $te_txt
      } else {
        TE::UTILS::te_msg TE_SDSOC-15 INFO $te_txt
      }
    }

    #------------------------------------
    #--export_vivado_project: ...
    proc export_vivado_sdsoc_project {} {
          TE::UTILS::te_msg TE_SDSOC-16 STATUS "Start SDSoC export."
	
      # get correct name of the hardware export script
      if {$TE::IS_ZSYS} {
          set hw_export_tcl_name zsys_sdsoc_pfm.tcl
      } elseif {$TE::IS_ZUSYS} {
          set hw_export_tcl_name zusys_sdsoc_pfm.tcl
      } else {
          TE::UTILS::te_msg TE_SDSOC-17 ERROR "Unknown system architecture, only ZYNQ and ZynqMP supported."
      }

      # update project name in hardware platform export tcl script (sdsoc_pfm.tcl)
      # check the existence of the script first
      if {[file exists ${TE::SET_PATH}/sdsoc/generic/${hw_export_tcl_name}]} {
          TE::UTILS::te_msg TE_SDSOC-18 STATUS "Create hardware platform export script on: ${TE::TMP_PATH}/${hw_export_tcl_name}"
          #file exists, replace add correct platform name at the first line of the file
          # open file for reading
          set frd [open ${TE::SET_PATH}/sdsoc/generic/${hw_export_tcl_name} r]
          
          # open output file
          set fwr [open ${TE::TMP_PATH}/${hw_export_tcl_name} w]
          
          # read lines, replace required string and write result to file
          while { [gets $frd line] >= 0 } {
            if {[string match "set ::design_name *" $line]} {
                set res "set ::design_name ${TE::VPROJ_NAME}"
            } elseif {[string match "sdsoc::pfm_description \$pfm *" $line]} {
                set res "sdsoc::pfm_description \$pfm \"Trenz Basic SDSoC Platform for ${TE::PRODID} (${TE::BOARDPART}, ${TE::PARTNAME}) \""
            } else {
                set res $line
            }
            puts $fwr $res 
          }
          
          # close files
          close $frd
          close $fwr
          
          # rename temp file 
          # file rename -force ${TE::SET_PATH}/sdsoc/generic/${hw_export_tcl_name}.temp ${TE::SET_PATH}/sdsoc/generic/${hw_export_tcl_name}
      } else {
        TE::UTILS::te_msg TE_SDSOC-19 ERROR "Hardware platform export template script (${TE::SET_PATH}/sdsoc/generic/${hw_export_tcl_name}) not found."
      }	 
      
    }

    #------------------------------------
    #--create_sdsoc_pfm: ...
    proc create_sdsoc_pfm {} {
      TE::UTILS::te_msg TE_SDSOC-20 STATUS "Create SDSoC Platform Project."
      # set correct architecture dependent paths and files
      if {$TE::IS_ZSYS} {
          set hw_export_tcl_name zsys_sdsoc_pfm.tcl
          set cpu_arch cortex-a9
          set standalone_path standalone
          set linux_path linux
      } elseif {$TE::IS_ZUSYS} {
          set hw_export_tcl_name zusys_sdsoc_pfm.tcl
          set cpu_arch cortex-a53
          set standalone_path a53_standalone
          set linux_path a53_linux
      } else {
          TE::UTILS::te_msg TE_SDSOC-21 ERROR "Unknown system architecture, only ZYNQ and ZynqMP supported."
      }
      
      file mkdir ${TE::TMP_PATH}/PF

      TE::UTILS::te_msg TE_SDSOC-22 INFO "Exporting SDSoC platform take long time, do not interrupted."
      #call platform utility
      TE::UTILS::te_msg TE_SDSOC-23 INFO "Preparing prebuilt files (Note: can take long time) "
      exec sdspfm\
          -xpr    "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.xpr"\
          -pfmtcl "${TE::TMP_PATH}/${hw_export_tcl_name}"\
          -o      "${TE::TMP_PATH}/PF"\
          -sds-cfg\
          -arch ${cpu_arch} -os standalone -name "Standalone" -id standalone -rt cpp\
          -bif "${TE::TMP_PATH}/sw/${standalone_path}/boot/standalone.bif"\
          -readme "${TE::TMP_PATH}/sw/${standalone_path}/boot/generic.readme"\
          -boot "${TE::TMP_PATH}/sw/${standalone_path}/boot/"\
          -lscript "${TE::TMP_PATH}/sw/${standalone_path}/lscript.ld"\
          -sds-end



      #--------------------
      # build platform for the first time to get files for prebuilt section of the platform. Do not generate bitstream (we already have one from step TE::hw_build_design -export_prebuilt)
      set old_dir [pwd]
      cd ${TE::TMP_PATH}/empty_app
      exec make OS=STANDALONE PLATFORM=../PF/${TE::VPROJ_NAME} clean
      exec make OS=STANDALONE PLATFORM=../PF/${TE::VPROJ_NAME} 

      TE::UTILS::te_msg TE_SDSOC-24 INFO "Collecting prebuilt files."
      # clean all and collect prebuilt files from compiled empty sw application
      file mkdir ${TE::TMP_PATH}/prebuilt
      file copy\
          "${TE::TMP_PATH}/empty_app/_sds/swstubs/portinfo.c"\
          "${TE::TMP_PATH}/empty_app/_sds/swstubs/portinfo.h"\
          "${TE::TMP_PATH}/empty_app/_sds/.llvm/apsys_0.xml"\
          "${TE::TMP_PATH}/empty_app/_sds/.llvm/partitions.xml"\
          "${TE::TMP_PATH}/empty_app/_sds/p0/ipi/${TE::VPROJ_NAME}.sdk/${TE::VPROJ_NAME}.hdf"\
          "${TE::TMP_PATH}/prebuilt"

      # add bitstream to prebuilt files
      file copy "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.bit" "${TE::TMP_PATH}/prebuilt/bitstream.bit"

      #search if library files for platform are provided
      #we support one library file for standalone and one for linux targes
      set standalone_libs [glob -nocomplain -directory ${TE::TMP_PATH}/sw/${standalone_path}/lib *.a]
      set linux_libs [glob -nocomplain -directory ${TE::TMP_PATH}/sw/${linux_path}/lib *.a]

      #if there is one library file for each target, add both libraries to the platform
      if {[llength $standalone_libs] == 1 && 
          [llength $linux_libs] == 1} then {
        #re export platform with samples, prebuilt and libraries  
	TE::UTILS::te_msg TE_SDSOC-25 INFO "Creating SDSoC platform with libraries."
      exec sdspfm\
          -xpr    "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.xpr"\
          -pfmtcl "${TE::TMP_PATH}/${hw_export_tcl_name}"\
          -o      "${TE::TMP_PATH}/PF"\
          -samples "${TE::TMP_PATH}/samples"\
          -prebuilt "${TE::TMP_PATH}/prebuilt"\
          -force\
          -sds-cfg\
          -arch ${cpu_arch} -os standalone -name "Standalone" -id standalone -rt cpp\
          -bif "${TE::TMP_PATH}/sw/${standalone_path}/boot/standalone.bif"\
          -readme "${TE::TMP_PATH}/sw/${standalone_path}/boot/generic.readme"\
          -boot "${TE::TMP_PATH}/sw/${standalone_path}/boot/"\
          -lscript "${TE::TMP_PATH}/sw/${standalone_path}/lscript.ld"\
          -inc "${TE::TMP_PATH}/sw/${standalone_path}/include"\
          -lib $standalone_libs \
          -sds-end\
          -sds-cfg\
          -arch ${cpu_arch} -os linux -name "Linux" -id linux -rt cpp\
          -bif "${TE::TMP_PATH}/sw/${linux_path}/boot/linux.bif"\
          -readme "${TE::TMP_PATH}/sw/${linux_path}/boot/generic.readme"\
          -boot "${TE::TMP_PATH}/sw/${linux_path}/boot/"\
          -image "${TE::TMP_PATH}/sw/${linux_path}/image/image.ub"\
          -inc "${TE::TMP_PATH}/sw/${linux_path}/include"\
          -lib $linux_libs \
          -sds-end 
      } else { # there are no libraries present
	TE::UTILS::te_msg TE_SDSOC-25 INFO "Creating SDSoC platform."
        exec sdspfm\
          -xpr    "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.xpr"\
          -pfmtcl "${TE::TMP_PATH}/${hw_export_tcl_name}"\
          -o      "${TE::TMP_PATH}/PF"\
          -samples "${TE::TMP_PATH}/samples"\
          -prebuilt "${TE::TMP_PATH}/prebuilt"\
          -force\
          -sds-cfg\
          -arch ${cpu_arch} -os standalone -name "Standalone" -id standalone -rt cpp\
          -bif "${TE::TMP_PATH}/sw/${standalone_path}/boot/standalone.bif"\
          -readme "${TE::TMP_PATH}/sw/${standalone_path}/boot/generic.readme"\
          -boot "${TE::TMP_PATH}/sw/${standalone_path}/boot/"\
          -lscript "${TE::TMP_PATH}/sw/${standalone_path}/lscript.ld"\
          -sds-end\
          -sds-cfg\
          -arch ${cpu_arch} -os linux -name "Linux" -id linux -rt cpp\
          -bif "${TE::TMP_PATH}/sw/${linux_path}/boot/linux.bif"\
          -readme "${TE::TMP_PATH}/sw/${linux_path}/boot/generic.readme"\
          -boot "${TE::TMP_PATH}/sw/${linux_path}/boot/"\
          -image "${TE::TMP_PATH}/sw/${linux_path}/image/image.ub"\
          -sds-end 
      }
          
      # change directory
      cd ${old_dir}
      # cp SDSoC from tmp to SDSoC 
      file mkdir ${TE::SDSOC_PATH}/${TE::SHORTDIR}/
      if {[catch {file copy -force ${TE::TMP_PATH}/PF/${TE::VPROJ_NAME} ${TE::SDSOC_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}} result]} {TE::UTILS::te_msg TE_SDSOC-26 ERROR " $result"}
      #delete tmp dir
      if {[file exists ${TE::TMP_PATH}]} { 
        if {[catch {file delete -force ${TE::TMP_PATH}} result]} {TE::UTILS::te_msg TE_SDSOC-27 ERROR " $result"}
      }
    }
  }
  puts "INFO:(TE) Load SDSoC script finished"
}

