

#/bin/bash

#simple script to list version number of critical development tools




echo

echo




export LV_ALL=C

bash --version | head -n1 | cut -d" " -f2-4


MYTH=$(readlink -f /bin/sh)

echo "/bin/sh -> $MYTH"

echo $MYTH | grep -q bash || echo "ERROR: /bin/sh dose not point to bash"

unset MYTH




echo

echo




echo -n "Binutils: "; ld --version | head -n1 | cut -d" " -f3-




echo

echo




bison --version | head -n1


if [ -h /usr/bin/yacc ]; then
  echo "/usr/bin/yacc -> `readlink -f /usr/bin/yacc`";

elif [ -x /usr/bin/yacc ]; then
  echo yacc is `/usr/bin/yacc --version | head -n1`

else
  echo "yacc not found"

fi




echo

echo




bzip2 --version 2>&1 < /dev/null | head -n1 | cut -d" " -f1,6-




echo

echo




echo -n "coreutils: "; chown --version | head -n1 | cut -d")" -f2




echo

echo




diff --version | head -n1




echo

echo




find --version | head -n1




echo

echo




gawk --version | head -n1


if [ -h /usr/bin/awk ]; then
  echo "/usr/bin/awk -> `readlink -f /usr/bin/awk`";

elif [ -x /usr/bin/awk ]; then
  echo awk is `/usr/bin/awk --version | head -n1`

else
  echo "awk not found"

fi




echo

echo




gcc --version | head -n1


g++ --version | head -n1




echo

echo




ldd --version | head -n1 | cut -d" " -f2- # glibc version




echo

echo




grep --version | head -n1




echo

echo




gzip --version | head -n1




echo

echo




cat /proc/version




echo

echo




m4 --version | head -n1




echo

echo




make --version | head -n1




echo

echo




patch --version | head -n1




echo

echo




echo Perl `perl -V:version`




echo

echo




python3 --version




echo

echo




sed --version | head -n1




echo

echo




tar --version | head -n1




echo

echo




makeinfo --version | head -n1  # texinfo version




echo

echo




xz --version | head -n1




echo

echo




echo 'int main () {}' > dummy.c && g++ -o dummy dummy.c


if [ -xdummy ]
  then echo "g++ compilation ok";

else
  echo "g++ compilation failed";

fi


rm -f dummy.c dummy




echo

echo




