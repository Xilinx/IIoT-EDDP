
XSCTH_WS = "${TOPDIR}/../components/plnx_workspace"
EXTERNALXSCTSRC = "${PETALINUX}/tools/hsm/data/embeddedsw"
inherit externalxsctsrc
EXTERNALXSCTSRC_BUILD = "${TOPDIR}/../components/plnx_workspace"
export PETALINUX
YAML_SERIAL_CONSOLE_STDOUT = "ps7_uart_0"
YAML_SERIAL_CONSOLE_STDIN = "ps7_uart_0"
