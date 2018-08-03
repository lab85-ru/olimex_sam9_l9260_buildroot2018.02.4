#!/bin/sh
DATE=`date +"%d-%m-%Y__%T"`

BR_CONF=buildroot.config
K_CONF=kernel.config
BB_CONF=busybox.config

F_CONF_NAME=buildroot_configs"_"$DATE

echo "================================================================================"
echo " COPY Buildroot .config to ../"
echo " COPY Kernel .config to ../"
echo " COPY BusyBox .config to ../"
echo "================================================================================"
cp .config $BR_CONF
if [ $? -ne 0 ]; then
  echo "ERROR: $BR_CONF - not found"
  touch $BR_CONF
fi

cp output/build/linux-4.15.16/.config $K_CONF
if [ $? -ne 0 ]; then
  echo "ERROR: $K_CONF - not found"
  touch $K_CONF
fi

cp output/build/busybox-1.27.2/.config $BB_CONF
if [ $? -ne 0 ]; then
  echo "ERROR: $BB_CONF - not found"
  touch $BB_CONF
fi

echo "================================================================================"
echo " TAR *.config to ../"
echo "================================================================================"
tar -cjf ../$F_CONF_NAME.tar.bz2 $BR_CONF $K_CONF $BB_CONF
rm $BR_CONF $K_CONF $BB_CONF

