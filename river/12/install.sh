#!/bin/bash

sudo g++ ./ravens/seed.cpp -lpthread -lasound -std=c++0x -o gopi

sudo rm /etc/rc3.d/S06gopi

sudo rm /etc/rc5.d/S06gopi

sudo rm /etc/rc6.d/K06gopi


sudo cp ./gopi           /etc/init.d/gopi
sudo ln /etc/init.d/gopi /etc/rc3.d/S06gopi
sudo ln /etc/init.d/gopi /etc/rc5.d/S06gopi
sudo ln /etc/init.d/gopi /etc/rc6.d/K06gopi


