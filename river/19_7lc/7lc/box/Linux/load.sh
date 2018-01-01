#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
address="/dev/sda1/load.sh"

echo "Name    : $name"

if [ $name != "dragino-129ff8" ];then
  user=`whoami`
  address="/media/${user}/gop/"
  echo "User    : $user"
fi




if [ -d $address ];then
  echo "Address : $address"

elif [ -d "/media/gop/GOP/" ];then
  address="/media/gop/GOP/"

elif [ -d "/media/gop/gop/" ];then
  address="/media/gop/gop/"

elif [ -d "/media/${user}/GOP/" ];then
  address="/media/${user}/GOP/"
  echo "Address : $address"
elif [ -d "/media/${user}/gop/" ];then
  address="/media/${user}/gop/"
  echo "Address : $address"

elif [ $name == "beagleboard" ];then
  echo "beagleboard"
  address="/media"
  mount /dev/sda1 /media

elif [ $name == "beaglebone" ];then
  echo "beaglebone"
  address="/media"
  mount /dev/sda1 /media

elif [ $name == "raspberrypi" ];then
  echo "raspberrypi"
  address="/media"
  mount /dev/sda1 /media

elif [ $name == "orangepilite" ];then
  echo "orangepilite"
  address="/media"
  mount /dev/sda1 /media

elif [ $name == "dragino-129ff8" ];then
  echo "dragino"
  address="/mnt/sda1"

else
  echo "Unknow.."
  address="unknow"

fi
if [ $address != "unknow" ];then
  echo "..."

  rm -rf         /opt/7lc
  cp             ${address}/7lc.tar.gz    /opt
  tar zxf        /opt/7lc.tar.gz
  mv             ./7lc                    /opt
  rm             /opt/7lc.tar.gz
  echo "Done."
fi
