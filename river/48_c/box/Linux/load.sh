#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
address=""
MOUNT="NO"

echo "Name    : $name"




if [ -d '/dev/sda1/' ];then
  address="/dev/sda1/"
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



  if [   -d /opt/backup ];
  then
    rm -rf /opt/backup
  fi

  mkdir /opt/backup




  cp -rf         ${address}/seed             /opt/backup
  rm -rf         /opt/gop/seed
  cp -rf         /opt/backup/*               /opt/gop/seed
  rm -rf         /opt/backup

fi





if [ $MOUNT == "yes" ];then
  umount /dev/sda
fi


  echo "Done."
