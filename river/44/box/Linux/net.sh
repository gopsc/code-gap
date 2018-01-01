#!/bin/bash


addres2=/opt/?
address=$addres2/flower.cpp

cat $addres2/box/c/head/Linux.cpp                                        >> $address
cat $addres2/box/c/head/variable.h                                       >> $address




cat $addres2/watchdog/information/build.h                                >> $address
cat $addres2/network/build.h                                             >> $address
cat $addres2/sound/build.h                                               >> $address

cat $addres2/box/c/dir/is.h                                              >> $address
cat $addres2/box/c/file/is.h                                             >> $address
cat $addres2/box/c/file/get.h                                            >> $address
cat $addres2/box/c/file/save.h                                           >> $address
cat $addres2/box/c/file/append.h                                         >> $address
cat $addres2/box/c/cmd/shell.h                                           >> $address


cat $addres2/watchdog/note/save.h                                        >> $address
cat $addres2/watchdog/note/clear.h                                       >> $address
cat $addres2/watchdog/information/system/user.h                          >> $address
cat $addres2/watchdog/information/system/name.h                          >> $address
cat $addres2/watchdog/information/system/build.h                         >> $address
cat $addres2/watchdog/information/ip/build.h                             >> $address
cat $addres2/watchdog/information/cpu/status.h                           >> $address
cat $addres2/watchdog/information/cpu/rate.h                             >> $address
cat $addres2/watchdog/information/cpu/temperature.h                      >> $address
cat $addres2/watchdog/information/cpu/frequency.h                        >> $address
cat $addres2/watchdog/information/cpu/cores.h                            >> $address
cat $addres2/watchdog/information/cpu/build.h                            >> $address
cat $addres2/watchdog/information/memory/build.h                         >> $address
cat $addres2/watchdog/information/disk/build.h                           >> $address
cat $addres2/watchdog/information/sound/alsa.h                           >> $address
cat $addres2/watchdog/information/get/build.h                            >> $address

cat $addres2/watchdog/check/network.h                                    >> $address
cat $addres2/watchdog/check/power.h                                      >> $address
cat $addres2/watchdog/check/ssh.h                                        >> $address
cat $addres2/watchdog/check/root.h                                       >> $address
cat $addres2/watchdog/load/configure.h                                   >> $address
cat $addres2/watchdog/load/listen.h                                      >> $address
cat $addres2/watchdog/show/information.h                                 >> $address
cat $addres2/watchdog/dog.h                                              >> $address

cat $addres2/network/message/code/blank.h                                >> $address
cat $addres2/network/message/control/information/put.h                   >> $address
cat $addres2/network/message/control/information/get.h                   >> $address
cat $addres2/network/message/control/update/build.h                      >> $address
cat $addres2/network/message/control/update/mix.h                        >> $address
cat $addres2/network/message/control/judgement/hello.h                   >> $address
cat $addres2/network/message/control/judgement/who.h                     >> $address
cat $addres2/network/message/control/judgement/recived.h                 >> $address
cat $addres2/network/message/control/judgement/sopi.h                    >> $address

cat $addres2/network/message/control/command/library/help.h              >> $address
cat $addres2/network/message/control/command/library/connect.h           >> $address
cat $addres2/network/message/control/command/library/message.h           >> $address
cat $addres2/network/message/control/command/library/quit.h              >> $address
cat $addres2/network/message/control/command/library/save.h              >> $address
cat $addres2/network/message/control/command/library/load.h              >> $address
cat $addres2/network/message/control/command/library/test.h              >> $address
cat $addres2/network/message/control/command/library/test_alsa.h         >> $address
cat $addres2/network/message/control/command/library/install.h           >> $address
cat $addres2/network/message/control/command/library/remove.h            >> $address
cat $addres2/network/message/control/command/library/show.h              >> $address
cat $addres2/network/message/control/command/library/sound.h             >> $address
cat $addres2/network/message/control/command/library/show_sound.h        >> $address
cat $addres2/network/message/control/command/library/sopi.h              >> $address
cat $addres2/network/message/control/command/library/update.h            >> $address
cat $addres2/network/message/control/command/library/test_dft.h          >> $address
cat $addres2/network/message/control/command/library/test_fft.h          >> $address
cat $addres2/network/message/control/command/library/reload_configure.h  >> $address
cat $addres2/network/message/control/command/library/reload_listen.h     >> $address
cat $addres2/network/message/control/command/library/command.h           >> $address
cat $addres2/network/message/control/command/library/who_is_that.h       >> $address
cat $addres2/network/message/control/command/library/smile.h             >> $address
cat $addres2/network/message/control/command/library/else.h              >> $address
cat $addres2/network/message/control/command/build.h                     >> $address
cat $addres2/network/message/control/build.h                             >> $address

cat $addres2/network/tcp/server.h                                        >> $address
cat $addres2/network/tcp/client.h                                        >> $address

#cat $addres2/sound/ft/show.h                                             >> $address
#cat $addres2/sound/ft/dft.h                                              >> $address
#cat $addres2/sound/ft/fft.h                                              >> $address
#cat $addres2/sound/ft/test.h                                             >> $address
#cat $addres2/sound/listen/save.h                                         >> $address
#cat $addres2/sound/corde/blank/build.h                                   >> $address





cat $addres2/build.h                                                     >> $address

gcc $address -lpthread -o $addres2/../TxL
rm  $address
