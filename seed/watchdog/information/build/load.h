

int load_about (

                   gopi_about    that_about,

                   char *     pointer_convent

               ) {



/*

 the first loop set

 pointer_convent note this path

 pointer_next note the path last one of this line

 maybe blank pointer


 and note network address

 when read this, we read lines after this line

 read the address

*/





// start at next line

               pointer_convent   =  strchr ( pointer_convent, '\n' ) + 1;




// to the one last of this line

        char * pointer_next      =  strchr ( pointer_convent, '\n' )    ;






// start the set



/*

 first we clean it

 this come soon

*/

//        clean_about ( that_about [ that_site ] );







/*

 we've recived the message

 so it is running


 maybe we add it to clean


 ok but not

 sometimes we clean it for good and it haven't a connection

*/

        that_about [ that_site ] . flag . main   =  1;







/*

 if this isn't the end

 we read this, to the pointer of next

 and return it soon


 if it is, we read this

*/

        while (  strchr ( pointer_convent, '\n' )  !=  NULL  ) {

           * pointer_next = '\0';





/*

 went over the blank lines

 there're several blank lines make us easy to see their type

*/

            if      (  0  ==  strcmp ( pointer_convent, "" )  ) {

                ;}






// read the name of that

            else if (  pointer_convent == strstr ( pointer_convent, "Name             : " )  ) {


// it always start with a ':'

                strcpy (

                          that_about . system [ that_site ] . name,

                          strstr ( pointer_convent, " :" ) + 3

                       );}




// read system name

            else if (  pointer_convent == strstr ( pointer_convent, "System           : " )  ) {


                strcpy (
                          that_about . system [ that_site ] . system,

                          strstr ( pointer_convent, " :" ) + 3

                       );}




// read user name

            else if (  pointer_convent == strstr ( pointer_convent, "User             : " ) ) {


                strcpy (

                         that_about . system [ that_site ] . user,

                         strstr ( pointer_convent, " :" ) + 3

                       );}













            else if (  pointer_convent == strstr ( pointer_convent, "IP               : " ) ) {

/*

 why

 network address alway start with a number of them


 we used it to check address

 and could not to use it

 and make it clear

*/

                that_about . network [ that_site ] . number

                =  atoi (  strstr ( pointer_convent, " :"  ) + 3  );








// prepare





/*

 return the last one

 we will read next lines

 change the convent we've read

*/

               * pointer_next  =  '\n';




// start with next line

                 pointer_convent  =  strchr ( pointer_convent, '\n'  ) + 1;




/*

 to the last one


   address  :  2
       name : address
       name : address

   ...


 there're two blank type

*/

                 pointer_next  =  strstr ( pointer_next, "\n\n" );

               * pointer_next  =  '\0';







// prepare to read them



// the number of the address we've read

                int number_ip = 1;





/*

 this is to save the line we will read

 may null happened

 the pointer maybe last


 pointer of network will be used for return when this happened


 they has name and address one line

 and use this to find the path

*/

                char * pointer_network;





/*

 we read them line by line

 to the blank line

 then this is the last one

*/

                for (
                                       pointer_network    =           pointer_convent;
                        strcmp ( "\n", pointer_network ) !=  0 ;
                                       pointer_network    =  strchr ( pointer_convent, '\n' )
                    ) {


/*

 the pointer of network  we use it to  miss the null happened


 we fresh it first out of the loop

 after first set, we fresh the pointer of network

 in the loop


 but pointer we've read we've used  not


 if not, it isn't first line

 we fresh it

*/


                    if (  pointer_convent  !=  pointer_network  ) {


//  jump over the '\n'

                        pointer_network  =  pointer_network + 1;


// fresh the pointer we've read

                        pointer_convent  =  pointer_network;}







// prepare to note them






// start here


/*

 we should jump over the blank charactor


         name : address
    name-long : address

*/


                  while (  * pointer_convent  ==  ' ' )  ) {

                      pointer_convent ++;





// to here

                    pointer_network = strstr (  pointer_convent, " : " );

                    pointer_network =  '\0';



// note it

                    strcpy(

                            that_about . network [ that_site ] . ip [ number_ip ] [ 1 ],

                            pointer_convent

                          );

// return it

                  * pointer_network  =  ' ';










// the address start here



// the pointer of network  point  ' : '

                    pointer_convent  =  pointer_network + 3 );




// to here



// the last one of this line

                    pointer_network  =  strchr ( pointer_convent, '\n' );

                  * pointer_network  =  '\0';





// note the address

                    strcpy(

                            that_about . network [ that_site ] . ip [ number_ip ] [ 2 ],

                            pointer_convent

                          );



// return it

                  * pointer_network  =  '\0';




/*

 don't need to do this

 because we have fresh this when we had jumped to the address' beginning

*/

//                    pointer_convent = pointer_convent + 1;




// plus this count

                    number_ip ++;}




/*

 read address it is over

 clean it

 we clean them in  watchdog/information/build/clean.h  soon

*/

/*
                for ( ; number_ip <= 32; number_ip ++ ) {

                    if   ( strcmp ( that_about . network [ that_site ] . ip [ number_ip ] [ 2 ], "") != 0 ) {

                        strcpy (  that_about . network [ that_site ] . ip [ number_ip ] [ 2 ], ""  );}

                    else {

                        break;}}
*/



// read address number and them it is over

                }









// about cpu

            else if  (  pointer_convent  ==  strstr ( pointer_convent, "CPU cores        : " )  ) {

                that_about . cpu [ that_site ] . cores  =  atoi (  strstr ( pointer_convent, " :" )  + 3  );}


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "CPU frequency    : " )  ) {

                that_about . cpu [ that_site ] . frequency  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "CPU temperature  : " )  ) {

                that_about . cpu [ that_site ] . temperature  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "CPU rate         : " )  ) {

/*

 maybe there's a little \0

 and we could see

*/

              * strchr ( pointer_convent, '%' ) = '\0';

                that_about . cpu [ that_site ] . rate  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Memory total     : " )  ) {


                that_about . memory [ that_site ] . total  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Memory used rate : " )  ) {



              * strchr ( pointer_convent, '%' ) = '\0';

/*

 it goes wrong when rate send before the total

*/

                that_about . memory [ that_site ] . free

              = that_about . memory [ that_site ] . total

              *     (  100 -   atoi (  strstr ( pointer_convent, " :" ) + 3  )  )     / 100;}





            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Disk size        : " )  ) {


                that_about . disk [ that_site ] . size  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}




            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Disk user rate   : " )  ) {


              * strchr ( pointer_convent, '%' )  = '\0';


