#!/bin/bash


addres2=/opt/7lc
address=$addres2/flower.cpp

cat $addres2/box/c++/7lc/Linux.cpp                                       >> $address

cat $addres2/memory/configure/public.h                                   >> $address
cat $addres2/memory/configure/Linux.h                                    >> $address

cat $addres2/box/c++/file/get.h                                          >> $address
cat $addres2/box/c++/file/save.h                                         >> $address
cat $addres2/box/c++/file/append.h                                       >> $address
cat $addres2/box/c++/file/is.h                                           >> $address
cat $addres2/box/c++/dir/is.h                                            >> $address
cat $addres2/box/c++/delay/Linux.h                                       >> $address
cat $addres2/box/c++/cmd/shell.h                                         >> $address

cat $addres2/mind/watchdog/information/build.h                           >> $address
cat $addres2/mind/watchdog/information/public/time/build.h               >> $address
cat $addres2/mind/watchdog/information/public/calculate/build.h          >> $address
cat $addres2/mind/watchdog/information/Linux/system/name.h               >> $address
cat $addres2/mind/watchdog/information/Linux/system/build.h              >> $address
cat $addres2/mind/watchdog/information/Linux/ip/build.h                  >> $address
cat $addres2/mind/watchdog/information/Linux/memory/build.h              >> $address
cat $addres2/mind/watchdog/information/Linux/cpu/INFORMATION.h           >> $address
cat $addres2/mind/watchdog/information/Linux/cpu/rate.h                  >> $address
cat $addres2/mind/watchdog/information/Linux/cpu/temperature.h           >> $address
cat $addres2/mind/watchdog/information/Linux/cpu/f.h                     >> $address
cat $addres2/mind/watchdog/information/Linux/cpu/cores.h                 >> $address
cat $addres2/mind/watchdog/information/Linux/cpu/build.h                 >> $address
cat $addres2/mind/watchdog/information/Linux/sound/build.h               >> $address
cat $addres2/mind/watchdog/information/public/get/build.h                >> $address

cat $addres2/mind/calculate/sound/control.h                              >> $address


cat $addres2/memory/note/save.h                                          >> $address
cat $addres2/memory/note/append.h                                        >> $address

cat $addres2/sound/build.h                                               >> $address
cat $addres2/sound/ft/dft.h                                              >> $address
cat $addres2/sound/ft/fft.h                                              >> $address
cat $addres2/sound/ft/test.h                                             >> $address
cat $addres2/sound/ft/show.h                                             >> $address
cat $addres2/sound/alsa/corde.h                                         >> $address

cat $addres2/net/build.h                                                 >> $address
cat $addres2/net/message/code/blank.h                                    >> $address
cat $addres2/net/message/update/build.h                                  >> $address
cat $addres2/net/message/update/mix.h                                    >> $address
cat $addres2/net/message/control/build.h                                 >> $address
cat $addres2/net/connection/server.h                                     >> $address
cat $addres2/net/connection/client.h                                     >> $address

cat $addres2/mind/watchdog/check/net.h                                   >> $address
cat $addres2/mind/watchdog/check/power.h                                 >> $address
cat $addres2/mind/watchdog/check/reboot.h                                >> $address
cat $addres2/mind/watchdog/check/ssh.h                                   >> $address
cat $addres2/mind/watchdog/show/build.h                                  >> $address
cat $addres2/mind/watchdog/dog.h                                         >> $address
cat $addres2/mind/build.h                                                >> $address

g++ $address -lpthread -lasound -std=c++0x -o $addres2/../TxL
rm  $address
