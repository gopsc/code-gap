

# include <stdio.h>
# include <stdlib.h>

//# include <unistd.h>

//# include <math.h>
# include <string.h>
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





/*

 must give it 3 blank site

 or it crush :<

*/

 void * note_flower = malloc ( 3 * sizeof ( char ) );

 void * note_number = malloc ( 1 * sizeof ( int ) );

 * ( int * ) note_number = 3;


 void * note_words = malloc ( 128 * sizeof ( char ) );

 void * note_file;











 note_file  =  fopen ( "seed/seed", "r" );



 while (
         NULL != fgets (
                         ( char * ) note_words,
                                    128,
                         ( FILE * ) note_file
                       )

       )

  {


 * ( int * ) note_number  +=  strlen (  ( char * ) note_words  );


 note_flower = realloc (
                           ( char * ) note_flower,
                         * ( int * )  note_number * sizeof ( char )
                       );


 strcat (
          ( char * ) note_flower,
          ( char * ) note_words
        );


  }






/*

 this for test

*/

/*

 printf (
          "\n %d \n %d \n",
           strlen (  ( char * ) note_flower  ),
         * note_number
        );

*/







/*

 it use flower

 and that will be free at last

*/

 free ( note_number );

 free ( note_words );

 fclose (  ( FILE * ) note_file  );


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
