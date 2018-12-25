#!/bin/bash

echo "..."

address=./TxL/seed

addres2=$address/flower.c

cat  $address/box/c/head/Linux.h                       >> $addres2
cat  $address/box/c/head/variable.h                    >> $addres2

cat  $address/watchdog/information/build.h             >> $addres2
cat  $address/network/build.h                          >> $addres2 

cat  $address/box/c/dirent/is.h                        >> $addres2
cat  $address/box/c/file/is.h                          >> $addres2
cat  $address/box/c/file/get.h                         >> $addres2
cat  $address/box/c/file/save.h                        >> $addres2
cat  $address/box/c/file/append.h                      >> $addres2
cat  $address/box/c/output/print.h                     >> $addres2
cat  $address/box/c/commandline/shell.h                >> $addres2

cat  $address/watchdog/load/configure.h                >> $addres2

cat  $address/network/message/command/action/seed.h    >> $addres2
cat  $address/network/message/command/action/flower.h  >> $addres2

cat  $address/box/c/head/seed.c                        >> $addres2


gcc  $addres2 -o $address/../../?
rm   $addres2

echo "Over."
