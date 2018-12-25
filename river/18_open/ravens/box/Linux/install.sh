#!/bin/bash

echo '...'

echo 'GET NET'
bash /opt/ravens/box/Linux/net.sh

echo 'GET ALSA'
bash /opt/ravens/box/Linux/alsa.sh

name=`uname -n`

if   [ $name == "beaglebone" ];then
  echo "INIT DESTROY NETWORK."


elif [ $name == "dragino-129ff8" ];then

  echo 'Does not suppose g++...'
  cp ./ravens/water/box/python/leaf.py ./gopi.py
  echo "Get python."

else
    echo "Add init.."

    rm /etc/init.d/gopi
    rm /etc/rc3.d/S05gopi
    rm /etc/rc5.d/S05gopi
    rm /etc/rc6.d/K05gopi

    cp ./gopi           /etc/init.d/gopi
    ln /etc/init.d/gopi /etc/rc3.d/S05gopi
    ln /etc/init.d/gopi /etc/rc5.d/S05gopi
    ln /etc/init.d/gopi /etc/rc6.d/K05gopi
fi

echo "Over."
