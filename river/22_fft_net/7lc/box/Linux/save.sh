#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
address="/dev/sda1/load.sh"
MOUNT="no"

echo "Name    : $name"








if [ -d $address ];then
  echo "Address : $address"

elif [ -d "/media/gop/gop/" ];then
  address="/media/gop/gop/"
  echo "Address : $address"

elif [ -d "/media/gop/GOP/" ];then
  address="/media/gop/GOP/"
  echo "Address : $address"

elif [ $name == "deepin-PC" ];then
  echo "Deepin Linux"
  address="/media/deepin/GOP"

elif [ $name == "beaglebone" ];then
  echo "beaglebone"
  address="/media"
  mount /dev/sda /media
  MOUNT="yes"

elif [ $name == "raspberrypi" ];then
  echo "raspberrypi"
  address="/media"
  mount /dev/sda1 /media
  MOUNT="yes"

elif [ $name == "dragino-129ff8" ];then
  echo "dragino"
  address="/mnt/sda1"

elif [ $name == "Orangepi" ];then
  echo "orangepi"
  address="/media/usb"

elif [ $name == "ubuntu" ];then
  echo "ubuntu"
  address="/media/GOP"

else
  echo "No gopUSB device."
  address="unknow"
fi




if [ $address != "unknow" ];then
  echo "..."




#  cp  -rf  /opt/7lc               ./
#  tar zcf  ./7lc.tar.gz        7lc
#  cp       ./7lc.tar.gz        ${address}

  cp -rf /opt/7lc                           ${address}
  cp       /opt/7lc/box/Linux/load.sh       ${address}

#  rm -rf   ./7lc
#  rm       ./7lc.tar.gz


fi





if [ $MOUNT == "yes" ];then
  umount /dev/sda
fi




  echo "Done."

