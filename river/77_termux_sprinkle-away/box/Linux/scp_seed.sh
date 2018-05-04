



if [ $# -lt 1 ]; then

   echo ''
   echo ' Please type [user@ip] to update.'
   echo ''

   exit 1

fi


path=$2

if [ -f $path/build.c ]; then

   if [ -d seed ]; then
      rm -rf seed
   fi

   scp -r $1:$path ./

   rm  -rf  $path
   mv  seed $path

fi
