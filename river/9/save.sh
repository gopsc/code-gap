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
elif [$name = "Beaglebone"];then
  echo "beaglebone"
  address="/media"
  mount /dev/sda1 $media
elif [$name = "raspberrypi"];then
  echo "raspberrypi"
  address="/media"
  mount /dev/sda1 $media

else
  echo "Unknow.."
  address="unknow"

fi
if [ $address != "unknow" ];then
  echo $address
  cp ./seed.cpp     ${address}
  cp ./box.cpp      ${address}
  cp ./info.cpp     ${address}
  cp ./net.cpp      ${address}
  cp ./mind.cpp     ${address}              
  cp ./sound-alsa.c ${address}             

  cp ./save.sh      ${address}
  cp ./load.sh      ${address}
fi
