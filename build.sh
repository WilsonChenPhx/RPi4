#!/bin/bash

set -e
shopt -s nocasematch

export WORKSPACE=$PWD
export EDK2_PATH=$WORKSPACE/edk2

export BASE_TOOLS_PATH=$EDK2_PATH/BaseTools
export EDK_TOOLS_PATH=$BASE_TOOLS_PATH
if [ ! -e $BASE_TOOLS_PATH/Source/C/bin ]; then
  make -C $BASE_TOOLS_PATH
fi

export CONF_PATH=$WORKSPACE/Conf
if [ ! -e $CONF_PATH ]; then
  mkdir  $CONF_PATH
fi
source $EDK2_PATH/edksetup.sh

export PACKAGES_PATH=$EDK2_PATH:$WORKSPACE/edk2-platforms:$WORKSPACE/edk2-non-osi
export GCC5_AARCH64_PREFIX=aarch64-linux-gnu-

build -a AARCH64 -t GCC5 -p Platform/RaspberryPi/RPi4/RPi4.dsc
