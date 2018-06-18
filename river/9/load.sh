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

elif [ $name = "Beaglebone" ];then
  echo "beaglebone"
  address="/media/"

elif [ $name = "raspberrypi" ];then
  echo "raspberrypi"
  address="/media/"

else
  echo "Unknow.."
  address="unknow"

fi
if [ $address != "unknow" ];then
  echo "go.."
  cp ${address}seed.cpp                 ./
  cp ${address}box.cpp                  ./
  cp ${address}info.cpp                 ./
  cp ${address}net.cpp                  ./
  cp ${address}mind.cpp                 ./
  cp ${address}sound-alsa.c             ./

  cp ${address}save.sh                  ./
  cp ${address}load.sh                  ./
fi
