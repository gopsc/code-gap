#!/bin/bash
   
sudo cat /opt/ravens/seed.cpp                          >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/water/configure/configure.h       >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/water/box/flag.h       >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/c++/words/words.h       >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/c++/dir/dir.h          >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/c++/file/get.h         >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/c++/file/save.h        >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/c++/file/append.h      >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/c++/time/time.h         >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/c++/ip/address.h        >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/shell/shell.h     >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/system/name.h     >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/system/system.h   >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/memory/memory.h   >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/cpu/cpu.h         >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/water/box/Linux/cpu/box/INFORMATION.h         >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/cpu/box/rate.h                >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/cpu/box/temperature.h         >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/cpu/box/f.h                   >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/cpu/box/cores.h               >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/cpu/get.h                     >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/water/box/Linux/sound/sound.h     >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/box/Linux/sound/get.h                   >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/water/box/Linux/information.h     >> /opt/ravens/flower.cpp


sudo cat /opt/ravens/water/sound/configure.h           >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/sound/ft/dft.h              >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/sound/ft/fft.h              >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/sound/ft/show.h              >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/sound/alsa/corde.h    >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/water/net/configure.h                   >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/net/message/update/update.h     >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/net/message/control/control.h   >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/net/ipv4/server.h           >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/water/net/ipv4/client.h           >> /opt/ravens/flower.cpp


sudo cat /opt/ravens/suface/watchdog/check/net.h       >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/suface/watchdog/check/ssh.h       >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/suface/watchdog/show/show.h       >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/suface/watchdog/dog.h             >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/suface/window/window.h            >> /opt/ravens/flower.cpp

sudo cat /opt/ravens/suface/mind/command.h             >> /opt/ravens/flower.cpp
sudo cat /opt/ravens/suface/mind/mind.h                >> /opt/ravens/flower.cpp


sudo g++ /opt/ravens/flower.cpp -lpthread -lasound -std=c++0x -o /opt/gopi
sudo rm  /opt/ravens/flower.cpp




