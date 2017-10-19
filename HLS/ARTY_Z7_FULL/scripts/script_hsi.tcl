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
# -- $Date: 2016/02/05 | $Author: Hartfiel, John
# -- - initial release
# ------------------------------------------
# -- $Date: 2017/06/13  | $Author: Hartfiel, John
# -- - add pmuf hsi support
# ------------------------------------------
# -- $Date:  2017/09/06  | $Author: Hartfiel, John
# -- - add new document history style
# -- - add remove test printout
# ------------------------------------------
# -- $Date: 0000/00/00  | $Author:
# -- - 
# --------------------------------------------------------------------
# --------------------------------------------------------------------
namespace eval TE {
  namespace eval HSI {
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # TE HSI variablen declaration
    # -----------------------------------------------------------------------------------------------------------------------------------------
    variable HDF_NAME
    variable LIB_PATH
    variable SW_APPLIST
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished TE HSI variablen declaration
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # hsi hw functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--open_project: 
    proc open_project {} {
      if {[catch {set TE::HSI::HDF_NAME [glob -join -dir [pwd] *.hdf]} result]} { puts "Error:(TE) Script (TE::HSI::hsi_open_project) failed: $result."; return -code error}
      #todo: eventuell mal extra verzeichnis erstellen, wie sdk
      open_hw_design ${TE::HSI::HDF_NAME}
    }
    #--------------------------------
    #--set_repopath: 
    proc set_repopath {} {
      set_repo_path ${TE::HSI::LIB_PATH}
    } 
    #--------------------------------
    #--close_project: 
    proc close_project {} {
      close_hw_design [current_hw_design]
    }  
    #--------------------------------
    #--get_processors:
    proc get_processors {PROCESSOR_ID} {
      set proc [get_cells  -filter {IP_TYPE==PROCESSOR}]
      if {[llength $proc] == 0} {
        return -code error "Error:(TE) No Processor found in design ${TE::HSI::HDF_NAME}";
      } else {
        if {[llength $proc] > 1} {
          puts "Info:(TE) Multiple Processors found."
        }
        if {[llength $proc] > $PROCESSOR_ID} {
          puts "Info:(TE)  Processor [lindex $proc $PROCESSOR_ID] is used."
          return [lindex $proc $PROCESSOR_ID]
        } else {
          return -code error "Error:(TE) No Processor ID $PROCESSOR_ID not found in design ${TE::HSI::HDF_NAME}";
        }
      }
    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished hw functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # hsi sw functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--create_sw_project: 
    proc create_sw_project {app_name os uart {proc_id 0}} {
     
      set cpu [get_processors $proc_id]
      set hwdesign [current_hw_design]
      set swdesign [hsi::create_sw_design system -proc $cpu -app $app_name -os $os]
      set os [hsi::get_os]
      if {$uart ne "NA"} {
        #workaround to change uart -> currently generate_app will delete bsp and write default one
        generate_app -hw $hwdesign -sw $swdesign -app $app_name -proc $cpu -dir $app_name -os $os
        hsi::close_sw_design $swdesign
        hsi::open_sw_design ${app_name}/${app_name}_bsp/system.mss
        #reset old variables
        set swdesign [get_sw_designs]
        set os [hsi::get_os]
        #set uart properties
        common::set_property CONFIG.stdin $uart $os
        common::set_property CONFIG.stdout $uart $os
        #generate bsp
        hsi::generate_bsp -dir ${app_name}/${app_name}_bsp/ -compile
        cd ${app_name}
        set result ""
        #run make
        if {[catch {set result [eval exec make]}]} {puts "Info:(TE) $result"}
        cd ..
      } else {
        generate_app -hw $hwdesign -sw $swdesign -app $app_name -proc $cpu -os $os -dir $app_name -verbose -compile
      }
      close_sw_design $swdesign
    }  
    #--------------------------------
    #--create_devicetree_project: 
    proc create_devicetree_project {app_name os} {
      set cpu [get_processors 0]
      set hwdesign [current_hw_design]
      set swdesign [hsi::create_sw_design $app_name -proc $cpu -os $os]
      generate_target -dir $app_name
      close_sw_design $swdesign
    }  
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished sw functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # hsi run functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    #--------------------------------
    #--run_sw_apps: 
    proc run_sw_apps {} {
      #search and generate fsbl and device tree
      foreach sw_applist_line ${TE::HSI::SW_APPLIST} {
        #generate fsbl only
        if {[lindex $sw_applist_line 2] eq "FSBL" } {
          set name [lindex $sw_applist_line 1]
          set os [lindex $sw_applist_line 3]
          set uart [lindex $sw_applist_line 4]
          puts "Info:(TE) generate FSBL: $name os: $os Uart: $uart"
          create_sw_project $name $os $uart
        }
        #generate pmu UynqMP only
        if {[lindex $sw_applist_line 2] eq "PMU" } {
          set name [lindex $sw_applist_line 1]
          set os [lindex $sw_applist_line 3]
          set uart [lindex $sw_applist_line 4]
          #select pmu
          set proc_id 6
          puts "Info:(TE) generate PMU: $name os: $os Uart: $uart"
          create_sw_project $name $os $uart $proc_id
        }
        #generate device tree only
        if {[lindex $sw_applist_line 2] eq "DTS" } {
          set name [lindex $sw_applist_line 1]
          set os [lindex $sw_applist_line 3]
          puts "Info:(TE) generate Device-Tree: $name os: $os"
          create_devicetree_project $name $os
        }
      }
      #search and generate software apps
      foreach sw_applist_line ${TE::HSI::SW_APPLIST} {
        #generate *.bin only if app_list.csv->steps=0(generate all) or steps=3(*.elf only )
        if {[lindex $sw_applist_line 2] == 0 || [lindex $sw_applist_line 2] == 3} {
          set name [lindex $sw_applist_line 1]
          set os [lindex $sw_applist_line 3]
          set uart [lindex $sw_applist_line 4]
          puts "Info:(TE) generate app: $name os: $os Uart: $uart"
          create_sw_project $name $os $uart
        }
      }
    }
    #--------------------------------
    #--debug_sw_app_list:
    proc debug_sw_app_list {} {
      set TE::HSI::SW_APPLIST [list]
      foreach lpath ${TE::HSI::LIB_PATH} {
        if {[file exists  ${lpath}/apps_list.csv]} { 
          puts "Info:(TE) Read Software list from ${lpath}/apps_list.csv"
          set fp [open "${lpath}/apps_list.csv" r]
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
              #version is ignored for debug only
            } elseif {[string match *#* $line] != 1 && [string length $line] > 0} {
              #remove spaces
              set line [string map {" " ""} $line]
              #remove tabs
              set line [string map {"\t" ""} $line]
              #splitt and append
              set tmp [split $line ","]
              lappend TE::HSI::SW_APPLIST $tmp
            }
          }
        }
      }
      puts "------------------------------------------"
    }
    #--------------------------------
    #--run_all:
    proc run_all {} {
      #todo: run all als option und hsi auch über batch separat startbar
      puts "Info:(TE) HSI...run all..."
      if {[catch {open_project} result]} { puts "Error:(TE) Script (TE::HSI::open_project) failed: $result.";  return -code error}
      if {[catch {set_repopath} result]} { puts "Error:(TE) Script (TE::HSI::set_repopath) failed: $result.";  return -code error}
      #----------------------------------------
      if {[catch {run_sw_apps} result]} { puts "Error:(TE) Script (TE::HSI::run_sw_apps) failed: $result.";  return -code error}
      #----------------------------------------
      if {[catch {close_project} result]} { puts "Error:(TE) Script (TE::HSI::close_project) failed: $result.";  return -code error}
    }
    #--------------------------------
    #--return_option: 
    proc return_option {option argc argv} {
      if { $argc <= [expr $option + 1]} { 
        return -code error "Error:(TE) Read parameter failed"
      } else {  
        puts "Info:(TE) Parameter Option Value: [lindex $argv [expr $option + 1]]"
        return [lindex $argv [expr $option + 1]]
      }
    }    
    #--------------------------------
    #--hsi_main: 
    proc hsi_main {} {
      global argc
      global argv
      set tmp_argc 0
      set tmp_argv 0
      if {$argc >= 1 } {
        set tmp_argv [lindex $argv 0]
        set tmp_argc [llength $tmp_argv]
      }
      
      set vivrun false
      variable SW_APPLIST 
      variable LIB_PATH 

      for {set option 0} {$option < $tmp_argc} {incr option} {
        puts "Info:(TE) Parameter Index: $option"
        puts "Info:(TE) Parameter Option: [lindex $tmp_argv $option]"
        switch [lindex $tmp_argv $option] {
          "--sw_list"	        { set SW_APPLIST [return_option $option $tmp_argc $tmp_argv];incr option }    
          "--lib"	            { set LIB_PATH [return_option $option $tmp_argc $tmp_argv];incr option }    
          "--vivrun"		      { set vivrun true }
          default             { puts "" }
        }
      }
      if {$vivrun==true} {
        if {[catch {run_all} result]} { puts "Error:(TE) Script (TE::HSI::run_all) failed: $result."; exit}
        exit
      }

    }
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished run functions
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # hsi run scripts
    # -----------------------------------------------------------------------------------------------------------------------------------------
    if {[catch {hsi_main} result]} { puts "Error:(TE) Script (TE::HSI::hsi_main) failed: $result."; exit}
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # finished hsi run scripts
    # -----------------------------------------------------------------------------------------------------------------------------------------
  
  
  
  # -----------------------------------------------------------------------------------------------------------------------------------------
  }
 puts "Info: Load HSI scripts finished"
}


