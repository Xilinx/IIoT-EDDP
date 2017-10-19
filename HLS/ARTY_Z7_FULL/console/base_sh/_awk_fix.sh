#! /bin/sh

# --------------------------------------------------------------------
# --   *****************************
# --   *   Trenz Electronic GmbH   *
# --   *   Holzweg 19A             *
# --   *   32257 Bünde   		      *
# --   *   Germany                 *
# --   *****************************
# --------------------------------------------------------------------
# --$Autor: Kohout, Lukas $
# --$Email: kohoutl@utia.cas.cz $
# --$Create Date:2017/09/22 $
# --$Version: 1.0$
# -----------------------------------
# -- Description:
# --   workaround for Xilinx tools on ubuntu Linux
# --------------------------------------------------------------------
# --------------------------------------------------------------------

function help {
  echo "Usage:"
  echo "$0 fix|revert"
}

if [ $# == 0 ] || [ "$1" != "fix" ] && [ "$1" != "revert" ]; then
  help
  exit
fi


echo -------------------Fix problem with awk on Ubuntu-------------------
bashfile_name=${0##*/}
bashfile_path=`pwd`
echo -- Run Design with: ${bashfile_name}
echo -- Use Design Path: ${bashfile_path}
echo ---------------------Load basic design settings---------------------
source $bashfile_path/design_basic_settings.sh
echo --------------------------------------------------------------------

if [ ${ENABLE_SDSOC} -eq 1 ]; then
  echo "Modify SDx tool ${XILDIR}SDx/${VIVADO_VERSION}"
  echo --------------------------------------------------------------------
else
  echo "Only SDx is supported ... exiting"
  echo --------------------------------------------------------------------
  exit 0
fi


FILES_TO_FIX_V1=( \
  ${XILDIR}/SDx/${VIVADO_VERSION}/Vivado/bin/loader         \
  ${XILDIR}/SDx/${VIVADO_VERSION}/SDK/bin/loader            \
  ${XILDIR}/SDx/${VIVADO_VERSION}/Vivado_HLS/bin/loader     \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/loader                \
)

FILES_TO_FIX_V2=( \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/sds++                 \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/sdspfm_convert        \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/sdspfm                \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/sdscc                 \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/system_linker         \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/sds-pf-check          \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/sdx_link              \
  ${XILDIR}/SDx/${VIVADO_VERSION}/bin/sdx_sdcard            \
)

# do the fix
if [ "$1" == "fix" ]; then

  for (( i = 0; i < ${#FILES_TO_FIX_V1[@]}; i++ )); do

    if [ -e ${FILES_TO_FIX_V1[$i]} ]; then

      # test whether the modification has been alredy done or not
      grep -q -E 'RDI_MY_OS=\"ubuntu\"' ${FILES_TO_FIX_V1[$i]}
      if [ $? -eq 0 ]; then
        echo "${FILES_TO_FIX_V1[$i]} ... already done"
      else
    
        # make a backup
        cp -f ${FILES_TO_FIX_V1[$i]} ${FILES_TO_FIX_V1[$i]}.te_old

        # substitute
        #   RDI_MY_OS=$(unset LD_LIBRARY_PATH; awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
        # with
        #   RDI_MY_OS="ubuntu"
        sed -i -r -e "s/(^RDI_MY_OS=.*)/RDI_MY_OS=\"ubuntu\"\n# \1/g" ${FILES_TO_FIX_V1[$i]}
        echo "${FILES_TO_FIX_V1[$i]} ... modified"
      fi

    else
      echo "${FILES_TO_FIX_V1[$i]} ... does not exixst"
    fi

  done


  for (( i = 0; i < ${#FILES_TO_FIX_V2[@]}; i++ )); do

    if [ -e ${FILES_TO_FIX_V2[$i]} ]; then

      # test whether the modification has been alredy done or not
      grep -q -E 'OS=\"ubuntu\"' ${FILES_TO_FIX_V2[$i]}
      if [ $? -eq 0 ]; then
        echo "${FILES_TO_FIX_V2[$i]} ... already done"
      else

        # make a backup
        cp -f ${FILES_TO_FIX_V2[$i]} ${FILES_TO_FIX_V2[$i]}.te_old

        # substitute
        #   OS=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//' | tr '[:upper:]' '[:lower:]')
        # with
        #   OS="ubuntu"
        sed -i -r -e "s/(^OS=.*)/OS=\"ubuntu\"\n# \1/g" ${FILES_TO_FIX_V2[$i]}
        echo "${FILES_TO_FIX_V2[$i]} ... modified"
      fi
        
    else
      echo "${FILES_TO_FIX_V2[$i]} ... does not exixst"
    fi

  done

fi
  
# revert to original version
if [ "$1" == "revert" ]; then

  for (( i = 0; i < ${#FILES_TO_FIX_V1[@]}; i++ )); do
    if [ -e ${FILES_TO_FIX_V1[$i]}.te_old ]; then
      mv -f ${FILES_TO_FIX_V1[$i]}.te_old ${FILES_TO_FIX_V1[$i]}
      echo "${FILES_TO_FIX_V1[$i]} ... reverted"
    else
      echo "${FILES_TO_FIX_V1[$i]}.te_old ... does not exixst, cannot be reverted"
    fi
  done

  for (( i = 0; i < ${#FILES_TO_FIX_V2[@]}; i++ )); do
    if [ -e ${FILES_TO_FIX_V2[$i]}.te_old ]; then
      mv -f ${FILES_TO_FIX_V2[$i]}.te_old ${FILES_TO_FIX_V2[$i]}
      echo "${FILES_TO_FIX_V2[$i]} ... reverted"
    else
      echo "${FILES_TO_FIX_V2[$i]}.te_old ... does not exixst, cannot be reverted"
    fi
  done

fi

echo --------------------------------------------------------------------
