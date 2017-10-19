@REM # --------------------------------------------------------------------
@REM # --   *****************************
@REM # --   *   Trenz Electronic GmbH   *
@REM # --   *   Holzweg 19A             *
@REM # --   *   32257 Bünde   		      *
@REM # --   *   Germany                 *
@REM # --   *****************************
@REM # --------------------------------------------------------------------
@REM # --$Autor: Hartfiel, John $
@REM # --$Email: j.hartfiel@trenz-electronic.de $
@REM # --$Create Date:2016/03/08 $
@REM # --$Modify Date: 2017/01/13 $
@REM # --$Version: 2.2 $
@REM # --------------------------------------------------------------------
@REM # --------------------------------------------------------------------
@REM set local environment
setlocal
@echo ------------------------Set design paths----------------------------
@REM get paths
@set batchfile_name=%~n0
@set batchfile_drive=%~d0
@set batchfile_path=%~dp0
@REM change drive
@%batchfile_drive%
@REM change path to batchfile folder
@cd %batchfile_path%
@echo -- Run Design with: %batchfile_name%
@echo -- Use Design Path: %batchfile_path%
@echo ---------------------Load basic design settings---------------------
@call design_basic_settings.cmd
@echo --------------------------------------------------------------------
@echo ------------------Set Xilinx environment variables------------------
@set VIVADO_XSETTINGS=%XILDIR%\Vivado\%VIVADO_VERSION%\settings64.bat
@set SDK_XSETTINGS=%XILDIR%\SDK\%VIVADO_VERSION%\settings64.bat
@set LABTOOL_XSETTINGS=%XILDIR%\Vivado_Lab\%VIVADO_VERSION%\settings64.bat
@if not defined ENABLE_SDSOC (
  @set ENABLE_SDSOC=0
)
@if %ENABLE_SDSOC%==1 (
  @echo --Info: SDSOC Settings are disabled for this cmd file --
  @REM @set SDSOC_XSETTINGS=%XILDIR%\SDSoC\%VIVADO_VERSION%\settings64.bat
)
@REM # --------------------
@if not defined VIVADO_AVAILABLE (
  @set VIVADO_AVAILABLE=0
)
@if not defined SDK_AVAILABLE (
  @set SDK_AVAILABLE=0
)
@if not defined LABTOOL_AVAILABLE (
  @set LABTOOL_AVAILABLE=0
)
@if not defined SDSOC_AVAILABLE (
  @set SDSOC_AVAILABLE=0
)
@REM # --------------------
@echo -- Use Xilinx Version: %VIVADO_VERSION% --
@if not defined VIVADO_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx Vivado Settings --
  @if not exist %VIVADO_XSETTINGS% ( @echo -- Info: %VIVADO_XSETTINGS% not found --
  ) else (
    @call %VIVADO_XSETTINGS%
    @set VIVADO_AVAILABLE=1
  )
  @set VIVADO_XSETTINGS_ISDONE=1
)
@if not defined SDK_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx SDK Settings --
  @if not exist %SDK_XSETTINGS% ( @echo -- Info: %SDK_XSETTINGS% not found --
  ) else (
    @call %SDK_XSETTINGS%
    @set SDK_AVAILABLE=1
  )
  @set SDK_XSETTINGS_ISDONE=1
)
@if not defined LABTOOL_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx LabTools Settings --
  @if not exist %LABTOOL_XSETTINGS% ( @echo -- Info: %LABTOOL_XSETTINGS% not found --
  ) else (
    @call %LABTOOL_XSETTINGS%
    @set LABTOOL_AVAILABLE=1
  )
  @set LABTOOL_XSETTINGS_ISDONE=1
)
@if not defined SDSOC_XSETTINGS_ISDONE ( @echo --Info: Configure Xilinx SDSoC Settings --
  @if not exist %SDSOC_XSETTINGS% ( @echo -- Info: %SDSOC_XSETTINGS% not found --
  ) else (
    @call %SDSOC_XSETTINGS%
    @set SDSOC_AVAILABLE=1
  )
  @set SDSOC_XSETTINGS_ISDONE=1
)
@echo --------------------------------------------------------------------
@REM check important settings
@if %VIVADO_AVAILABLE%==1 (
  @goto  RUN
)
@REM @if %SDK_AVAILABLE%==1 (
  @REM @goto  RUN
@REM )
@if %LABTOOL_AVAILABLE%==1 (
  @goto  RUN
)
@echo -- Error: Need Vivado or LabTools to run. --
@goto  ERROR

:RUN
@echo ----------------------Change to log folder--------------------------
@REM vlog folder
@set vlog_folder=%batchfile_path%v_log
@echo %vlog_folder%
@if not exist %vlog_folder% ( @mkdir %vlog_folder% )   
@cd %vlog_folder%
@echo --------------------------------------------------------------------
@echo -------------------------Start VIVADO scripts -----------------------
@if %VIVADO_AVAILABLE%==1 (
  call vivado -source ../scripts/script_main.tcl  -mode batch -notrace -tclargs --program_mcs --boardpart %PARTNUMBER% --program_swapp %SWAPP% --use_basefolder %PROGRAM_ROOT_FOLDER_FILE%
) else (
  call vivado_lab -source ../scripts/script_main.tcl  -mode batch -notrace -tclargs --program_mcs --boardpart %PARTNUMBER% --program_swapp %SWAPP% --use_basefolder %PROGRAM_ROOT_FOLDER_FILE% --labtools
)

@echo -------------------------scripts finished----------------------------
@echo --------------------------------------------------------------------
@echo --------------------Change to design folder-------------------------
@cd..
@echo ------------------------Design finished-----------------------------
@if not defined DO_NOT_CLOSE_SHELL (
  @set DO_NOT_CLOSE_SHELL=0
)
@if %DO_NOT_CLOSE_SHELL%==1 (
  PAUSE
)
GOTO EOF

:ERROR
@echo ---------------------------Error occurs-----------------------------
@echo --------------------------------------------------------------------
PAUSE

:EOF