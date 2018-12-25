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

elif [ -d "/media/${user}/GOP/" ];then
  address="/media/${user}/GOP/"
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
  echo "Unknow.."
  address="unknow"

fi
if [ $address != "unknow" ];then
  echo "..."


  tar zcvf ./ravens.tar.gz ravens

  sudo cp ./ravens.tar.gz        ${address}
  sudo cp ./ravens/load.sh       ${address}

  rm ravens.tar.gz

fi


