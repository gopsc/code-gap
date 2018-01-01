#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
address="/dev/sda1/load.sh"

echo "Name    : $name"

if [ $name != 'dragino-129ff8' ];then
  user=`whoami`
  address="/media/${user}/gop/"
  echo "User    : $user"
fi





if [ -d $address ];then
  echo "Address : $address"

elif [ -d "/media/gop/gop/" ];then
  address="/media/gop/gop/"
  echo "Address : $address"

elif [ -d "/media/gop/GOP/" ];then
  address="/media/gop/GOP/"
  echo "Address : $address"

elif [ $name == "beagleboard" ];then
  echo "beagleboard"
  address="/media"
  sudo mount /dev/sda1 /media

elif [ $name == "beaglebone" ];then
  echo "beaglebone"
  address="/media"
  mount /dev/sda1 /media

elif [ $name == "raspberrypi" ];then
  echo "raspberrypi"
  address="/media"
  mount /dev/sda1 /media

elif [ $name == "dragino-129ff8" ];then
  echo "dragino"
  address="/mnt/sda1"

elif [ $name == "orangepilite" ];then
  echo "orangepilite"
  address="/media"
  mount /dev/sda1 /media

else
  echo "No gopUSB device."
  address="unknow"

fi
if [ $address != "unknow" ];then
  echo "..."

  cp  -rf  /opt/ravens               ./
  tar zcf  ./ravens.tar.gz        ravens
  cp       ./ravens.tar.gz        ${address}
  cp       /opt/ravens/box/Linux/load.sh       ${address}

  rm -rf   ./ravens
  rm       ./ravens.tar.gz

  echo "Done."
fi

