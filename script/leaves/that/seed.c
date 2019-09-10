















#include  <stdlib.h>

#include  <stdio.h>










int main ( int argc, char * argv [] )


{






















/*
    if ( here () )

    pthread_create (
                              & thread [ 0 ],
                                NULL,
                                dream,
                     ( void * ) gop [ 0 ] [ 1 ] [ 0 ] [ 0 ]
                   );
*/

















/*

 that . hope . number_hope = argc;

 that . hope . hope = argv;

 */
















/*

 init_deamon ();

*/














/*

 output_print ( "string", "\n" );

*/
















/*

 that . hope . thread  =  malloc (  3  *  sizeof ( pthread_t )  );

*/







/*

pthread_create (  & thread [ 1 ], NULL,  gop_dog,  NULL  );

pthread_create (  & thread [ 2 ], NULL,  gop_connectted,  NULL  );

pthread_create (  & thread [ 3 ], NULL,  gop_connector,  NULL  );

*/



/*

 pthread_create (  & thread [ 4 ], NULL,  gop_corde,  NULL  );

*/




































/*

char  note_command  [ 128 ]   =   "";

*/




















/*

while   (   !  gop_about . flag . start   )

{

gop_wait   (  0.1  );

}

*/









/*

if  (

                gop_about . flag . main

        &&  ( ! gop_about . flag . deamon )

    )

{



output_print   (   "string",   "\n we met somewhere \n\n"   );



}

*/














/*

note_save   (   "command",   "command start",   "now"   );

*/













// while ( gop_about . flag . main )

//  {





/*

 When it is deamon process,
 that goes   wrong.

*/

// if ( gop_about . flag . deamon )

//  {


// gop_wait ( 0.1 );


//  }





// else

//  {



/*

 Get the command



 128 charactors could be enough

*/


// fgets ( note_command, 128,  stdin );












/*

 Sometimes its goes wrong,
     just  return blank chars.


 if just key in enter it could return \n

*/


// if (

//      strcmp ( note_command, "" )  == 0

//    )

//  {


// gop_wait ( 0.1 );


//  }












/*

 Read the command

*/


// else

//  {



/*

 The end of the command
    will be a '\n'

*/

// note_command [  strlen ( note_command ) - 1  ]   =   '.';



/*

 we don't need to do that with this

 :)

*/


/*

 strcat ( buffer_command, "." );

*/



/*

 Print a '\n'

*/

// output_print ( "string", "\n" );






/*

 Judge for the command typed

*/


// judge_message_command (
//                         -1,
//                         note_command,
//                         note_command
//                       );



/*

 Clear the buffer

*/


// strcpy ( note_command, "" );







/*

 this round for if keyboard in

*/


//  }




/*

 this round for if not in deamon

*/

//  }






/*

 this round for flag of main

*/

//  }









/*

 The end of this program

*/



// note_save ( "command", "command close", "now" );



  }



