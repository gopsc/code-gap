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



#include <pthread.h> // for thread



#include <signal.h> // for check_deamon() ->
                               // for tcp block out.






#include <unistd.h>




#include <sys/time.h>
                                   // for note_save() -> gettimeofday()

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

#include <sys/socket.h>
                                      // for network -> socket



#include <sys/types.h>
                                    // for check_deamon() ->

#include <sys/param.h>
                                      // for ...



#include <arpa/inet.h>
                                    // for network

*/





#include "./intros.computer"

#include "./skies/intros.computer"

#include "./rivers/intros.computer"

#include "./trees/intros.computer"

#include "./roots/intros.computer"

#include "./branches/intros.computer"

//


#include "./roots/threads/prepare.computer"

#include "./roots/threads/begin.computer"

#include "./roots/threads/end.computer"



#include "./roots/lakes/prepare.computer"


#include "./roots/lakes/waves/create.computer"

#include "./roots/lakes/waves/resize.computer"

#include "./roots/lakes/waves/free.computer"


#include "./roots/lakes/stones/copy.computer"

#include "./roots/lakes/stones/append.computer"

#include "./roots/lakes/stones/measure.computer"

#include "./roots/lakes/stones/compare.computer"

#include "./roots/lakes/stones/find.computer"



#include "./roots/trees/remove.computer"


#include "./roots/trees/dirents/is.linux" // note_structure

#include "./roots/trees/dirents/create.linux"


#include "./roots/trees/files/is.linux" // note_structure

#include "./roots/trees/files/write.computer" // note_files

#include "./roots/trees/files/read.computer" // note_files




#include "./branches/threads/prepare.computer"

#include "./branches/threads/begin.computer"

#include "./branches/threads/end.computer"



#include "./branches/lakes/prepare.computer"

#include "./branches/lakes/begin.computer"

#include "./branches/lakes/end.computer"


#include "./branches/lakes/waves/write.computer"

#include "./branches/lakes/waves/drop.computer"

#include "./branches/lakes/waves/fish.computer"



#include "./branches/lakes/bubbles/begin.computer" // ( below here ) use but don't need to include

#include "./branches/lakes/bubbles/end.computer"



#include "./branches/trees/dirents/is.linux"

#include "./branches/trees/dirents/create.linux"

#include "./branches/trees/dirents/remove.linux"


#include "./branches/trees/files/is.linux"

#include "./branches/trees/files/save.linux"

#include "./branches/trees/files/get.linux"

#include "./branches/trees/files/remove.linux"




#include "./branches/flowers/seed.linux"