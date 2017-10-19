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
# -- $Date: 2016/02/08 | $Author: Hartfiel, John
# -- - initial release
# ------------------------------------------
# -- $Date: 2017/02/02  | $Author: Hartfiel, John
# -- - miscellaneous
# ------------------------------------------
# -- $Date:  2017/09/04  | $Author: Hartfiel, John
# -- - add new document history style
# ------------------------------------------
# -- $Date: 0000/00/00  | $Author:
# -- - 
# --------------------------------------------------------------------
# --------------------------------------------------------------------

proc reinitialise {} {
  TE::UTILS::te_msg TE_INIT-59 INFO "Reinitialise Scripts \n \
    Current directory: [pwd] \n \
    At moment, this attributes can't be refreshed: \n \
    TE::VIVADO_AVAILABLE    : $TE::VIVADO_AVAILABLE \n \
    TE::LABTOOL_AVAILABLE   : $TE::LABTOOL_AVAILABLE \n \
    TE::SDK_AVAILABLE       : $TE::SDK_AVAILABLE \n \
    TE::SDSOC_AVAILABLE     : $TE::SDSOC_AVAILABLE \n \
      Xilinx SDSOC Scripts \n \
    ------"
  set cur [pwd]
  cd ..
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # load scripts
  # -----------------------------------------------------------------------------------------------------------------------------------------
  source ./scripts/script_settings.tcl
  source ./scripts/script_environment.tcl
  source ./scripts/script_vivado.tcl
  source ./scripts/script_te_utils.tcl
  source ./scripts/script_designs.tcl
  source ./scripts/script_external.tcl
  source ./scripts/script_usrcommands.tcl
  source ./scripts/script_sdsoc.tcl
  #sources from other programs:
  # source ./scripts/main.tcl
  # source ./scripts/hsi.tcl
  #currently SDSOC Runs only with batch start
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # finished initial functions
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # initial variables
  # -----------------------------------------------------------------------------------------------------------------------------------------
  if {[catch {TE::INIT::basic_inits} result]} {abort_status "Error Initialisation..."; create_allboardfiles_status; TE::UTILS::te_msg TE_INIT-60 ERROR "Script (TE::INIT::basic_inits) failed: $result."; return -code error}
  #------
  set projectname "NA"
  set BOARD ""
  if {[file exists ${TE::BASEFOLDER}/design_basic_settings.cmd]} {
    set fp [open "${TE::BASEFOLDER}/design_basic_settings.cmd" r]
    set file_data [read $fp]
    close $fp
    set tmp [split $file_data "\n"]
    foreach t $tmp {
      if {[string match "@set PARTNUMBER=*" $t] } {
        set splittstring [split $t "="]
        set BOARD [lindex $splittstring [expr [llength $splittstring]-1]]
      }
      if {[string match "@set ZIP_PATH=*" $t] } {
        set splittstring [split $t "="]
        set TE::ZIP_PATH [lindex $splittstring [expr [llength $splittstring]-1]]
        TE::UTILS::te_msg TE_INIT-61 STATUS "Restore ZIP path from design_basic_settings.cmd \n \
          TE::ZIP_PATH     : ${TE::ZIP_PATH} \n \
          ------"
      }
      if {[string match "@set XILINXGIT_DEVICETREE=*" $t] } {
        set splittstring [split $t "="]
        set TE::XILINXGIT_DEVICETREE [lindex $splittstring [expr [llength $splittstring]-1]]
        TE::UTILS::te_msg TE_INIT-62 STATUS "Restore XILINXGIT_DEVICETREE path from design_basic_settings.cmd \n \
          TE::XILINXGIT_DEVICETREE     : ${TE::XILINXGIT_DEVICETREE} \n \
          ------"
      }
      if {[string match "@set XILINXGIT_UBOOT=*" $t] } {
        set splittstring [split $t "="]
        set TE::XILINXGIT_UBOOT [lindex $splittstring [expr [llength $splittstring]-1]]
        TE::UTILS::te_msg TE_INIT-63 STATUS "Restore XILINXGIT_UBOOT path from design_basic_settings.cmd \n \
          TE::XILINXGIT_UBOOT     : ${TE::XILINXGIT_UBOOT} \n \
          ------"
      }
      if {[string match "@set XILINXGIT_LINUX=*" $t] } {
        set splittstring [split $t "="]
        set TE::XILINXGIT_LINUX [lindex $splittstring [expr [llength $splittstring]-1]]
        TE::UTILS::te_msg TE_INIT-64 STATUS "Restore XILINXGIT_LINUX path from design_basic_settings.cmd \n \
          TE::XILINXGIT_LINUX     : ${TE::XILINXGIT_LINUX} \n \
          ------"
      }
    }
  }
  if {[catch {set projectname [get_projects]} result]} {
    TE::UTILS::te_msg TE_INIT-65 STATUS "Reinitialise Vivado Labtools with board part variable from design_basic_settings.cmd."
    if {[catch {TE::INIT::init_board [TE::BDEF::find_id $BOARD] 0} result]} {set cur [pwd]; TE::UTILS::te_msg TE_INIT-66 ERROR "Script (TE::INIT::init_board /[TE::BDEF::find_id/]) failed: $result."; return -code error}
    cd $TE::VLABPROJ_PATH
  } else {
    TE::UTILS::te_msg TE_INIT-66 STATUS "Reinitialise Vivado"
    set pfolder [file tail [pwd]]
    cd  $cur
    if {$pfolder != $projectname} {set cur [pwd]; TE::UTILS::te_msg TE_INIT-67 ERROR "Inconsistent project name, get project [get_projects], expected $pfolder from project folder"; return -code error}
    cd ..
    #initial vivado variables 
    if {[catch {TE::VIV::restore_scriptprops} result]} {set cur [pwd]; TE::UTILS::te_msg TE_INIT-68 ERROR "Script (TE::VIV::restore_scriptprops) failed: $result."; return -code error}
    cd $TE::VPROJ_PATH
  }
  # -----------------------------------------------------------------------------------------------------------------------------------------
  # finished initial variables
  # -----------------------------------------------------------------------------------------------------------------------------------------




  # -----------------------------------------------------------------------------------------------------------------------------------------
}
# -----------------------------------------------------------------------------------------------------------------------------------------
#  run reinitialisation
# -----------------------------------------------------------------------------------------------------------------------------------------
reinitialise
# -----------------------------------------------------------------------------------------------------------------------------------------
# finished run reinitialisation
# -----------------------------------------------------------------------------------------------------------------------------------------