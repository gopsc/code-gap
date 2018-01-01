#!/bin/bash

echo '...'

echo "GET STANDARD"
bash /opt/gop/seed/box/Linux/net.sh
echo "GET ALSA"
bash /opt/gop/seed/box/Linux/alsa.sh



name=`uname -n`

if   [ $name == "raspberrypi" ];then
  echo "ADD INIT.."
  bash /opt/gop/seed/box/Linux/init.sh

elif [ $name == "ubuntu" ];then
  echo "ADD INIT.."
  bash /opt/gop/seed/box/Linux/init.sh

elif [ $name == "Orangepi" ];then
  echo "ADD INIT.."
  bash /opt/gop/seed/box/Linux/init.sh



elif   [ $name == "beaglebone" ];then
  echo "INIT DESTROY NETWORK."


else
  echo "THIS IS A NEW FEVICE."
fi

echo 'OVER.'
