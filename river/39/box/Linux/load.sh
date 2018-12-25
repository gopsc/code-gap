#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
address="/dev/sda1/ta/load.sh"
MOUNT="NO"

echo "Name    : $name"




if [ -d $address ];then
  echo "Address : $address"

elif [ -d "/media/gop/GOP/" ];then
  address="/media/gop/GOP/"

elif [ -d "/media/gop/gop/" ];then
  address="/media/gop/gop/"

elif [ $name == "deepin-PC" ];then
  address="/media/deepin/gop"

elif [ $name == "beaglebone" ];then
  address="/media"
  mount /dev/sda /media
  MOUNT="yes"

elif [ $name == "raspberrypi" ];then
  echo "raspberrypi"
  address="/media/pi/gop"

elif [ $name == "Orangepi" ];then
  address="/media/usb"

elif [ $name == "dragino-129ff8" ];then
  address="/mnt/sda1"

elif [ $name == "ubuntu" ];then
  address="/media/gop"

else
  echo "Unknow.."
  address="unknow"
fi


if [ $address != "unknow" ];then
  echo "..."






  rm -rf         /opt/ta
  cp -rf         ${address}/ta            /opt
#  cp             ${address}/ta.tar.gz    /opt
#  tar zxf        /opt/ta.tar.gz
#  mv             ./ta                    /opt
#  rm             /opt/ta.tar.gz

fi





if [ $MOUNT == "yes" ];then
  umount /dev/sda
fi


  echo "Done."
