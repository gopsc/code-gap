#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
user=`whoami`
address="/media/${user}/gop/"
echo "Name : $name"
echo "User : $user"

if [ -d $address ];then
address="/media/${user}/gop/"
  echo "Address : $address"

elif [ -d "/media/gop/gop/" ];then
  address="/media/gop/gop/"
  echo "Address : $address"

elif [ -d "/media/gop/GOP/" ];then
  address="/media/gop/GOP/"
  echo "Address : $address"

elif [ $name == "beaglebone" ];then
  echo "beaglebone"
  address="/media"
  mount /dev/sda1 $media

elif [ $name == "raspberrypi" ];then
  echo "raspberrypi"
  address="/media"
  mount /dev/sda1 $media

else
  echo "No gopUSB device."
  address="unknow"

fi
if [ $address != "unknow" ];then
  echo "..."

  sudo cp -rf   /opt/ravens               ravens
  sudo tar zcvf /opt/ravens.tar.gz        ravens
  sudo cp       /opt/ravens.tar.gz        ${address}
  sudo cp       /opt/ravens/load.sh       ${address}

  sudo rm -rf   ravens
  sudo rm       /opt/ravens.tar.gz

fi











