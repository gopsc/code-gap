#!/bin/bash

address="./ravens/flower.cpp"

cd /opt


cat ./ravens/box/c++/7lc/Linux.cpp                 >> $address

cat ./ravens/information/configure/public.h        >> $address
cat ./ravens/information/configure/Linux.h         >> $address

cat ./ravens/box/c++/file/get.h         >> $address
cat ./ravens/box/c++/file/save.h        >> $address
cat ./ravens/box/c++/file/append.h      >> $address
cat ./ravens/box/c++/file/remove.h      >> $address
cat ./ravens/box/c++/file/is.h          >> $address
cat ./ravens/box/c++/dir/is.h           >> $address
cat ./ravens/box/c++/dir/path.h         >> $address
cat ./ravens/box/c++/dir/delete.h       >> $address
cat ./ravens/box/c++/delay/Linux.h      >> $address
cat ./ravens/box/c++/cmd/shell.h        >> $address

cat ./ravens/information/build.h                           >> $address

cat ./ravens/watchdog/note/save.h                          >> $address
cat ./ravens/watchdog/note/append.h                        >> $address

cat ./ravens/information/public/time/build.h               >> $address
cat ./ravens/information/Linux/system/name.h               >> $address
cat ./ravens/information/Linux/system/build.h              >> $address
cat ./ravens/information/Linux/ip/build.h                  >> $address
cat ./ravens/information/Linux/memory/build.h              >> $address
cat ./ravens/information/Linux/cpu/INFORMATION.h           >> $address
cat ./ravens/information/Linux/cpu/rate.h                  >> $address
cat ./ravens/information/Linux/cpu/temperature.h           >> $address
cat ./ravens/information/Linux/cpu/f.h                     >> $address
cat ./ravens/information/Linux/cpu/cores.h                 >> $address
cat ./ravens/information/Linux/cpu/build.h                 >> $address
cat ./ravens/information/Linux/sound/build.h               >> $address
cat ./ravens/information/public/get/build.h                >> $address

cat ./ravens/sound/build.h                 >> $address
cat ./ravens/sound/ft/dft.h                >> $address
cat ./ravens/sound/ft/fft.h                >> $address
cat ./ravens/sound/ft/show.h               >> $address
cat ./ravens/sound/blank/corde.h           >> $address

cat ./ravens/net/build.h                   >> $address
cat ./ravens/net/message/code/blank.h      >> $address
cat ./ravens/net/message/update/build.h    >> $address
cat ./ravens/net/message/control/build.h   >> $address
cat ./ravens/net/server.h                  >> $address
cat ./ravens/net/client.h                  >> $address

cat ./ravens/watchdog/check/net.h          >> $address
cat ./ravens/watchdog/check/power.h        >> $address
cat ./ravens/watchdog/check/reboot.h       >> $address
cat ./ravens/watchdog/show/build.h         >> $address
cat ./ravens/watchdog/dog.h                >> $address

cat ./ravens/mind/command.h                >> $address
cat ./ravens/mind/build.h                  >> $address

g++ ./ravens/flower.cpp -lpthread -std=c++0x -o ./gopi
rm  ./ravens/flower.cpp

cd
