#!/bin/bash

echo '...'

echo "GET STANDARD"
bash /opt/7lc/box/Linux/net.sh
echo "GET ALSA"
bash /opt/7lc/box/Linux/alsa.sh

#wget ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.3.tar.bz2
#tar -xjf alsa-lib-1.1.3.tar.bz2


name=`uname -n`

if   [ $name == "raspberrypi" ];then
  echo "ADD INIT.."

  rm /etc/init.d/TxL
  rm /etc/rc3.d/S05TxL
  rm /etc/rc5.d/S05TxL
  rm /etc/rc6.d/K05TxL

  cp /opt/TxL          /etc/init.d/TxL
  ln /etc/init.d/TxL /etc/rc3.d/S05TxL
  ln /etc/init.d/TxL /etc/rc5.d/S05TxL
  ln /etc/init.d/TxL /etc/rc6.d/K05TxL


elif   [ $name == "ubuntu" ];then
  echo "ADD INIT.."

  rm /etc/init.d/TxL
  rm /etc/rc3.d/S05TxL
  rm /etc/rc5.d/S05TxL
  rm /etc/rc6.d/K05TxL

  cp /opt/TxL          /etc/init.d/TxL
  ln /etc/init.d/TxL /etc/rc3.d/S05TxL
  ln /etc/init.d/TxL /etc/rc5.d/S05TxL
  ln /etc/init.d/TxL /etc/rc6.d/K05TxL




elif   [ $name == "beaglebone" ];then
  echo "INIT DESTROY NETWORK."

elif [ $name == "dragino-129ff8" ];then

  echo 'THERE IS NO g++...'
  cp /opt/7lc/water/box/python/leaf.py ./TxL.py
  echo "GET PYTHON.."

else
  echo "THIS IS A NEW FEVICE."
fi

echo 'OVER.'
