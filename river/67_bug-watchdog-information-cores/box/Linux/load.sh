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

elif [ -d "/media/gop/TXL/" ];then
  address="/media/gop/TXL/"

elif [ -d "/media/gop/TxL/" ];then
  address="/media/gop/TxL/"

elif [ $name == "deepin-PC" ];then
  address="/media/deepin/TxL"

elif [ $name == "beaglebone" ];then
  address="/media"
  mount /dev/sda /media
  MOUNT="yes"

elif [ $name == "raspberrypi" ];then
  echo "raspberrypi"
  address="/media/pi/TxL"

elif [ $name == "Orangepi" ];then
  address="/media/usb"

elif [ $name == "dragino-129ff8" ];then
  address="/mnt/sda1"

elif [ $name == "ubuntu" ];then
  address="/media/TxL"

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
  rm -rf         /opt/TxL/seed
  cp -rf         /opt/backup/*               /opt/TxL/seed
  rm -rf         /opt/backup

fi





if [ $MOUNT == "yes" ];then
  umount /dev/sda
fi


  echo "Done."
