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
# -- $Date: 2016/02/1 | $Author: Hartfiel, John
# -- - initial release
# ------------------------------------------
# -- $Date: 2017/05/12  | $Author: Hartfiel, John
# -- - bugfix missing bracket
# ------------------------------------------
# -- $Date: 2017/05/18  | $Author: Hartfiel, John
# -- - add pmuf to zynqmp bif
# ------------------------------------------
# -- $Date: 2017/06/13  | $Author: Hartfiel, John
# -- - add pmuf hsi/sdk support
# ------------------------------------------
# -- $Date:  2017/09/04  | $Author: Hartfiel, John
# -- - add new document history style
# ------------------------------------------
# -- $Date: 0000/00/00  | $Author:
# -- - 
# --------------------------------------------------------------------
# --------------------------------------------------------------------

namespace eval TE {
  namespace eval EXT {
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # *elf generation functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--run_sdk:  
    proc run_sdk {} {
        set cur_path [pwd]
        cd $TE::WORKSPACE_SDK_PATH
        set tmplist [list]
        if {[file exists ${TE::XILINXGIT_DEVICETREE}]} {
          TE::UTILS::te_msg TE_SW-0 STATUS "Include Xilinx Device Tree git clone."
          lappend tmplist "-lp" $TE::LIB_PATH
          lappend tmplist "-lp" ${TE::XILINXGIT_DEVICETREE}
        } else {
          TE::UTILS::te_msg TE_SW-1 WARNING "Xilinx Device Tree git clone path not found (${TE::XILINXGIT_DEVICETREE})."
          lappend tmplist "-lp" $TE::LIB_PATH
        }
        set command exec
        lappend command xsdk
        lappend command -workspace ${TE::WORKSPACE_SDK_PATH}
        set hdffilename ""
        [catch {set hdffilename [glob -join -dir ${TE::WORKSPACE_SDK_PATH}/ *.hdf]}]
        if {[file exists ${TE::WORKSPACE_SDK_PATH}/${TE::PR_TOPLEVELNAME}.hdf]} {
          lappend command -hwspec ${TE::WORKSPACE_SDK_PATH}/${TE::PR_TOPLEVELNAME}.hdf
        } elseif {[file exists ${TE::WORKSPACE_SDK_PATH}/${TE::VPROJ_NAME}.hdf]} {
          lappend command -hwspec ${TE::WORKSPACE_SDK_PATH}/${TE::VPROJ_NAME}.hdf
        } else {
          lappend command -hwspec ${hdffilename}
        }
        # lappend command -hwspec ${TE::WORKSPACE_SDK_PATH}/${TE::VPROJ_NAME}.hdf
        # lappend command -bit ${TE::WORKSPACE_SDK_PATH}/${TE::VPROJ_NAME}.bit
        lappend command {*}$tmplist
        # lappend command --vivrun 
        TE::UTILS::te_msg TE_SW-2 INFO "Start SKD: \n \
          Run \"$command\" in $TE::WORKSPACE_SDK_PATH \n \
          Please Wait.. \n \
        ------"
        set result [eval $command]
        TE::UTILS::te_msg TE_EXT-0 INFO "Command results from SDK \"$command\": \n \
          $result \n \
        ------"
        cd $cur_path
    }
    #--------------------------------
    #--run_hsi:  
    proc run_hsi {} {
      # list 0 for table header
      if { [llength $TE::SW_APPLIST] > 1} {
        set cur_path [pwd]
        cd $TE::WORKSPACE_HSI_PATH
        set tmp_libpath [list]
        lappend tmp_libpath $TE::LIB_PATH 
        if {[file exists ${TE::XILINXGIT_DEVICETREE}]} {
          TE::UTILS::te_msg TE_SW-3 STATUS "Include Xilinx Device Tree git clone."
          lappend tmp_libpath ${TE::XILINXGIT_DEVICETREE}
        } else {
          TE::UTILS::te_msg TE_SW-4 WARNING "Xilinx Device Tree git clone path not found (${TE::XILINXGIT_DEVICETREE})."
        }
        set tmp_sw_liblist [list]
        lappend tmp_sw_liblist $tmp_libpath
        set tmp_sw_applist [list]
        lappend tmp_sw_applist $TE::SW_APPLIST
        #
        set command exec
        lappend command hsi
        lappend command -source  ${TE::SCRIPT_PATH}/script_hsi.tcl
        lappend command -tclargs
        lappend command "--sw_list ${tmp_sw_applist} --lib $tmp_sw_liblist --vivrun"
        # lappend command --vivrun 
        TE::UTILS::te_msg TE_SW-5 INFO "Start HSI: \n \
          Run \"$command\" in $TE::WORKSPACE_HSI_PATH \n \
          Please Wait.. \n \
        ------"
        set result [eval $command]
        TE::UTILS::te_msg TE_EXT-1 INFO "Command results from HSI \"$command\": \n \
          $result \n \
        ------"
        cd $cur_path
        TE::UTILS::copy_sw_files
      }
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished *elf generation
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # *bit/*mcs generation functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--generate_app_bit_mcs:  
    proc generate_app_bit_mcs {{fname ""}} {
      #microblaze
      set int_shortdir ${TE::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[TE::BDEF::find_shortdir $fname]"
      }
      #run only if *.mmi exists
      if {[file exists  ${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.mmi]} { 
        # read processor from mmi
        set fp [open "${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.mmi" r]
        set file_data [read $fp]
        close $fp
        set tmp [split $file_data "\n"]
        foreach t $tmp {
          if {[string match *InstPath=* $t] } {
            set splittstring [split $t "="]
            set next false
            set hitval "NA"
            foreach part $splittstring {
              if {$next} {
                set hitval $part
                break
              }
              if {[string match *InstPath* $part] } {
                set next true
              }
            }
            set hitval [string map {">" ""} $hitval]
            set hitval [string map {"\"" ""} $hitval]
            if { $hitval eq "NA"} {
              TE::UTILS::te_msg TE_SW-6 ERROR "Processor not found in ${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.mmi."
              return -code error "Processor not found in ${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.mmi.";
            }
          }
        }
        #---------------
        foreach sw_applist_line ${TE::SW_APPLIST} {
          #generate modified mcs or bit only if app_list.csv->steps=0(generate all), add file to mcs use "FIRM"
          set app_name [lindex $sw_applist_line 1]
          if {[lindex $sw_applist_line 2] eq "0"} {
            #read app name
            #delete old one
            if {[file exists ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.bit]} {
              file delete -force ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.bit
            }
            #make folder if not exists
            file mkdir ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
            #
            #todo:hier noch in default suche?
            TE::UTILS::te_msg TE_SW-7 STATUS "Generate ${app_name}.bit with app: ${app_name}."
            set command exec
            lappend command updatemem
            lappend command -force
            lappend command -meminfo ${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.mmi
            lappend command -data ${TE::PREBUILT_SW_PATH}/${int_shortdir}/${app_name}.elf
            lappend command -bit ${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.bit
            lappend command -proc $hitval
            lappend command -out ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.bit
            TE::UTILS::te_msg TE_SW-8 INFO "Start Update Memory: \n \
              Run \"$command\" in ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name} \n \
              Please Wait.. \n \
            ------"
            set result [eval $command]
            TE::UTILS::te_msg TE_EXT-2 INFO "Command results from Update Memory \"$command\": \n \
              $result \n \
            ------"     
          }
          #write mcs
          if {[lindex $sw_applist_line 2] eq "0" || [lindex $sw_applist_line 2] eq "FIRM"} {
           if {$TE::CFGMEM_MEMSIZE_MB ne "NA"} {
              #todo generate relativ path from absolute paths
            set rel_bitfile  "../prebuilt/hardware"
            set rel_bitfile2 "../prebuilt/boot_images"
            set rel_data_file ".."
              #make folder if not exists
              file mkdir ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
              #
              TE::UTILS::te_msg TE_SW-8 STATUS "Generate ${app_name}.mcs with app: ${app_name}."
              #set bitfile to mcs load
              if {[lindex $sw_applist_line 2] eq "FIRM"} {
                set load_data "up 0x0 ${rel_bitfile}/${int_shortdir}/${TE::VPROJ_NAME}.bit "
              } else {
                set load_data "up 0x0 ${rel_bitfile2}/${int_shortdir}/${app_name}/${app_name}.bit "
              }
              #get upload data 01:
              set data_index 5
              while {$data_index < [llength $sw_applist_line] } {
                if {[lindex $sw_applist_line 5] ne "NA"} {
                  set load_data "$load_data up [lindex $sw_applist_line [expr $data_index+1]] ${rel_data_file}/[lindex $sw_applist_line $data_index] "
                }
                set data_index [expr $data_index+3]
              }
              #write mcs
              # -loadbit $load_bit 
              write_cfgmem -force -format mcs -checksum FF -interface $TE::CFGMEM_IF -size $TE::CFGMEM_MEMSIZE_MB \
              -loaddata $load_data \
              -file ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/${app_name}.mcs
            } else {
              TE::UTILS::te_msg TE_SW-9 {CRITICAL WARNING} "FPGA FLASH TYP  is not specified in *.board_files.csv. *.mcs file is not generated."
            }  
          }
        }
      } else {
        TE::UTILS::te_msg TE_SW-10 WARNING "${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.mmi not found. Nothing is done."
      }
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished *bit/*mcs generation functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # *bin/*bif generation functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--generate_bif_files:  
    proc generate_bif_files {{fname ""}} {
      set int_shortdir ${TE::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[TE::BDEF::find_shortdir $fname]"
      }
      #todo generate relativ path from absolute paths
      set checkfile ""
      set fsbl_name ""
      set rel_bif_bitfile "../../../hardware"
      set rel_bif_fsbl    "../../../software"
      set rel_bif_hsipmu    "../../../software"
      set rel_bif_data01_file "../../../../"
      set rel_bif_appfile "../../../"
      set rel_base ""
      set bif_bitfile ""
      set bif_fsbl    ""
      set bif_data01_file ""
      set bif_appfile ""
      
      #check bitfile
      if {![file exists ${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.bit]} { 
        # search default
        if {![file exists ${TE::PREBUILT_HW_PATH}/default/${TE::VPROJ_NAME}.bit]} {
        # default  not found
          TE::UTILS::te_msg TE_SW-11 ERROR "Bit-file was not found (${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.bit or ${TE::PREBUILT_HW_PATH}/default/${TE::VPROJ_NAME}.bit)"
          return -code error "Project bit-file was not found (${TE::PREBUILT_HW_PATH}/${int_shortdir}/${TE::VPROJ_NAME}.bit or ${TE::PREBUILT_HW_PATH}/default/${TE::VPROJ_NAME}.bit)";
        } else {
          set bif_bitfile "${rel_bif_bitfile}/default/${TE::VPROJ_NAME}.bit"
        }
      } else {
        set bif_bitfile "${rel_bif_bitfile}/${int_shortdir}/${TE::VPROJ_NAME}.bit"
      }         
      #search for fsbl
      foreach sw_applist_line ${TE::SW_APPLIST} {
        #read fsbl name
        if {[lindex $sw_applist_line 2] eq "FSBL" || [lindex $sw_applist_line 2] eq "FSBL_EXT"} {
          set fsbl_name [lindex $sw_applist_line 1]
          if {![file exists ${TE::PREBUILT_SW_PATH}/${int_shortdir}/${fsbl_name}.elf]} { 
            # generate fsbl not found search default
            if {![file exists ${TE::PREBUILT_SW_PATH}/default/${fsbl_name}.elf]} {
            # default fsbl not found
              TE::UTILS::te_msg TE_SW-12 ERROR "FSBL ELF-file was not found (${TE::PREBUILT_SW_PATH}/${int_shortdir}/${fsbl_name}.elf or ${TE::PREBUILT_SW_PATH}/default/${fsbl_name}.elf)."
              return -code error "FSBL ELF-file was not found (${TE::PREBUILT_SW_PATH}/${int_shortdir}/${fsbl_name}.elf or ${TE::PREBUILT_SW_PATH}/default/${fsbl_name}.elf).";
            } else {
              set bif_fsbl "${rel_bif_fsbl}/default/${fsbl_name}.elf"
              TE::UTILS::te_msg TE_SW-13 INFO "Use FSBL from: ${bif_fsbl}"
            }
          } else {
              set bif_fsbl "${rel_bif_fsbl}/${int_shortdir}/${fsbl_name}.elf"
              TE::UTILS::te_msg TE_SW-14 INFO "Use FSBL from: ${bif_fsbl}"
          }
        }
      }
      foreach sw_applist_line ${TE::SW_APPLIST} {
        #generate *.bif only if app_list.csv->steps=0(generate all) or steps=1(*.bif and *.bin use *.elf from prebuild folders )
        if {[lindex $sw_applist_line 2] eq "0" || [lindex $sw_applist_line 2] eq "1" || [lindex $sw_applist_line 2] eq "FSBL_APP"} {
          #set correct folders
          switch [lindex $sw_applist_line 3] {
              "petalinux" {
                        set checkfile "${TE::PREBUILT_OS_PATH}/petalinux"
                        set rel_base "${rel_bif_appfile}os/petalinux"
                        
                          }
              default   {#standalone
                        set checkfile "${TE::PREBUILT_SW_PATH}"
                        set rel_base "${rel_bif_appfile}software"
                         } 
          }
          #read fsbl name
          #read app name and additional configs
          set app_name [lindex $sw_applist_line 1]
          TE::UTILS::te_msg TE_SW-15 STATUS "Generate BIF-file for: ${app_name}"
          #delete old folder
          if {[file exists ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}]} {
            file delete -force ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          }
          #make new one
          file mkdir ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          
          if {![file exists ${checkfile}/${int_shortdir}/${app_name}.elf]} { 
            if { [lindex $sw_applist_line 2] eq "FSBL_APP"} {
              # fsbl boot.bin only
              set bif_appfile ""
            } elseif {![file exists ${checkfile}/default/${app_name}.elf]} {
            # search default
            # default  not found
              TE::UTILS::te_msg TE_SW-16 ERROR "Application ELF-file was not found (${checkfile}/${int_shortdir}/${app_name}.elf or ${checkfile}/default/${app_name}.elf)."
              return -code error "Application ELF-file was not found (${checkfile}/${int_shortdir}/${app_name}.elf or ${checkfile}/default/${app_name}.elf).";
            } else {
              set bif_appfile "${rel_base}/default/${app_name}.elf"
            }
            
          } else {
            set bif_appfile "${rel_base}/${int_shortdir}/${app_name}.elf"
          }
          if {$TE::IS_ZSYS} {
            #Zynq
            set data01_file [lindex $sw_applist_line 5]
            set data01_load [lindex $sw_applist_line 6]
            set data01_offset [lindex $sw_applist_line 7]
            #replace na with ""
            if {[string match $data01_file "NA"]} { set bif_data01_file ""} else { set bif_data01_file "${rel_bif_data01_file}${data01_file}"}
            if {[string match $data01_load "NA"]} { set data01_load ""}
            if {[string match $data01_offset "NA"]} { set data01_offset ""}
            
            write_bif ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif  $bif_fsbl $bif_bitfile $bif_appfile $bif_data01_file $data01_load $data01_offset "" "" ""
          } elseif {$TE::IS_ZUSYS} {
            #uzynq
            set fsbl_config [lindex $sw_applist_line 5]
            if {[string match $fsbl_config "NA"]} { set fsbl_config ""}
            set destination_cpu [lindex $sw_applist_line 6]
            if {[string match $destination_cpu "NA"]} { set destination_cpu ""}
            set exception_level [lindex $sw_applist_line 7]
            if {[string match $exception_level "NA"]} { set exception_level ""}
            set atf  [lindex $sw_applist_line 8]
            if {[string match $atf "NA"]} { set atf ""} elseif {[file exists ${checkfile}/${int_shortdir}/${atf}]} { 
              set atf ${rel_base}/${int_shortdir}/${atf}
            } elseif {[file exists ${checkfile}/default/${atf}]} {
              set atf ${rel_base}/default/${atf}
            } else {
              TE::UTILS::te_msg TE_SW-17 WARNING "ATF File was not found in ${checkfile}/${int_shortdir}/${atf} or ${checkfile}/default/${atf}"
             set atf ""
            }
            set pmu  [lindex $sw_applist_line 9]
            if {[string match $pmu "NA"]} { 
              set pmu ""
              TE::UTILS::te_msg TE_SW-65 WARNING "PMU File not selected on apps_list.csv"
            } elseif {[file exists ${TE::PREBUILT_SW_PATH}/${int_shortdir}/${pmu}]} { 
              set pmu ${rel_bif_hsipmu}/${int_shortdir}/${pmu}
            } elseif {[file exists ${TE::PREBUILT_SW_PATH}/default/${pmu}]} { 
              set pmu ${rel_bif_hsipmu}/default/${pmu}
            } elseif {[file exists ${checkfile}/${int_shortdir}/${pmu}]} { 
              set pmu ${rel_base}/${int_shortdir}/${pmu}
            } elseif {[file exists ${checkfile}/default/${pmu}]} {
              set pmu ${rel_base}/default/${pmu}
            } else {
              TE::UTILS::te_msg TE_SW-64 WARNING "PMU File ($pmu) was not found in all possible prebuilt folders"
             set pmu ""
            }
              TE::UTILS::te_msg TE_SW-66 INFO "Use PMU from: ${pmu}"
            
            write_zusys_bif -biffile ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif -fsbl_config $fsbl_config -bootloader $bif_fsbl -pmu $pmu -bitfile $bif_bitfile -app $bif_appfile -destination_cpu $destination_cpu -exception_level $exception_level -atf $atf

          } else {
            #error
            TE::UTILS::te_msg TE_SW-18 ERROR "ZSYS or ZUSYS is not defined."
          }
        }
      }
    }
    #--------------------------------
    #--write_bif:  
    proc write_bif { biffile {fsblfile "zynq_fsbl.elf"} {bitfile ""} {elffile ""} {data01_file ""} {data01_load ""} {data01_offset ""} {dtbfile ""} {intfile ""} {ssblfile ""} } {

      set bif_fp [open "$biffile" w]

      puts $bif_fp "the_ROM_image:\n\u007B"
      #
      # init data
      #
      if {$intfile!=""} { puts -nonewline $bif_fp {    [init]}}
      if {$intfile!=""} { puts $bif_fp $intfile}
      if {$intfile == ""} {TE::UTILS::te_msg TE_SW-19 STATUS "INT FILE NOT DEFINED..."}
      #
      # FSBL
      #
      if {$fsblfile!=""} { puts -nonewline $bif_fp {    [bootloader]}}
      if {$fsblfile!=""} { puts $bif_fp $fsblfile}
      if {$fsblfile == ""} {TE::UTILS::te_msg TE_SW-21 STATUS "FSBL FILE NOT DEFINED..."}
      #
      # BIT file
      #
      if {$bitfile!=""} { puts $bif_fp "    $bitfile"}
      if {$bitfile == ""} {TE::UTILS::te_msg TE_SW-22 STATUS "BIT FILE NOT DEFINED..."}
      #
      # .ELF file
      #
      if {$elffile!=""} { puts $bif_fp "    $elffile"}
      if {$elffile == ""} {TE::UTILS::te_msg TE_SW-23 STATUS "ELF FILE NOT DEFINED..."}
      #
      # SSBL
      #
      if {$ssblfile!=""} { puts $bif_fp "    $ssblfile"}
      if {$ssblfile == ""} {TE::UTILS::te_msg TE_SW-24 STATUS "SSBL FILE NOT DEFINED..."}
      #
      # DTB file
      #
      if {$dtbfile!=""} { puts $bif_fp "    $dtbfile"}
      if {$dtbfile == ""} {TE::UTILS::te_msg TE_SW-25 STATUS "DTB FILE NOT DEFINED..."}
      #
      # image.ub ore IMAGE file
      #

      if {$data01_load!="" || $data01_offset!=""} { puts -nonewline $bif_fp {    [}}
      if {$data01_load!="" } { puts -nonewline $bif_fp {load = };puts -nonewline $bif_fp "$data01_load"}
      if {$data01_load!="" && $data01_offset!=""} { puts -nonewline $bif_fp { , }}
      if {$data01_offset!="" } { puts -nonewline $bif_fp {offset = };puts -nonewline $bif_fp "$data01_offset"}
      if {$data01_load!="" || $data01_offset!=""} { puts -nonewline $bif_fp {]}}
      if {$data01_file!=""} { puts $bif_fp $data01_file}
      
      if {$data01_load == ""} {TE::UTILS::te_msg TE_SW-26 STATUS "FILE01 LOAD NOT DEFINED..."}
      if {$data01_offset == ""} {TE::UTILS::te_msg TE_SW-27 STATUS "FILE01 OFFSET NOT DEFINED..."}
      if {$data01_file == ""} {TE::UTILS::te_msg TE_SW-28 STATUS "FILE01 FILE NOT DEFINED..."}


      puts $bif_fp "\u007D"

      close $bif_fp

    }
    #--------------------------------
    #--write_zusys_bif:  
    proc write_zusys_bif {{args ""}} {
      set biffile ""
      set fsbl_config ""
      set bootloader ""
      set pmu ""
      set bitfile ""
      set destination_cpu ""
      set exception_level ""
      #bl31.elf
      set atf ""
      set app ""
      
      set args_cnt [llength $args]
      for {set option 0} {$option < $args_cnt} {incr option} {
        switch [lindex $args $option] { 
          "-biffile"                { incr option; set biffile [lindex $args $option]}
          "-fsbl_config"            { incr option; set fsbl_config [lindex $args $option]}
          "-bootloader"             { incr option; set bootloader [lindex $args $option]}
          "-pmu"                    { incr option; set pmu [lindex $args $option]}
          "-bitfile"     { incr option; set bitfile [lindex $args $option]}
          "-destination_cpu"        { incr option; set destination_cpu [lindex $args $option]}
          "-exception_level"        { incr option; set exception_level [lindex $args $option]}
          "-atf"                    { incr option; set atf [lindex $args $option]}
          "-app"                    { incr option; set app [lindex $args $option]}
          default                   {TE::UTILS::te_msg TE_SW-29 ERROR "unrecognised option for BIF generation: [lindex $args $option]";return -code error }
        }
      }
      set bif_fp [open "$biffile" w]

      puts $bif_fp "//arch = zynqmp; split = false; format = BIN"
      puts $bif_fp "the_ROM_image:\n\u007B"
      #fsbl_config
      if {$fsbl_config!=""} { puts -nonewline $bif_fp {  [fsbl_config]}}
      if {$fsbl_config!=""} { puts $bif_fp $fsbl_config}
      if {$fsbl_config == ""} {TE::UTILS::te_msg TE_SW-30 STATUS "FSBL_CONFIG NOT DEFINED..."}
      #bootloader
      if {$bootloader!=""} { puts -nonewline $bif_fp {  [bootloader]}}
      if {$bootloader!=""} { puts $bif_fp $bootloader}
      if {$bootloader == ""} {TE::UTILS::te_msg TE_SW-31 STATUS "BOOTLOADER NOT DEFINED..."}
      #pmuf
      if {$pmu!=""} { puts -nonewline $bif_fp {  [pmufw_image]}}
      if {$pmu!=""} { puts $bif_fp $pmu}
      if {$pmu == ""} {TE::UTILS::te_msg TE_SW-31 STATUS "PMU NOT DEFINED..."}
      #bitfile
      if {$bitfile!=""} { puts -nonewline $bif_fp {  [destination_device = pl]}}
      if {$bitfile!=""} { puts $bif_fp $bitfile}
      if {$bitfile == ""} {TE::UTILS::te_msg TE_SW-32 STATUS "BITFILE NOT DEFINED..."}
      #atf
      if {$atf!=""} { puts -nonewline $bif_fp {  [}}
      if {$atf!=""} { puts -nonewline $bif_fp "destination_cpu =$destination_cpu"}
      if {$atf!=""} { puts -nonewline $bif_fp ", exception_level =el-3"}
      if {$atf!=""} { puts -nonewline $bif_fp {]}}
      if {$atf!=""} { puts $bif_fp $atf}
      if {$atf == ""} {TE::UTILS::te_msg TE_SW-33 STATUS "ATF BL31 ELF NOT DEFINED..."}
      #elf
      if {$app!=""} { puts -nonewline $bif_fp {  [}}
      if {$app!=""} { puts -nonewline $bif_fp "destination_cpu =$destination_cpu"}
      if {$app!="" && $exception_level!=""} { puts -nonewline $bif_fp ", exception_level =$exception_level"}
      if {$app!=""} { puts -nonewline $bif_fp {]}}
      if {$app!=""} { puts $bif_fp $app}
      if {$app == ""} {TE::UTILS::te_msg TE_SW-34 STATUS "APPLICATION ELF NOT DEFINED..."}

      puts $bif_fp "\u007D"

      close $bif_fp

    }
    #--------------------------------
    #--generate_bootbin:  
    proc generate_bootbin {{fname ""}} {
      set int_shortdir ${TE::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[TE::BDEF::find_shortdir $fname]"
      }
      foreach sw_applist_line ${TE::SW_APPLIST} {
        #generate *.bin only if app_list.csv->steps=0(generate all) or steps=1(*.bif and *.bin use *.elf from prebuild folders ) or steps=2(*.bin use *.elf and *.bif from prebuild folders)
        if {[lindex $sw_applist_line 2]==0 || [lindex $sw_applist_line 2]==1 || [lindex $sw_applist_line 2]==2 || [lindex $sw_applist_line 2] eq "FSBL_APP"} {
          #read app name
          set app_name [lindex $sw_applist_line 1]
          #delete old one
          if {[file exists ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bin]} {
            file delete -force ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bin
          }
          #
          if {![file exists  ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif]} { 
            TE::UTILS::te_msg TE_SW-35 ERROR "Application BIF-File found (${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif)."
            return -code error "Application BIF-File found (${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/boot.bif).";
          }
          #todo:hier noch in default suche?
          TE::UTILS::te_msg TE_SW-36 STATUS "Generate Boot.bin for Application: ${app_name}"
          set cur_path [pwd]
          cd ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          set command exec
          lappend command bootgen
          lappend command -image boot.bif
          #Ultrascale+Zynq
          if {$TE::IS_ZUSYS} {
            lappend command -arch zynqmp
          }
          lappend command -w -o BOOT.bin
          # puts $command
          TE::UTILS::te_msg TE_SW-37 INFO "Start BootGen: \n \
            Run \"$command\" in ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name} \n \
            Please Wait.. \n \
          ------"
          set result [eval $command]
          TE::UTILS::te_msg TE_EXT-3 INFO "Command results from BootGen \"$command\": \n \
            $result \n \
          ------"    
          cd $cur_path          
        }
      }
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished  *bin/*bif generation functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # programming functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--get_available_apps: 
    proc get_available_apps {{fname ""}} {
      set int_shortdir ${TE::SHORTDIR}
      if {$fname ne ""} {
        set int_shortdir "[TE::BDEF::find_shortdir $fname]"
      }
      set applist []
      [catch {set applist [glob -join -dir ${TE::PREBUILT_BI_PATH}/${int_shortdir}/ *]}]
      set app_txt "Following Applications are available: \n"
      foreach app $applist {
        set tmp [split $app "/"]
        set app_txt "$app_txt [lindex $tmp [expr [llength $tmp]-1]]\n"
      }
      TE::UTILS::te_msg TE_PR-38 INFO "$app_txt ------"
    }
    #--------------------------------
    #--excecute_zynq_flash_programming: 
    proc excecute_zynq_flash_programming {use_basefolder app_name {fname ""}} {
      set return_filename ""
      set int_shortdir ${TE::SHORTDIR}
      set int_flashtyp $TE::ZYNQFLASHTYP
      set run_path ""
      set bootbinname BOOT.bin
      if {$fname ne ""} {
        set int_shortdir "[TE::BDEF::find_shortdir $fname]"
        #get flashtyp form shortdir
        set int_flashtyp "[TE::BDEF::get_zynqflashtyp $int_shortdir 4]"
      }
      if {![string match $int_flashtyp "NA"]} {
        set cur_path [pwd]
        if {$use_basefolder} {
          set binfilename ""
          if { ![catch {set binfilename [glob -join -dir ${TE::BASEFOLDER}/ *.bin]}] } {
            TE::UTILS::te_msg TE_PR-39 STATUS "Used file:${binfilename}"
            set return_filename ${binfilename}
            set run_path $TE::BASEFOLDER
            set nameonly [file tail [file rootname $binfilename]]
            set bootbinname ${nameonly}.bin
          } else {
            TE::UTILS::te_msg TE_PR-40 ERROR "Bin-File was not found in ${TE::BASEFOLDER}."
            return -code error "Bin-File was not found in ${TE::BASEFOLDER}.";
          }
          cd ${TE::BASEFOLDER}
        } else {
          if {![file exists  ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/BOOT.bin]} { 
            TE::UTILS::te_msg TE_PR-41 ERROR "Application Bin-File was not found (${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/BOOT.bin)."
            return -code error "Application Bin-File was not found (${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/BOOT.bin).";
          }
          cd ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          set run_path ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}
          set bootbinname BOOT.bin
          TE::UTILS::te_msg TE_PR-40 STATUS "Used file:${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/Boot.bin"
          set return_filename ${TE::PREBUILT_BI_PATH}/${int_shortdir}/${app_name}/Boot.bin
        }
        set command exec
        
        # lappend command zynq_flash
        lappend command program_flash
        lappend command -f $bootbinname
        lappend command -flash_type $int_flashtyp
        TE::UTILS::te_msg TE_PR-41 INFO "Start program flash: \n \
          Run \"$command\" in ${run_path} \n \
          Please Wait.. \n \
        ------"
        set result [eval $command]
        TE::UTILS::te_msg TE_EXT-4 INFO "Command results from program flash \"$command\": \n \
          $result \n \
        ------"  
        cd $cur_path 
      } else {
        TE::UTILS::te_msg TE_PR-42 ERROR "Programming failed: Zynq Flash Typ is not specified for this board part. See ${TE::BOARDDEF_PATH}/..._board_files.csv"
      }
      return $return_filename
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished programming functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # utilities functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--svn_checkin: 
    proc svn_checkin {foldername {mgs ""}} {
      set message $mgs
      if {![file exists $foldername]} { 
        set message "Error: Folder not found ( $foldername)"
      } else {
      set cur_path [pwd]
      cd ${foldername}
      set command exec
      lappend command svn
      lappend command ci
      lappend command -m $message
      TE::UTILS::te_msg TE_UTIL-72 INFO "Start SVN Checkin: \n \
        Run \"$command\" in ${foldername} \n \
        Please Wait.. \n \
      ------"
      set result [eval $command]
      TE::UTILS::te_msg TE_EXT-5 INFO "Command results from SVN check in \"$command\": \n \
        $result \n \
      ------"  
      cd $cur_path 
      }
    }    
    #--------------------------------
    #--unzip_project: 
    proc unzip_project {zipname file_location} {
      set command exec
      if {${TE::ZIP_PATH} ne ""} {
        if {[file tail [file rootname ${TE::ZIP_PATH}]] eq "7z"} {
          lappend command ${TE::ZIP_PATH}
          lappend command x  ${file_location}/${zipname}
          lappend command -o${file_location}
        } else {
          lappend command ${TE::ZIP_PATH}
          lappend command -help
          # lappend command -e ${file_location}/${zipname}
          # lappend command ${file_location}
        }
        TE::UTILS::te_msg TE_UTIL-73 INFO "Start UNZIP: \n \
          Run \"$command\" \n \
          Please Wait.. \n \
        ------"
        set result [eval $command]
        TE::UTILS::te_msg TE_EXT-6 INFO "Command results from UNZIP \"$command\": \n \
          $result \n \
        ------"  
        } else {
          TE::UTILS::te_msg TE_UTIL-74 {CRITICAL WARNING} "Zip not specified. Set zip path and *exe of the zip program in \"design_basic_settings.cmd\" file : example 7zip: @set ZIP_PATH=C:/Program Files (x86)/7-Zip/7z.exe"
        }
    }
    #--------------------------------
    #--zip_project: 
    proc zip_project {zipname {excludelist ""}} {
      #todo mit übergabeparameter prebuilt weglassen oder so
      #remove old backup project copy
      set sourcepath [string trim $TE::VPROJ_PATH "vivado"]
      set destinationpath ${TE::BACKUP_PATH}/${TE::VPROJ_NAME}
      if {[file exists ${destinationpath}]} { 
        file delete -force ${destinationpath}  
      }
      #create new destination folder
      file mkdir ${destinationpath}
      set cur_path [pwd]
      cd ${TE::BACKUP_PATH}
      #get all files
      set filelist [ glob ${sourcepath}*]
      #remove backup folder
      set findex [lsearch $filelist *backup]
      set filelist [lreplace $filelist[set filelist {}] $findex $findex]
      
      foreach el $filelist {
      file copy -force ${el} ${destinationpath}
      }
      set excludelist
      foreach el $excludelist {
        set find ""
        if {[catch {set find [glob -join -dir $destinationpath $el]}]} {
          TE::UTILS::te_msg TE_UTIL-75 INFO "$el not found."
        } else {
          TE::UTILS::te_msg TE_UTIL-76 INFO "Excluded from backup:$find"
          file delete -force $find
        }
      }
      set command exec
      if {${TE::ZIP_PATH} ne ""} {
        if {[file tail [file rootname ${TE::ZIP_PATH}]] eq "7z"} {
          lappend command ${TE::ZIP_PATH}
          lappend command a -tzip "$zipname.zip"
          lappend command "./${TE::VPROJ_NAME}/"
          lappend command -r 
        } else {
          lappend command ${TE::ZIP_PATH}
          lappend command -r
          lappend command "$zipname.zip"
          lappend command "./${TE::VPROJ_NAME}/*.*"
        }
        TE::UTILS::te_msg TE_UTIL-77 INFO "Start ZIP: \n \
          Run \"$command\" \n \
          Please Wait.. \n \
        ------"
        set result [eval $command]
        TE::UTILS::te_msg TE_EXT-7 INFO "Command results from ZIP \"$command\": \n \
          $result \n \
        ------"  
        } else {
         TE::UTILS::te_msg TE_UTIL-78 {CRITICAL WARNING} "Zip not specified. Set zip path and *exe of the zip program in \"design_basic_settings.cmd\" file : example 7zip: @set ZIP_PATH=C:/Program Files (x86)/7-Zip/7z.exe"
        }
      #remove project copy
      if {[file exists ${destinationpath}]} { 
        file delete -force ${destinationpath}  
      }
      cd $cur_path
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished utilities functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # SDSoC functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--run_sdsoc: 
    proc run_sdsoc {} {
      set cur_path [pwd]
      cd ${TE::SDSOC_PATH}
      set command exec
      lappend command sdsoc 
      lappend command -workspace ${TE::SDSOC_PATH}
      # lappend command -lp ${TE::SDSOC_PATH}/${TE::VPROJ_NAME}/
      TE::UTILS::te_msg TE_SW-38 INFO "Start SDSoC: \n \
        Run \"$command\" in ${TE::SDSOC_PATH} \n \
        Please Wait.. \n \
      ------"
      set result [eval $command]
        TE::UTILS::te_msg TE_EXT-8 INFO "Command results from SDSoC \"$command\": \n \
          $result \n \
        ------" 
      cd $cur_path 
    }   
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished sdsoc functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  # -----------------------------------------------------------------------------------------------------------------------------------------
  }
  puts "INFO:(TE) Load Vivado script finished"
}


