#!/bin/bash

# "chmod 777" + file name
# let go

name=`uname -n`
user=`whoami`
address="/media/${user}/gop/"
echo "Name : $name"
echo "User : $user"

if [ -d $address ];then
  echo "Address : $address"

elif [ -d "/media/${user}/gop/" ];then
  address="/media/${user}/gop/"
  echo "Address : $address"

elif [ $name == "beaglebone" ];then
  echo "beaglebone"
  address="/media"
  sudo mount /dev/sda1 $media

elif [ $name == "raspberrypi" ];then
  echo "raspberrypi"
  address="/media"
  sudo mount /dev/sda1 $media

else
  echo "Unknow.."
  address="unknow"

fi
if [ $address != "unknow" ];then
  echo "..."

  rm -rf         ./ravens
  cp             ${address}/ravens.tar.gz    ./
  tar zxvf       ./ravens.tar.gz
  rm             ravens.tar.gz
fi


