#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
address=''
MOUNT="no"

echo "Name    : $name"








if [ -d "/dev/sda1/" ];then
  address="/dev/sda1"
  echo "Address : $address"

elif [ -d "/media/gop/gop/" ];then
  address="/media/gop/gop/"
  echo "Address : $address"

elif [ -d "/media/gop/GOP/" ];then
  address="/media/gop/GOP/"
  echo "Address : $address"

elif [ $name == "deepin-PC" ];then
  address="/media/deepin/gop"

elif [ $name == "beaglebone" ];then
  address="/media"
  mount /dev/sda /media
  MOUNT="yes"

elif [ $name == "raspberrypi" ];then
  address="/media/pi/gop/"

elif [ $name == "dragino-129ff8" ];then
  address="/mnt/sda1"

elif [ $name == "Orangepi" ];then
  address="/media/usb"

elif [ $name == "ubuntu" ];then
  address="/media/gop"

else
  echo "No gopUSB device."
  address="unknow"
fi




if [ $address != "unknow" ];then
  echo "..."



  if [ ! -d $address ];then
    mkdir $address
  fi

  mv -f  ${address}/seed                         ${address}/backup
  cp -rf /opt/gop/seed                           ${address}/seed
  rm -rf ${address}/backup

fi





if [ $MOUNT == "yes" ];then
  umount /dev/sda
fi




  echo "Done."

