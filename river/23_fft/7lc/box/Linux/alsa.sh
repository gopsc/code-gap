#!/bin/bash


addres2=/opt/7lc
address=$addres2/flower.cpp




cat $addres2/box/c++/head/Linux.cpp                                      >> $address







cat $addres2/memory/configure/build.h                                    >> $address

cat $addres2/mind/watchdog/information/build.h                           >> $address
cat $addres2/sound/build.h                                               >> $address
cat $addres2/net/build.h                                                 >> $address





cat $addres2/box/c++/file/get.h                                          >> $address
cat $addres2/box/c++/file/save.h                                         >> $address
cat $addres2/box/c++/file/append.h                                       >> $address
cat $addres2/box/c++/file/is.h                                           >> $address
cat $addres2/box/c++/dir/is.h                                            >> $address
cat $addres2/box/c++/delay/Linux.h                                       >> $address
cat $addres2/box/c++/cmd/shell.h                                         >> $address



cat $addres2/memory/note/save.h                                          >> $address



cat $addres2/mind/watchdog/information/time/build.h                      >> $address
cat $addres2/mind/watchdog/information/system/name.h                     >> $address
cat $addres2/mind/watchdog/information/system/build.h                    >> $address
cat $addres2/mind/watchdog/information/ip/build.h                        >> $address
cat $addres2/mind/watchdog/information/memory/build.h                    >> $address
cat $addres2/mind/watchdog/information/cpu/INFORMATION.h                 >> $address
cat $addres2/mind/watchdog/information/cpu/rate.h                        >> $address
cat $addres2/mind/watchdog/information/cpu/temperature.h                 >> $address
cat $addres2/mind/watchdog/information/cpu/f.h                           >> $address
cat $addres2/mind/watchdog/information/cpu/cores.h                       >> $address
cat $addres2/mind/watchdog/information/cpu/build.h                       >> $address
cat $addres2/mind/watchdog/information/sound/build.h                     >> $address
cat $addres2/mind/watchdog/information/get/build.h                       >> $address
cat $addres2/mind/watchdog/check/dirent.h                                >> $address
cat $addres2/mind/watchdog/check/net.h                                   >> $address
cat $addres2/mind/watchdog/check/power.h                                 >> $address
cat $addres2/mind/watchdog/check/reboot.h                                >> $address
cat $addres2/mind/watchdog/check/ssh.h                                   >> $address
cat $addres2/mind/watchdog/show/build.h                                  >> $address
cat $addres2/mind/watchdog/dog.h                                         >> $address

cat $addres2/sound/ft/show.h                                             >> $address
cat $addres2/sound/ft/dft.h                                              >> $address
cat $addres2/sound/ft/fft.h                                              >> $address
cat $addres2/sound/ft/test.h                                             >> $address
cat $addres2/sound/alsa/corde.h                                          >> $address

cat $addres2/net/message/code/blank.h                                    >> $address
cat $addres2/net/message/update/build.h                                  >> $address
cat $addres2/net/message/update/mix.h                                    >> $address
cat $addres2/net/message/control/build.h                                 >> $address
cat $addres2/net/connection/server.h                                     >> $address
cat $addres2/net/connection/client.h                                     >> $address

cat $addres2/mind/build.h                                                >> $address

g++ $address -lpthread -lasound -std=c++0x -o $addres2/../TxL
rm  $address