/*

 it went wrong when a message without a disk size 

 we should note this rate

*/

                that_about . disk [ that_site ] . available

              = that_about . disk [ that_site ] . size

              *   atoi (  strstr ( pointer_convent, " :" ) + 3  )   / 100;}




            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Sound control    : " )  ) {

                that_about . sound [ that_site ] . number_control  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Sound capture    : " )  ) {

                that_about . sound [ that_site ] . number_capture  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Sound playback   : " )  ) {

                that_about . sound [ that_site ] . number_playback  =  atoi (  strstr ( pointer_convent, " :" ) + 3  );}




            else if  (  pointer_convent  ==  strstr ( pointer_convent, "Status           : " )  ) {




// prepare

                pointer_convent  =  strstr ( pointer_convent, " :" ) + 3;


// dog,
// server,
// client,
// sound,
// daemon



                if      (  * pointer_convent == 'o'  ) {

                    that_about . flag [ that_site ] . dog  =  1;}

                else if (  * pointer_convent == ' '  ) {

                    that_about . flag [ that_site ] . dog  = 0;}


                pointer_convent ++;
                pointer_convent ++;


                if      (  * pointer_convent == 'o'  ) {

                    that_about . flag [ that_site ] . connectted = 1;}

                else if (  * pointer_convent == ' '  ) {

                    that_about . flag [ that_site ] . connectted = 0;}

                pointer_recv ++;
                pointer_recv ++;



                if      (  * pointer_convent == 'o'  ) {

                    that_about . flag [ that_site ] . connector = 1;}

                else if (  * pointer_convent == ' '  ) {

                    that_about . flag [ that_site ] . connector = 0;}


                pointer_recv ++;
                pointer_recv ++;



                if      (  * pointer_convent == 'o'  ) {

                    that_about . flag [ that_site ] . sound = 1;}

                else if (  * pointer_convent == ' '  ) {

                    that_about . flag [ that_site ] . sound = 0;}


                pointer_recv ++;
                pointer_recv ++;



                if      (  * pointer_convent == 'o'  ) {

                    that_about . flag [ that_site ] . deamon = 1;}

                else if (  * pointer_convent == ' '  ) {

                    that_about . flag [ that_site ] . deamon = 0;}}




// prepare for next loop

          * pointer_next = '\n';

            pointer_convent = pointer_next + 1;

            pointer_next = strchr ( pointer_convent, '\n' );}





// loop finished

        return 1;}
