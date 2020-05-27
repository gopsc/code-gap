

/*

cc   /opt/TxL/flower.c   (-std=c++0x)   (-lm)   (-lpthead)   (-lasound)   (-lwiringpi)   -o ?

*/






/*

.notes

( notes of c )


.bases

( base c grammars )

( base c functions )

( base c libraries )




.arduino

( not standard )

( arduino functions )

( arduino libraries )




.standards

( standard c functions )




.computers

( with libraries only on computers )




.linuxes

( with libraries only on linux system computers )


.windows

( with libraries only on windows system computers )




.wiringpi

( with libraries only on linux system computers and wiringpi )


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


#include <time.h>
                             // for time(NULL)



#include <signal.h>
                               // for check_deamon() ->
                               // for tcp block out.


#include <fcntl.h>
                              // for network socket









#include <dirent.h>
                              // for dirent


#include <ifaddrs.h>
                               // for network socket


#include <pthread.h>
                                // for thread









#include <arpa/inet.h>
                                    // for network


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


#include <sys/socket.h>
                                    // for network -> socket









#include <arduino.h>


#include <Wire.h>


#include <SPI.h>








#include <wiringpi.h>

*/






#include "./intros,first.notes"

#include "./intros,second.notes"


#include "./skies/intros,first.notes"

#include "./skies/intros,second.notes"


#include "./rivers/intros,first.notes"

#include "./rivers/intros,second.notes"


#include "./trees/intros,first.notes"

#include "./trees/intros,second.notes"


#include "./roots/intros.notes"


#include "./branches/intros.notes"


#include "./dreams/intros.notes"




#include "./roots/threads/prepare.bases"

#include "./roots/threads/begin.bases"

#include "./roots/threads/end.bases"



#include "./roots/lakes/prepare.bases"


#include "./roots/lakes/waves/create.bases" // may stuck when it fail

#include "./roots/lakes/waves/resize.bases" // may stuck when it fail

#include "./roots/lakes/waves/free.bases" // may error when it fail


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

#include "./roots/trees/files/read.computers" // note_files; not return failed; may buffer too small




#include "./branches/threads/prepare.bases"

#include "./branches/threads/begin.bases"

#include "./branches/threads/end.bases"



#include "./branches/lakes/prepare.bases"

#include "./branches/lakes/begin.bases"

#include "./branches/lakes/end.bases"


#include "./branches/lakes/waves/write.bases"

#include "./branches/lakes/waves/add.bases"

#include "./branches/lakes/waves/count.bases"

#include "./branches/lakes/waves/drop.bases"

#include "./branches/lakes/waves/fish.bases"

//
#include "./branches/lakes/bubbles/begin.bases"

#include "./branches/lakes/bubbles/end.bases"


#include "./branches/lakes/bubbles/moons/begin.bases"

#include "./branches/lakes/bubbles/moons/end.bases"


#include "./branches/lakes/bubbles/lights/begin.bases"

#include "./branches/lakes/bubbles/lights/end.bases"


#include "./branches/lakes/bubbles/threads/begin.bases"

#include "./branches/lakes/bubbles/threads/end.bases"


#include "./branches/lakes/forms/waters/abyss.bases"

#include "./branches/lakes/forms/waters/deeper.bases"



#include "./branches/trees/dirents/is.linuxes"

#include "./branches/trees/dirents/create.linuxes"

#include "./branches/trees/dirents/remove.linuxes"


#include "./branches/trees/files/is.linuxes"

#include "./branches/trees/files/save.linuxes"

#include "./branches/trees/files/get.linuxes"

#include "./branches/trees/files/remove.linuxes"




#include "./dreams/begin.bases"




#include "./branches/flowers/seed.bases"

#include "./roots/flowers/seed.standards" // int main(), return 0

