#!/bin/bash

echo '...'

echo "GET STANDARD"
bash /opt/?/box/Linux/net.sh
echo "GET ALSA"
bash /opt/?/box/Linux/alsa.sh

#wget ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.3.tar.bz2
#tar -xjf alsa-lib-1.1.3.tar.bz2


name=`uname -n`

if   [ $name == "raspberrypi" ];then
  echo "ADD INIT.."
  bash /opt/?/box/Linux/init.sh

elif [ $name == "ubuntu" ];then
  echo "ADD INIT.."
  bash /opt/?/box/Linux/init.sh

elif [ $name == "Orangepi" ];then
  echo "ADD INIT.."
  bash /opt/?/box/Linux/init.sh



elif   [ $name == "beaglebone" ];then
  echo "INIT DESTROY NETWORK."


else
  echo "THIS IS A NEW FEVICE."
fi

echo 'OVER.'
