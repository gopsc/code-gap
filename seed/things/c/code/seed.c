

#include <stdio.h>
#include <stdlib.h>

//#include <unistd.h>

//#include <math.h>
//#include <string.h>
//#include <time.h>       // for time ( NULL )




//#include <ifaddrs.h>
//#include <fcntl.h>

//#include <dirent.h>     // for dirent


//#include <pthread.h>    // for thread


//#include <signal.h>     // for check_deamon() ->
                        // for tcp block out.

//#include <sys/time.h>   // for note_save() -> gettimeofday()

//#include <sys/socket.h> // for network -> socket

#include <sys/stat.h>

//#include <sys/types.h>  // for check_deamon() ->
//#include <sys/param.h>  // for ...

//#include <arpa/inet.h>  // for network










/*

 make a seed

 to get gop

*/


int main ()


  {


/*

 load_hope ();

*/




 printf ( "%s", "seed starts...\n" );



/*

 action_seed ( "base" );


 action_flower ( "base" );

*/












 char * note_flower;

 FILE * note_file;


 char note_words [ 128 ];

 int note_number;











/*

 check seed   <-

 read seed

 save flower

*/


 struct stat note_status;



 if (

      lstat ( "seed/seed", & note_status  ) != 0

    )


  {

 printf ( "%s", "can't find seed \n" );

 return -1;

  }




























/*

 check seed

 read seed   <-

 get flower

*/




 note_flower = malloc ( 128 );

 note_number = 128;





 note_file  =  fopen ( "seed/seed", "r" );



 while (

         fgets ( note_words, 128, note_file ) != NULL

       )

  {

 note_number += 128;

 note_flower = realloc ( note_flower, note_number );

 strcat ( note_flower, note_words );

  }







 printf ( "%s \n", note_flower );












 printf ( "%s", "Over.\n" );



 return 0;


  }
