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
# -- $Date: 2017/05/18  | $Author: Hartfiel, John
# -- - miscellaneous
# ------------------------------------------
# -- $Date:  2017/09/07  | $Author: Hartfiel, John
# -- - add new document history style
# -- - changed modify bd priority
# -- - bugfix to remove all properties
# -- - rise te_msg cnt
# ------------------------------------------
# -- $Date: 2017/10/04  | $Author:Pohl, Zdenek
# -- - incremented te_msg counter for TE_SDSOC to reflect
# --   changes in script_sdsoc.tcl
# ------------------------------------------
# -- $Date: 0000/00/00  | $Author:
# -- - 
# --------------------------------------------------------------------
# --------------------------------------------------------------------
namespace eval TE {
  namespace eval UTILS {
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # report functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--------------------------------
    #--te_msg: 
    proc te_msg {vmsg_id  vmsg_sev vmsg_msg} {
      # vmsg_id: TE_INIT, TE_UT, TE_EXT, TE_BD, TE_HW, TE_SW, TE_PR 
      #last vmsg_nr:
        #TE_INIT 170        -> TE initialisation
        #TE_UTIL 99         -> TE utilities
        #TE_EXT 8           -> External
        #TE_PS 1            -> PS modification 0,1-> external tcl-scripts with settings!
        #TE_BD 26           -> Block Design
        #TE_HW 81           -> HW Design
        #TE_SW 66           -> SW Design
        #TE_PR 84           -> Programming
        #TE_SDSoC 28        -> SDSoC
      # vmsg_sev: STATUS, INFO, WARNING, {CRITICAL WARNING}, ERROR 
      # set vmsg_id TE_DEF;set vmsg_sev STATUS;set vmsg_msg "Info";
      # common::send_msg_id "$vmsg_id" $vmsg_sev $vmsg_msg
      if {[catch {common::send_msg_id "$vmsg_id" $vmsg_sev $vmsg_msg}] } {puts "${vmsg_sev}: ($vmsg_id) $vmsg_msg"}
      #Info: Do not start Text with: --
      #TE::UTILS::te_msg TE_INIT-2 WARNING "SDK settings are overwritten by SDSOC settings."
      #TE::UTILS::te_msg TE_INIT-0 INFO "Script Info: \n \
      #  ------"
      
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished report functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # search source files functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--search_bd_files: search in TE::BD_PATH for *.tcl files return list
    proc search_bd_files {} {
      # search for block design for the board part only  (folder with tcl must exist, otherwise base BD_Path is used!)
      #currently only on bd.tcl is allowed
      set bd_files []
      if { [catch {set bd_files [glob -join -dir ${TE::BD_PATH}/${TE::SHORTDIR} *.tcl]}] } {
        if { [catch {set bd_files [glob -join -dir ${TE::BD_PATH}/ *.tcl]}] } {
          if { [catch {set bd_files [glob -join -dir ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.srcs/${TE::SOURCE_NAME}/bd/ * *.bd]}] } {
            TE::UTILS::te_msg TE_UTIL-0 WARNING "No Block-Design Export was found in ${TE::BD_PATH}, start vivado without bd-design"
          } else {
            TE::UTILS::te_msg TE_UTIL-1 WARNING "No Block-Design Export was found, use current Vivado project Block-Designs from:${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.srcs/${TE::SOURCE_NAME}/bd/ ."
          }
        } 
      }
      set bd_names ""
      foreach bd $bd_files {
        set bd_names "$bd_names $bd \n"
      }
      TE::UTILS::te_msg TE_UTIL-2 INFO "Following block designs were found: \n \
        $bd_names \
        ------"
      if {!$TE::BD_MULTI} {
        if {[llength $bd_files]>1 } {
            TE::UTILS::te_msg TE_UTIL-3 WARNING "Currently only one Block-Design is supported with TE-scripts, deleted or rename file-extension from unused *.tcl in ${TE::BD_PATH} or ${TE::BD_PATH}/${TE::SHORTDIR}."
            return -code error "Currently only one Block-Design is supported with TE-scripts, deleted or rename file-extension from unused *.tcl in ${TE::BD_PATH} or ${TE::BD_PATH}/${TE::SHORTDIR}."
        }
      }
      return $bd_files
    }
    #--------------------------------
    #--search_xdc_files: search in TE::XDC_PATH for *xdc files return list
    proc search_xdc_files {} {
      # search for xdc file if bord part folder exist, this used too
      set xdc_files []
      set base_xdc_files []
      set bp_xdc_files []
      if { [catch {set base_xdc_files [ glob $TE::XDC_PATH/*.xdc ] }] } {
        TE::UTILS::te_msg TE_UTIL-4 WARNING "*.xdc search: ${TE::XDC_PATH}/ is empty."
      }
      if {[file exists ${TE::XDC_PATH}/${TE::SHORTDIR}/]} {
        if { [catch {set bp_xdc_files [ glob $TE::XDC_PATH/${TE::SHORTDIR}/*.xdc ] }] } {
          TE::UTILS::te_msg TE_UTIL-5 WARNING "*.xdc search: ${TE::XDC_PATH}/${TE::SHORTDIR}/ is empty."
        }
        #generate empty target xdc for gui constrains
        if { ![file exists ${TE::XDC_PATH}/${TE::SHORTDIR}/vivado_target.xdc]} {
          TE::UTILS::te_msg TE_UTIL-6 INFO "Generate ${TE::XDC_PATH}/${TE::SHORTDIR}/vivado_target.xdc"
          close [ open ${TE::XDC_PATH}/${TE::SHORTDIR}/vivado_target.xdc w ]
          lappend bp_xdc_files ${TE::XDC_PATH}/${TE::SHORTDIR}/vivado_target.xdc
        }
        set xdc_files [concat $base_xdc_files $bp_xdc_files]
      } else {
        set xdc_files $base_xdc_files
        #generate empty target xdc for gui constrains
        if { ![file exists ${TE::XDC_PATH}/vivado_target.xdc]} {
          TE::UTILS::te_msg TE_UTIL-7 INFO "Generate ${TE::XDC_PATH}/vivado_target.xdc"
          close [ open ${TE::XDC_PATH}/vivado_target.xdc w ]
          lappend xdc_files ${TE::XDC_PATH}/vivado_target.xdc
        }
      }

      set xdc_names ""
      foreach xdc $xdc_files {
        set xdc_names "$xdc_names $xdc \n"
      }
      TE::UTILS::te_msg TE_UTIL-8 INFO "Following xdc files were found: \n \
        $xdc_names \
        ------"

      return $xdc_files
    }
    #--------------------------------
    #--search_xci_files: search in TE::HDL_PATH for *.xci files return list
    proc search_xci_files {} {
      set xci_files [list]
      set xci_files_main [list]
      set xci_files_sub [list]
      catch {set xci_files_main [glob -join -dir $TE::HDL_PATH/xci/ *.xci]}
      catch {set xci_files_sub [glob -join -dir $TE::HDL_PATH/xci/${TE::SHORTDIR}/ *.xci]}
      set xci_files [concat $xci_files_main $xci_files_sub]
      set xci_names ""
      foreach xci_f $xci_files {
        set xci_names "$xci_names $xci_f \n"
      }
      TE::UTILS::te_msg TE_UTIL-9 INFO "Following xci files were found: \n \
        $xci_names \
        ------"
        
      return $xci_files
    }
    #--------------------------------
    #--search_elf_files: search in TE::FIRMWARE_PATH for *.elf files return list
    proc search_elf_files {} {
      set elf_files_sub [list]
      catch {set elf_files_sub [glob -join -dir ${TE::FIRMWARE_PATH} */*.elf]}
      
      set elf_names ""
      foreach elf_f $elf_files_sub {
        set elf_names "$elf_names $elf_f \n"
      }
      TE::UTILS::te_msg TE_UTIL-10 INFO "Following elf files were found: \n \
        $elf_names \
        ------"
        
      return $elf_files_sub
    }
    #--------------------------------
    #--search_hdl_files: search in TE::HDL_PATH for *.vhd and *.v files return list
    proc search_hdl_files {} {
      set hdl_files [list]
      set vhd_files [list]
      set vhd_files_sub1 [list]
      set vhd_files_sub2 [list]
      set v_files [list]
      set v_files_sub1 [list]
      set v_files_sub2 [list]
      set sv_files [list]
      set sv_files_sub1 [list]
      set sv_files_sub2 [list]
      catch {set vhd_files [glob -join -dir ${TE::HDL_PATH} *.vhd]}
      catch {set vhd_files_sub1 [glob -join -dir ${TE::HDL_PATH}/${TE::SHORTDIR}/ *.vhd]}
      catch {set vhd_files_sub2 [glob -join -dir ${TE::HDL_PATH}/${TE::SHORTDIR}/ */*.vhd]}
      catch {set v_files [glob -join -dir ${TE::HDL_PATH} *.v]}
      catch {set v_files_sub1 [glob -join -dir ${TE::HDL_PATH}/${TE::SHORTDIR}/ */*.v]}
      catch {set v_files_sub2 [glob -join -dir ${TE::HDL_PATH}/${TE::SHORTDIR}/ */*.v]}
      catch {set sv_files [glob -join -dir ${TE::HDL_PATH} *.sv]}
      catch {set sv_files_sub1 [glob -join -dir ${TE::HDL_PATH}/${TE::SHORTDIR}/ */*.sv]}
      catch {set sv_files_sub2 [glob -join -dir ${TE::HDL_PATH}/${TE::SHORTDIR}/ */*.sv]}
      set hdl_files [concat $vhd_files $vhd_files_sub1 $vhd_files_sub2 $v_files $v_files_sub1 $v_files_sub2 $sv_files $sv_files_sub1 $sv_files_sub2]

      set hdl_names ""
      foreach hdl_f $hdl_files {
        set hdl_names "$hdl_names $hdl_f \n"
      }
      TE::UTILS::te_msg TE_UTIL-11 INFO "Following hdl files were found: \n \
        $hdl_names \
        ------"
      
      return $hdl_files
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished search source files functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # modify block design functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--modify_block_design_tcl:
    proc setinfo_to_block_design_tcl {datalist mod_file} {
      TE::UTILS::te_msg TE_UTIL-22 INFO "Block Design tcl: info lines were added."
      set data $datalist
      if {$mod_file} {
        # set data [linsert $data[set data {}] 0 "puts \"Info:(TE) This block design file has been modified. Modifications labelled with comment tag  # #TE_MOD# on the Block-Design tcl-file.\""]
        set data [linsert $data[set data {}] 0 "TE::UTILS::te_msg TE_BD-1 INFO \"This block design tcl-file was modified by TE-Scripts. Modifications are labelled with comment tag  # #TE_MOD# on the Block-Design tcl-file.\""]
      }
      # set data [linsert $data[set data {}] 0 "puts \"Info:(TE) This block design file has been exported with Reference-Design Scripts from Trenz Electronic GmbH for Board Part:${TE::BOARDPART} with FPGA ${TE::PARTNAME} at [ clock format [clock seconds] -format "%Y-%m-%dT%H:%M:%S"].\""]
      set data [linsert $data[set data {}] 0 "TE::UTILS::te_msg TE_BD-0 INFO \"This block design tcl-file was generate with Trenz Electronic GmbH Board Part:${TE::BOARDPART}, FPGA: ${TE::PARTNAME} at [ clock format [clock seconds] -format "%Y-%m-%dT%H:%M:%S"].\""]
      return $data
    }
    #--------------------------------
    #--modify_block_design_tcl: load and save block design tcl (sub functions used for modifications) 
    proc modify_block_design_tcl {file_name mod_file} {
      TE::UTILS::te_msg TE_UTIL-12 STATUS "Open bd design export [file tail [file rootname $file_name]]"
      #read file to string list
      set fp_r [open ${file_name} "r"]
      set file_data [read $fp_r]
      close $fp_r
      
      set data [split $file_data "\n"]
      
      #modify list elements ()
      if {$mod_file} {
        if {[catch {set data [modify_block_design_commentlines $data]} result]} { TE::UTILS::te_msg TE_UTIL-13 ERROR "Script (TE::UTILS::modify_block_design_commentlines) failed: $result."; return -code error}
        if {[catch {set data [modify_block_design_add_lines $data]} result]} { TE::UTILS::te_msg TE_UTIL-15 ERROR "Script (TE::UTILS::modify_block_design_add_lines) failed: $result."; return -code error}
        if {[catch {set data [modify_block_design_commentdesignprops $data]} result]} { TE::UTILS::te_msg TE_UTIL-14 ERROR "Script (TE::UTILS::modify_block_design_commentdesignprops) failed: $result."; return -code error}
        if {[catch {set data [modify_block_design_add_designprops $data]} result]} { TE::UTILS::te_msg TE_UTIL-16 ERROR "Script (TE::UTILS::modify_block_design_add_designprops) failed: $result."; return -code error}
      }
      # write info header
       if {[catch {set data [TE::UTILS::setinfo_to_block_design_tcl $data $mod_file]} result]} { TE::UTILS::te_msg TE_UTIL-17 ERROR "Script (TE::UTILS::setinfo_to_block_design_tcl) failed: $result."; return -code error}
      #write all list elements to file
      set fp_w [open ${file_name} "w"]
      foreach line $data {
        puts $fp_w $line
      }
      close $fp_w
    } 
    #--------------------------------
    #--modify_block_design_commentlines: 
    proc modify_block_design_commentlines {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set line_index -1
      set mod_count 0
      foreach line $data {
        incr line_index
        foreach cname $TE::BD_MOD_COMMENT {
          set line_check [lindex $cname 1]
          #comment lines on tcl file, modified lines are ignored
          if {[string match $line_check $line]  && ![string match *#TE_MOD#* $line]} {
            set data [lreplace $data[set data {}] $line_index $line_index "# #TE_MOD# $line"]
            incr mod_count
          }
        }
      }
      TE::UTILS::te_msg TE_UTIL-18 INFO "Block Design tcl: $mod_count lines were commented out."
      return $data
    }
    #--------------------------------
    #--modify_block_design_commentdesignprops: 
    proc modify_block_design_commentdesignprops {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set mod_count 0
      foreach cname $TE::BD_MOD_PCOMMENT {
        set prop_start_name "set_property -dict"
        #get instant name
        set inst_name [lindex $cname 1]
        set prop_stop_name  "\] \$$inst_name"
        #modify list elements
        set line_index -1
        set prop_start -1
        set prop_stop -1
        #search for property boundaries
        foreach line $data {
          incr line_index
          if {[string match *$prop_start_name* $line] && ![string match *#TE_MOD#* $line]} {
            set prop_start $line_index
          }
          if {[string match *$prop_stop_name $line] && ![string match *#TE_MOD#* $line]} {
            set prop_stop $line_index
            break;
          }
        }
        #only if component found
        if {$prop_start>=0 && $prop_stop>$prop_start} {
          
          set removed_items [list]
          set item_cnt -1
          #removed items
          foreach item $cname {
            incr item_cnt
            #ignore id and line_check
            if {$item_cnt>1} {
              set i $prop_stop
              while {$i > $prop_start+1} {
                set i [expr $i-1]
                set newline "[lindex $data $i]"
                if {[string match *$item* $newline] && ![string match *#TE_MOD#* $newline]} {
                  lappend removed_items "# #TE_MOD# $newline"
                  set data [lreplace $data[set data {}] $i $i]
                  incr mod_count
                }
              }
            }
          }
          # if all properties are removed, clear empty property container
          if {[expr $prop_stop-($prop_start+1)]==[llength $removed_items]} {
            set tmp "# #TE_MOD# [lindex $data $prop_start]"
            set data [lreplace $data[set data {}] $prop_start $prop_start $tmp]
            set tmp "# #TE_MOD# [lindex $data [expr $prop_start+1]]"
            set data [lreplace $data[set data {}] [expr $prop_start+1] [expr $prop_start+1] $tmp]
          }
          #add removed items as comment after the component list
          set inserpos [expr $prop_stop + 2 - [llength $removed_items]]
          set data [linsert $data[set data {}] $inserpos "# #TE_MOD# #Empty Line"]  
          foreach el [lreverse $removed_items] { 
            set data [linsert $data[set data {}] $inserpos $el]  
          }
        }
      }
      TE::UTILS::te_msg TE_UTIL-19 INFO "Block Design tcl: $mod_count properties were commented out."
      return $data
    }
    #--------------------------------
    #--modify_block_design_add_lines: 
    proc modify_block_design_add_lines {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set line_index -1
      set mod_count 0
      foreach cname $TE::BD_MOD_ADD {
        set line_check [lindex $cname 1]
        set line_index -1
        foreach line $data {
          incr line_index
          #add lines on tcl file, modified lines are ignored
          if {[string match $line_check $line]  && ![string match *#TE_MOD#* $line]} {
            # set data [lreplace $data[set data {}] $line_index $line_index "# #TE_MOD# $line"]
            set data [linsert $data[set data {}] [expr $line_index+1]  "# #TE_MOD#_Add next line#"]
            set data [linsert $data[set data {}] [expr $line_index+2]  [lindex $cname 2]]
            incr mod_count
            break
          }
        }
      }
      TE::UTILS::te_msg TE_UTIL-20 INFO "Block Design tcl: $mod_count lines were added."
      return $data
    }
    #--------------------------------
    #--modify_block_design_add_designprops: 
    proc modify_block_design_add_designprops {datalist} {
      #data=tcl content
      set data $datalist
      #modify list elements
      set mod_count 0
      foreach cname $TE::BD_MOD_PADD {
        #get instant name
        set inst_name [lindex $cname 1]
        set prop_stop_name  "\] \$$inst_name"
        #modify list elements
        set line_index -1
        set prop_start -1
        set prop_stop -1
        set all_props_removed -1
        #search for property boundaries
        foreach line $data {
          incr line_index
          if {[string match *$prop_stop_name $line]} {
            if {![string match *#TE_MOD#* $line] } {
              set prop_stop $line_index
            } else {
              set all_props_removed $line_index
            }
            break;
          }
        }
        #if component props found
        if {$prop_stop>-1} {
          #add removed items as comment after the component list
          set inserpos [expr $prop_stop + 1]
          set el_index -1
          #add property as comment
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "# #TE_MOD#_add_property# $el"]  
            }
          }
          #add property
          set inserpos [expr $prop_stop + -1]
          set el_index -1
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "$el \\"]  
              incr mod_count
            }
          }
        } elseif {$all_props_removed>-1} {
          #add removed items as comment after the component list
          set inserpos [expr $all_props_removed + 1]
          set el_index -1
          #add property as comment
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "# #TE_MOD#_add_property# $el"]  
            }
          }
          #add property
          set inserpos [expr $all_props_removed + 1]
          set el_index -1
          set data [linsert $data[set data {}] $inserpos "  set_property -dict \[ list \\"]  
          incr inserpos
          foreach el $cname { 
            incr el_index
            #ignore id and line_check
            if {$el_index>1} {
              set data [linsert $data[set data {}] $inserpos "$el \\"]  
              incr inserpos
              incr mod_count
            }
          }
          set data [linsert $data[set data {}] $inserpos " \] \$[lindex $cname 1]"]  
        }
      }
      TE::UTILS::te_msg TE_UTIL-21 INFO "Block Design tcl: $mod_count properties were added."
      return $data
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished modify block design functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # generate workspace functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--workspace_info: 
    proc workspace_info {infofile info} {
      set report_file ${infofile}
      set fp_w [open ${report_file} "w"]
      puts $fp_w "$info"
      close $fp_w
    }
    #--------------------------------
    #--generate_workspace_hsi: 
    proc generate_workspace_hsi {{fname ""}} {
      if {$fname eq ""} {
      #use generated vivado data for workspace
        if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef]} {
          file mkdir ${TE::WORKSPACE_HSI_PATH}/
          file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef ${TE::WORKSPACE_HSI_PATH}/${TE::VPROJ_NAME}.hdf
          # file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit ${TE::WORKSPACE_HSI_PATH}
          workspace_info "${TE::WORKSPACE_PATH}/hsi_info.txt" "HSI Data used from ${TE::VPROJ_PATH}"
        } else {TE::UTILS::te_msg TE_UTIL-23 WARNING "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef not found, HSI workspace was not generated."}
      } else {
        #use prebuilt data for workspace
        set shortname "[TE::BDEF::find_shortdir $fname]"
        if {[file exists ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf]} {
          file mkdir ${TE::WORKSPACE_HSI_PATH}/
          file copy -force ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf ${TE::WORKSPACE_HSI_PATH}/${TE::VPROJ_NAME}.hdf
          # file copy -force ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.bit ${TE::WORKSPACE_HSI_PATH}
          workspace_info "${TE::WORKSPACE_PATH}/hsi_info.txt" "HSI Data used from  ${TE::PREBUILT_HW_PATH}/${shortname}"
        } else {TE::UTILS::te_msg TE_UTIL-24 WARNING "${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf not found, HSI workspace was not generated."}
      }
    }    
    #--------------------------------
    #--generate_workspace_sdk:     
    proc generate_workspace_sdk {{fname ""}} {
      #todo mal schauen ob vorher gelöcht werden muss oder ob überschreiben reicht
      if {$fname eq ""} {
        #use generated vivado data for workspace
        if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef]} {
           file mkdir ${TE::WORKSPACE_SDK_PATH}/
           # file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef ${TE::WORKSPACE_SDK_PATH}/${TE::VPROJ_NAME}.hdf
           #use Toplevelname instead fo Project name -> export from Vivado GUI can used to 
           file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef ${TE::WORKSPACE_SDK_PATH}/${TE::PR_TOPLEVELNAME}.hdf
           # file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit ${TE::WORKSPACE_SDK_PATH}
            workspace_info "${TE::WORKSPACE_PATH}/sdk_info.txt" "SDK Data used from ${TE::VPROJ_PATH}"
        } else {TE::UTILS::te_msg TE_UTIL-25 WARNING "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef not found, SDK workspace was not generated."}
      } else {
        #use prebuilt data for workspace
        set shortname "[TE::BDEF::find_shortdir $fname]"
        if {[file exists ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf]} {
          file mkdir ${TE::WORKSPACE_SDK_PATH}/
          # file copy -force ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf ${TE::WORKSPACE_SDK_PATH}/${TE::VPROJ_NAME}.hdf
          #use Toplevelname instead fo Project name -> export from Vivado GUI can used to 
          file copy -force ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf ${TE::WORKSPACE_SDK_PATH}/${TE::VPROJ_NAME}.hdf
          # file copy -force ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf ${TE::WORKSPACE_SDK_PATH}/${TE::PR_TOPLEVELNAME}.hdf
          # file copy -force ${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.bit ${TE::WORKSPACE_SDK_PATH}
          workspace_info "${TE::WORKSPACE_PATH}/sdk_info.txt" "SDK Data used from  ${TE::PREBUILT_HW_PATH}/${shortname}"
        } else {TE::UTILS::te_msg TE_UTIL-26 WARNING "${TE::PREBUILT_HW_PATH}/${shortname}/${TE::VPROJ_NAME}.hdf not found, SDK workspace was not generated."}
      }
    }      
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished generate workspace functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # copy files functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--copy_hw_files:   
    proc copy_hw_files { {deleteOldFile  true}} {
      #make new one
      file mkdir ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}
      if {${TE::PR_TOPLEVELNAME} eq "NA" } {
        TE::UTILS::te_msg TE_UTIL-27 {CRITICAL WARNING} "Script variable TE::PR_TOPLEVELNAME was not set, script properties will be reload."
        TE::VIV::restore_scriptprops
      }
      #copy files only if bitfiles exists
      if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit]} {
        #delete old prebuilt bitfile
        if {[file exists ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.bit] && $deleteOldFile } {
          if {[catch {file delete -force ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.bit} result]} {TE::UTILS::te_msg TE_UTIL-28 {CRITICAL WARNING} " $result"}
        }
        #copy and rename bitfile
        file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.bit
        TE::UTILS::te_msg TE_UTIL-29 INFO "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.bit was replaced with ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit"
        #--------------------------------
        #delete old prebuilt lpr
        if {[file exists ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.lpr] && $deleteOldFile } {
          if {[catch {file delete -force ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.lpr} result]} {TE::UTILS::te_msg TE_UTIL-30 {CRITICAL WARNING} " $result"}
        }
        #copy and rename lpr
        file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.hw/${TE::VPROJ_NAME}.lpr ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.lpr
        TE::UTILS::te_msg TE_UTIL-31 INFO "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.lpr was replaced with ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.hw/${TE::VPROJ_NAME}.lpr"
        #--------------------------------
        #delete old prebuilt ltx_file
        if {[file exists ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.ltx] && $deleteOldFile } {
          if {[catch {file delete -force ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.ltx} result]} {TE::UTILS::te_msg TE_UTIL-32 {CRITICAL WARNING} " $result"}
        }
        if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/debug_nets.ltx]} {
          file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/debug_nets.ltx ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.ltx
          TE::UTILS::te_msg TE_UTIL-33 INFO "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.ltx was replaced with ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/debug_nets.ltx"
        } else {TE::UTILS::te_msg TE_UTIL-34 INFO "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/debug_nets.ltx was not found."}
        #delete old prebuilt hdf_file (hdf only on processor systems)
        if {[file exists ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.hdf]  && $deleteOldFile } {
          if {[catch {file delete -force ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.hdf} result]} {TE::UTILS::te_msg TE_UTIL-35 {CRITICAL WARNING} " $result"}
        }
        if {!$TE::IS_FSYS} {
          if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef]} {
            #optional only on processor system: check bd file name --> for fsys no *hwdef and *sydef files needed
            file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.hdf
            TE::UTILS::te_msg TE_UTIL-35 INFO "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.hdf was replaced with ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef"
          } else {TE::UTILS::te_msg TE_UTIL-36 {CRITICAL WARNING} "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.sysdef was not found."}
        } 
        #delete old prebuilt mmi (not for zynq systems)
        if {[file exists ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.mmi]  && $deleteOldFile } {
          if {[catch {file delete -force ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.mmi} result]} {TE::UTILS::te_msg TE_UTIL-38 {CRITICAL WARNING} " $result"}
        }
        #delete old prebuilt mcs_file (not for zynq systems)
        if {[file exists ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.mcs]  && $deleteOldFile } {
          if {[catch {file delete -force ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.mcs} result]} {TE::UTILS::te_msg TE_UTIL-39 {CRITICAL WARNING} " $result"}
        }
        #delete old prebuilt prm_file (not for zynq systems)
        if {[file exists ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports/${TE::VPROJ_NAME}.prm]  && $deleteOldFile } {
          if {[catch {file delete -force ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports/${TE::VPROJ_NAME}.prm} result]} {TE::UTILS::te_msg TE_UTIL-40 {CRITICAL WARNING} " $result"}
        }
        #copy mmi
        if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mmi]} {
          file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mmi ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.mmi
          TE::UTILS::te_msg TE_UTIL-41 INFO "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.mmi was replaced with ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mmi"
        } else {TE::UTILS::te_msg TE_UTIL-42 WARNING "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mmi was not found."}
        #copy mcs
        if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mcs]} {
          #optional only on systems without processor used see TE::VIV::write_cfgmem for selection
          #compare timestamps, if mcs is older than bitfile, rerun write mcs_file --> if gui is used to generate bitfile mcs will not recreate
          set bittime [file mtime ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit] 
          set mcstime [file mtime ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mcs] 
          if {$mcstime < $bittime} {
            TE::UTILS::te_msg TE_UTIL-43 INFO "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mcs is older as ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit . Regenerate mcs."
            
            if {[catch {TE::VIV::write_viv_cfgmem} result]} { TE::UTILS::te_msg TE_UTIL-44 ERROR "Script (TE::VIV::write_viv_cfgmem) failed: $result."; return -code error}
          }
          file mkdir ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports
          file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.prm ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports/${TE::VPROJ_NAME}.prm
          TE::UTILS::te_msg TE_UTIL-45 INFO "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports/${TE::VPROJ_NAME}.prm was replaced with ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.prm"
          file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mcs ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${TE::VPROJ_NAME}.mcs
          TE::UTILS::te_msg TE_UTIL-46 INFO "${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports/${TE::VPROJ_NAME}.mcs was replaced with ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mcs"
        } else {TE::UTILS::te_msg TE_UTIL-47 WARNING "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.mcs was not found."}
        
      } else {TE::UTILS::te_msg TE_UTIL-48 {CRITICAL WARNING} "${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit was not found. Nothing was copied to prebuilt folder."}     
    }  
    #--------------------------------
    #--copy_sw_files:   
    proc copy_sw_files {} {
      set dirs [glob -directory $TE::WORKSPACE_HSI_PATH *]
      if { [llength $dirs] >0} {
        #make new one
        file mkdir ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}
        #copy files
        foreach dir $dirs {
          if {[file exists $dir/executable.elf]} {
            #apps+fsbl
            set fname [file tail $dir]
            #delete old prebuilt elf file
            if {[file exists ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}/${fname}.elf]} {
              if {[catch {file delete -force ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}/${fname}.elf} result]} {TE::UTILS::te_msg TE_UTIL-49 {CRITICAL WARNING} " $result"}
            }
            #copy file
            file copy -force $dir/executable.elf ${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}/${fname}.elf
            TE::UTILS::te_msg TE_UTIL-50 INFO "${TE::PREBUILT_SW_PATH}/${TE::SHORTDIR}/${fname}.elf was replaced with $dir/executable.elf"
          } elseif {[file exists $dir/skeleton.dtsi]} {
            #device tree
            set fname [file tail $dir]
            set devtree_folder ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/${fname}
            file mkdir ${devtree_folder}
            if {[file exists ${devtree_folder}/skeleton.dtsi]} {
              if {[catch {file delete -force ${devtree_folder}/skeleton.dtsi} result]} {TE::UTILS::te_msg TE_UTIL-51 {CRITICAL WARNING} " $result"}
            }
            if {[file exists ${devtree_folder}/system.dts]} {
              if {[catch {file delete -force ${devtree_folder}/system.dts} result]} {TE::UTILS::te_msg TE_UTIL-52 {CRITICAL WARNING} " $result"}
            }
            if {[file exists ${devtree_folder}/zynq-7000.dtsi]} {
              if {[catch {file delete -force ${devtree_folder}/zynq-7000.dtsi} result]} {TE::UTILS::te_msg TE_UTIL-53 {CRITICAL WARNING} " $result"}
            }
            file copy -force $dir/skeleton.dtsi ${devtree_folder}/skeleton.dtsi
            file copy -force $dir/system.dts ${devtree_folder}/system.dts
            file copy -force $dir/zynq-7000.dtsi ${devtree_folder}/zynq-7000.dtsi
            TE::UTILS::te_msg TE_UTIL-54 INFO "Following device tree files are replaced \n \
              ${devtree_folder}/skeleton.dtsi was replaced with $dir/skeleton.dtsi \n \
              ${devtree_folder}/system.dts was replaced with $dir/system.dts \n \
              ${devtree_folder}/zynq-7000.dtsi was replaced with $dir/zynq-7000.dtsi \n \
              ------"
          }
        }
      } else {
        TE::UTILS::te_msg TE_UTIL-55 {CRITICAL WARNING} "$TE::WORKSPACE_HSI_PATH was empty. Nothing was copied to prebuilt folder."
      }
    } 
    #--------------------------------
    #--copy_hw_reports:   
    proc copy_hw_reports {} {
        TE::UTILS::te_msg TE_UTIL-56 STATUS "Create reports in ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports"
        file mkdir ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports
        #copy only if new bitfile exists
        if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::PR_TOPLEVELNAME}.bit]} {
          if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_ip_status_report.txt]} {
            file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_ip_status_report.txt ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports
          }
          if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_io_report.txt]} {
            file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_io_report.txt ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports
          }
          if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_io_report.csv]} {
          file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_io_report.csv ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports
          }
          if {[file exists ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_io_report.xdc]} {
          file copy -force ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}.runs/${TE::IMPL_NAME}/${TE::VPROJ_NAME}_io_report.xdc ${TE::PREBUILT_HW_PATH}/${TE::SHORTDIR}/reports
          }
        }
        #create allways summary 
        create_prebuilt_hw_summary
    } 
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished copy files  functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # report functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--create_prebuilt_hw_summary: 
    proc create_prebuilt_hw_summary {} {
      set report_file ${TE::VPROJ_PATH}/${TE::VPROJ_NAME}_summary.csv
      set prebuilt_file ${TE::PREBUILT_HW_PATH}/hardware_summary.csv
      #todo hardware_summary.csv erase of to large
      set fp_r [open ${report_file} "r"]
      set file_data [read $fp_r]
      set data [split $file_data "\n"]
      close $fp_r
      if { ![file exists ${prebuilt_file}]} {
        set fp_w [open ${prebuilt_file} "w"]
        puts $fp_w [lindex $data 0]
        puts $fp_w [lindex $data 1]
        close $fp_w
      } else {
        set fp_a [open ${prebuilt_file} "a"]
        puts $fp_a [lindex $data 1]
        close $fp_a
      }
      TE::UTILS::te_msg TE_UTIL-57 INFO "Add HW report to: ${TE::PREBUILT_HW_PATH}/hardware_summary.csv"
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished report functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # clear functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--clean_vivado_project: 
    proc clean_vivado_project {} {
      if { [file exists $TE::VPROJ_PATH] } {
        if {[catch {file delete -force $TE::VPROJ_PATH} result]} {TE::UTILS::te_msg TE_UTIL-59 {CRITICAL WARNING} " $result"} else {TE::UTILS::te_msg TE_UTIL-56 INFO "$TE::VPROJ_PATH was deleted."}
      }
    }   
    #--------------------------------
    #--clean_labtools_project:     
    proc clean_labtools_project {} {
      if { [file exists $TE::VLABPROJ_PATH] } {
        if {[catch {file delete -force $TE::VLABPROJ_PATH} result]} {TE::UTILS::te_msg TE_UTIL-60 {CRITICAL WARNING} " $result"} else {TE::UTILS::te_msg TE_UTIL-61 INFO "$TE::VLABPROJ_PATH was deleted."}
      }
    }    
    #--------------------------------
    #--clean_workspace_hsi:  
    proc clean_workspace_hsi {} {
      if { [file exists ${TE::WORKSPACE_HSI_PATH}] } {
        if {[catch {file delete -force $TE::WORKSPACE_HSI_PATH} result]} {TE::UTILS::te_msg TE_UTIL-62 {CRITICAL WARNING} " $result"} else {TE::UTILS::te_msg TE_UTIL-63 INFO "$TE::WORKSPACE_HSI_PATH was deleted."}
      }
    } 
    #--------------------------------
    #--clean_workspace_sdk:  
    proc clean_workspace_sdk {} {
      if { [file exists ${TE::WORKSPACE_SDK_PATH}] } {
        if {[catch {file delete -force $TE::WORKSPACE_SDK_PATH} result]} {TE::UTILS::te_msg TE_UTIL-64 {CRITICAL WARNING} " $result"} else {TE::UTILS::te_msg TE_UTIL-65 INFO "$TE::WORKSPACE_SDK_PATH was deleted."}
      }
    }
    #--------------------------------
    #--clean_workspace_all:  
    proc clean_workspace_all {} {
      if { [file exists ${TE::WORKSPACE_PATH}] } {
        if {[catch {file delete -force $TE::WORKSPACE_PATH} result]} {TE::UTILS::te_msg TE_UTIL-66 {CRITICAL WARNING} " $result"} else {TE::UTILS::te_msg TE_UTIL-67 INFO "$TE::WORKSPACE_PATH was deleted."}
      }
    }
    #--------------------------------
    #--clean_sdsoc:  
    proc clean_sdsoc {} {
      if { [file exists ${TE::SDSOC_PATH}] } {
        if {[catch {file delete -force $TE::SDSOC_PATH} result]} {TE::UTILS::te_msg TE_UTIL-68 {CRITICAL WARNING} " $result"} else {TE::UTILS::te_msg TE_UTIL-69 INFO "$TE::SDSOC_PATH was deleted."}
      }
    }
    #--------------------------------
    #--clean_all_generated_files:  
    proc clean_all_generated_files {} {
      clean_vivado_project
      clean_labtools_project
      clean_workspace_hsi
      clean_workspace_sdk
      clean_workspace_all
      clean_sdsoc
      TE::UTILS::te_msg TE_UTIL-71 INFO "Clean all generated files finished."
    }
    #--------------------------------
    #--clean_prebuilt_all:  
    proc clean_prebuilt_all {} {
      if { [file exists ${TE::PREBUILT_PATH}] } {
        if {[catch {file delete -force $TE::PREBUILT_PATH} result]} {TE::UTILS::te_msg TE_UTIL-70 {CRITICAL WARNING} " $result"} else {TE::UTILS::te_msg TE_UTIL-71 INFO "$TE::PREBUILT_PATH was deleted."}
      }
    }
    #todo clean prebuilt single part -> bi hw ,sw, os
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished report functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    
    
    # -----------------------------------------------------------------------------------------------------------------------------------------
  }
  puts "INFO:(TE) Load Utilities script finished"
}


