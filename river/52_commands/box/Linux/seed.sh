#!/bin/bash

echo "..."

address=/opt/TxL/seed

addres2=$addres/flower.c

cat  $address/box/c/head/Linux.h                       >> $addres2
cat  $address/box/c/head/variable.h                    >> $addres2

cat  $address/box/c/dirent/is.h                        >> $addres2
cat  $address/box/c/file/is.h                          >> $addres2
cat  $address/box/c/file/get.h                         >> $addres2
cat  $address/box/c/file/save.h                        >> $addres2
cat  $address/box/c/file/append.h                      >> $addres2
cat  $address/box/c/commandline/shell.h                >> $addres2

cat  $address/watchdog/load/configure.h                >> $addres2

cat  $address/network/message/command/action/seed.h    >> $addres2
cat  $address/network/message/command/action/flower.h  >> $addres2

cat  $address/box/c/head/seed.h                        >> $addres2


gcc  $addres2 -o $address/../../?
rm   $addres2

echo "Over."
