

# include <stdio.h>
# include <stdlib.h>

//# include <unistd.h>

//# include <math.h>
//# include <string.h>
//# include <time.h>       // for time ( NULL )




//# include <ifaddrs.h>
//# include <fcntl.h>

//# include <dirent.h>     // for dirent


//# include <pthread.h>    // for thread


//# include <signal.h>     // for check_deamon() ->
                        // for tcp block out.

//# include <sys/time.h>   // for note_save() -> gettimeofday()

//# include <sys/socket.h> // for network -> socket

# include <sys/stat.h>

//# include <sys/types.h>  // for check_deamon() ->
//# include <sys/param.h>  // for ...

//# include <arpa/inet.h>  // for network










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























/*

 check seed   <-

 read seed

 drop note

 save flower

*/



 printf ( " check seed ... " );










 void  *  note_status;

 note_status  =  malloc (
                          sizeof ( struct stat )
                        );








 if (

      lstat (

                              "seed/seed",
             ( struct stat * ) note_status

            ) != 0

    )




  {

 printf ( "%s", "can't find seed \n" );

 return -1;

  }








 free ( note_status );


 printf ( "done \n" );





















/*

 check seed

 read seed   <-

 drop note

 get flower

*/



 printf ( " read seed ... " );







 char * note_flower = malloc ( 1 );

 int note_number = 0;

 char note_words [ 128 ];


 FILE * note_file;











 note_file  =  fopen ( "seed/seed", "r" );



 while (

         fgets ( note_words, 128, note_file ) != NULL

       )

  {


 printf ( "test 1 \n" );

 note_number += strlen ( note_words ) ;

 printf ( "test 2 \n" );

 note_flower = realloc ( note_flower, note_number );

 printf ( "test 3 \n" );

 strcat ( note_flower, note_words );

 printf ( "test 4 \n" );

  }


 printf ( "%d \n %d \n", strlen ( note_flower ), note_number );






 printf ( "done \n" );


















/*

 check seed

 read seed

 drop note <-

 save flower

*/



 char note_word [ 2 ] [ 16 ];

 strcpy ( note_word [ 0 ], "#" );

 strcpy ( note_word [ 1 ], "//" );


















 free ( note_flower );




 printf ( "%s", "Over.\n" );



 return 0;


  }
