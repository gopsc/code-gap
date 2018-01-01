#!/bin/bash

echo "..."

address=./TxL/seed

addres2=$address/flower.c

cat  $address/box/c/head/Linux.h                       >> $addres2
cat  $address/box/c/head/variable.h                    >> $addres2

cat  $address/watchdog/information/build.h             >> $addres2
cat  $address/network/build.h                          >> $addres2

cat  $address/box/c/data/translate/number_word.h       >> $addres2
cat  $address/box/c/system/IO/output/print.h           >> $addres2
cat  $address/box/c/system/file-system/dirent/is.h     >> $addres2
cat  $address/box/c/system/file-system/file/is.h       >> $addres2
cat  $address/box/c/system/file-system/file/get.h      >> $addres2
cat  $address/box/c/system/file-system/file/save.h     >> $addres2
cat  $address/box/c/system/file-system/file/append.h   >> $addres2
cat  $address/box/c/system/process/commandline/shell.h >> $addres2

cat  $address/watchdog/load/configuration.h            >> $addres2

cat  $address/network/message/command/action/seed.h    >> $addres2
cat  $address/network/message/command/action/flower.h  >> $addres2

cat  $address/box/c/head/seed.c                        >> $addres2


gcc  $addres2 -o $address/../../?
rm   $addres2

echo "Over."
