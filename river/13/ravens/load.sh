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

  sudo rm -rf         /opt/ravens
  sudo cp             ${address}/ravens.tar.gz    /opt/
  sudo tar zxvf       /opt/ravens.tar.gz
  sudo cp -rf         ./ravens /opt
  sudo rm -rf         ./ravens
  sudo rm             /opt/ravens.tar.gz
  echo "Done."
fi













