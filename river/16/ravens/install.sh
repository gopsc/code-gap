#!/bin/bash

sudo bash /opt/ravens/test.sh
sudo bash /opt/ravens/alsa.sh

sudo rm /etc/rc3.d/S06gopi
sudo rm /etc/rc5.d/S06gopi
sudo rm /etc/rc6.d/K06gopi

sudo cp /opt/gopi          /etc/init.d/gopi
sudo ln /etc/init.d/gopi /etc/rc3.d/S06gopi
sudo ln /etc/init.d/gopi /etc/rc5.d/S06gopi
sudo ln /etc/init.d/gopi /etc/rc6.d/K06gopi
sudo shutdown -r -t 60









