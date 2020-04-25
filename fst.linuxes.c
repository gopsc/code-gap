/*

wget   ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.5.tar.bz2

tar   -xjf   alsa-lib-1.1.5.tar.bz2


cc   /opt/TxL/flower.c   (-std=c++0x)   -lm   -lpthead   (-lasound)   (-lwiringpi)   -o ?

*/







#include <stdlib.h>
                               // for null
                               // for __uint8_t, __uint16_t, __uint32_t, __uint64_t
                               //
                               // for malloc(), realloc(), free()



#include <stdio.h>
                              // for null
                              // for __uint8_t, __uint16_t, __uint32_t, __uint64_t
                              //
                              // for printf()
                              //
                              // for remove()
                              //
                              // for type FILE
                              // for fopen()
                              // for fclose()
                              // for fgets()
                              // for fprintf()

/*




#include <math.h>
                               // for pi
                               // for trigonometric function



#include <time.h> // for time(NULL)



#include <dirent.h> // for dirent



#include <ifaddrs.h> // for network socket

#include <fcntl.h> // for ...



#include <signal.h> // for check_deamon() ->
                               // for tcp block out.



#include <pthread.h> // for thread







#include <unistd.h>



*/

#include <sys/stat.h>
                                  // for struct stat
                                  // for lstat()
                                  // for S_ISDIR()
                                  // for S_ISREG()
                                  //
                                  // for mkdir()
                                  // for S_IRWXU, S_IRWXG, S_IROTH, S_IXOTH

/*






#include <sys/time.h>
                                   // for note_save() -> gettimeofday()



#include <sys/types.h>
                                    // for check_deamon() ->

#include <sys/param.h>
                                    // for ...



#include <arpa/inet.h>
                                    // for network

#include <sys/socket.h>
                                    // for network -> socket

*/





#include "./intros.notes"

#include "./skies/intros.notes"

#include "./rivers/intros.notes"

#include "./trees/intros.notes"

#include "./roots/intros.notes"

#include "./branches/intros.notes"




#include "./roots/threads/prepare.bases"

#include "./roots/threads/begin.bases"

#include "./roots/threads/end.bases"



#include "./roots/lakes/prepare.bases"


#include "./roots/lakes/waves/create.bases" // variable in mast be null

#include "./roots/lakes/waves/resize.bases" // variable in mast be not null; may lost when it fail 

#include "./roots/lakes/waves/free.bases" // variable in mast be not null; may lost when it fail


#include "./roots/lakes/stones/copy.bases"

#include "./roots/lakes/stones/append.bases"

#include "./roots/lakes/stones/measure.bases"

#include "./roots/lakes/stones/compare.bases"

#include "./roots/lakes/stones/find.bases"



#include "./roots/trees/remove.computers"


#include "./roots/trees/dirents/is.linuxes" // note_structure

#include "./roots/trees/dirents/create.linuxes"


#include "./roots/trees/files/is.linuxes" // note_structure

#include "./roots/trees/files/write.computers" // note_files

#include "./roots/trees/files/read.computers" // note_files; can't return failed; may pre-memory small




#include "./branches/threads/prepare.bases"

#include "./branches/threads/begin.bases"

#include "./branches/threads/end.bases"



#include "./branches/lakes/prepare.bases"

#include "./branches/lakes/begin.bases" // complication transform

#include "./branches/lakes/end.bases" // complication transform


#include "./branches/lakes/waves/write.bases" // complication transform

#include "./branches/lakes/waves/drop.bases" // complication transform

#include "./branches/lakes/waves/fish.bases" // complication transform



#include "./branches/lakes/bubbles/begin.bases" // ( below here ) used but don't need to include

#include "./branches/lakes/bubbles/end.bases"

//

#include "./branches/trees/dirents/is.linuxes"

#include "./branches/trees/dirents/create.linuxes" // char; success when it pass files with a same name

#include "./branches/trees/dirents/remove.linuxes"


#include "./branches/trees/files/is.linuxes"

#include "./branches/trees/files/save.linuxes" // char; failed if it is a dirents, but success when it pass files with a names samed

#include "./branches/trees/files/get.linuxes"

#include "./branches/trees/files/remove.linuxes"




#include "./branches/flowers/seed.bases" // after roots

#include "./roots/flowers/seed.computers" // int main(); at last