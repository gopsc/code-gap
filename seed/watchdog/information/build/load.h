

int load_about (

                   gopi_about    that_about,

                   char *     pointer_content

               ) {



/*

 the first loop set

 pointer_content note this path

 pointer_next note the path last one of this line

 maybe blank pointer


 and note network address

 when read this, we read lines after this line

 read the address

*/





/*

 start at next line


 move it to network/message/judge/information.h

 so we can recive the complete content

*/

//               pointer_content   =  strchr ( pointer_content, '\n' ) + 1;





// to the one next of this line

        char * pointer_next      =  strchr ( pointer_content, '\n' )    ;
















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

 loop it line by line

*/


        while (  strchr ( pointer_content, '\n' )  !=  NULL  ) {









/*

 if this isn't the end

 we read this, to the pointer of next

 and return it soon


 if it is, we read this

*/


           * pointer_next = '\0';









/*

 went over the blank lines

 there're blank lines let it easy to see them

*/

            if      (  0  ==  strcmp ( pointer_content, "" )  ) {

                ;}






// read the name of that

            else if (  pointer_content  ==  strstr ( pointer_content, "Name             : " )  ) {


// it always start with a ':'

                strcpy (

                          that_about . system [ that_site ] . name,

                          strstr ( pointer_content, " :" ) + 3

                       );}




// read system name

            else if (  pointer_content == strstr ( pointer_content, "System           : " )  ) {


                strcpy (
                          that_about . system [ that_site ] . system,

                          strstr ( pointer_content, " :" ) + 3

                       );}




// read user name

            else if (  pointer_content == strstr ( pointer_content, "User             : " ) ) {


                strcpy (

                         that_about . system [ that_site ] . user,

                         strstr ( pointer_content, " :" ) + 3

                       );}













            else if (  pointer_content == strstr ( pointer_content, "IP               : " ) ) {

/*

 why

 network address alway start with a number of them


 we used it to check address

 and could not to use it

 and make it clear

*/

                that_about . network [ that_site ] . number

                =  atoi (  strstr ( pointer_content, " :"  ) + 3  );








// prepare





/*

 return the last one

 we will read next lines

 change the content we've read

*/

               * pointer_next  =  '\n';




// start with next line

                 pointer_content  =  strchr ( pointer_content, '\n'  ) + 1;




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





/*

 prepare to read them


 the number of the address we've read

*/

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
                                       pointer_network    =           pointer_content;
                        strcmp ( "\n", pointer_network ) !=  0 ;
                                       pointer_network    =  strchr ( pointer_content, '\n' )
                    ) {


/*

 the pointer of network  we use it to  miss the null happened


 we fresh it first  out of the loop


 after first set, we fresh the pointer of network

 in the loop


 but pointer we've read we've used  not


 if not, it isn't first line

 we fresh it

*/


                    if (  pointer_content  !=  pointer_network  ) {


//  jump over the '\n'

                        pointer_network  =  pointer_network + 1;


// fresh the pointer we've read

                        pointer_content  =  pointer_network;}







// prepare to note them






// start here


/*

 we should jump over the blank charactor


         name : address
    name-long : address

*/


                  while (  * pointer_content  ==  ' ' )  ) {

                      pointer_content ++;





// to here

                    pointer_network = strstr (  pointer_content, " : " );

                    pointer_network =  '\0';



// note it

                    strcpy (

                             that_about . network [ that_site ] . ip [ number_ip ] [ 1 ],

                             pointer_content

                           );

// return it

                  * pointer_network  =  ' ';










// the address start here



/*

 the pointer of network  point  ' : '

 start at after that

*/
                    pointer_content  =  pointer_network + 3 );




// to here


/*

 the last one of this line

*/

                    pointer_network  =  strchr ( pointer_content, '\n' );

                  * pointer_network  =  '\0';





// note the address

                    strcpy(

                            that_about . network [ that_site ] . ip [ number_ip ] [ 2 ],

                            pointer_content

                          );



// return it

                  * pointer_network  =  '\0';




/*

 don't needto do this

 because we have fresh this when we had jumped to the address' beginning

*/

//                    pointer_content = pointer_content + 1;






// plus this count

                    number_ip ++;}




/*

 read address it is over

 clean it within blank

 we clean them in  watchdog/information/build/clean.h  soon

*/

/*
                for ( ; number_ip <= 32; number_ip ++ ) {

                    if   ( strcmp ( that_about . network [ that_site ] . ip [ number_ip ] [ 2 ], "") != 0 ) {

                        strcpy (  that_about . network [ that_site ] . ip [ number_ip ] [ 2 ], ""  );}

                    else {

                        break;}}
*/



// read address and their number it is over

                }









// about cpu

            else if  (  pointer_content  ==  strstr ( pointer_content, "CPU cores        : " )  ) {

                that_about . cpu [ that_site ] . cores  =  atoi (  strstr ( pointer_content, " :" )  + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "CPU frequency    : " )  ) {

                that_about . cpu [ that_site ] . frequency  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_contsent, "CPU temperature  : " )  ) {

                that_about . cpu [ that_site ] . temperature  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "CPU rate         : " )  ) {

/*

 maybe there's a little %

 and we could see


 we read to it

 and jump over after this

*/

              * strchr ( pointer_content, '%' ) = '\0';

                that_about . cpu [ that_site ] . rate  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "Memory total     : " )  ) {


                that_about . memory [ that_site ] . total  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "Memory used rate : " )  ) {



              * strchr ( pointer_content, '%' ) = '\0';

/*

 it goes wrong when rate send before the total

*/

                that_about . memory [ that_site ] . free

              = that_about . memory [ that_site ] . total

              *     (  100 -   atoi (  strstr ( pointer_content, " :" ) + 3  )  )     / 100;}









            else if  (  pointer_content  ==  strstr ( pointer_content, "Disk size        : " )  ) {


                that_about . disk [ that_site ] . size  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "Disk user rate   : " )  ) {


              * strchr ( pointer_content, '%' )  = '\0';


/*

 it went wrong when a message dosen't bring a disk size 

 we should note this rate

*/

                that_about . disk [ that_site ] . available

              = that_about . disk [ that_site ] . size

              *   atoi (  strstr ( pointer_content, " :" ) + 3  )   / 100;}




            else if  (  pointer_content  ==  strstr ( pointer_content, "Sound control    : " )  ) {

                that_about . sound [ that_site ] . number_control  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "Sound capture    : " )  ) {

                that_about . sound [ that_site ] . number_capture  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "Sound playback   : " )  ) {

                that_about . sound [ that_site ] . number_playback  =  atoi (  strstr ( pointer_content, " :" ) + 3  );}





            else if  (  pointer_content  ==  strstr ( pointer_content, "Status           : " )  ) {




// prepare

                pointer_content  =  strstr ( pointer_content, " :" ) + 3;


/*

 dog,
 server,
 client,
 sound,
 daemon

*/

                if      (  * pointer_content == 'o'  ) {

                    that_about . flag [ that_site ] . dog  =  1;}

                else if (  * pointer_content == ' '  ) {

                    that_about . flag [ that_site ] . dog  = 0;}


                pointer_content ++;
                pointer_content ++;




                if      (  * pointer_content == 'o'  ) {

                    that_about . flag [ that_site ] . connectted = 1;}

                else if (  * pointer_content == ' '  ) {

                    that_about . flag [ that_site ] . connectted = 0;}

                pointer_content ++;
                pointer_content ++;




                if      (  * pointer_content == 'o'  ) {

                    that_about . flag [ that_site ] . connector = 1;}

                else if (  * pointer_content == ' '  ) {

                    that_about . flag [ that_site ] . connector = 0;}


                pointer_content ++;
                pointer_content ++;




                if      (  * pointer_content == 'o'  ) {

                    that_about . flag [ that_site ] . sound = 1;}

                else if (  * pointer_content == ' '  ) {

                    that_about . flag [ that_site ] . sound = 0;}


                pointer_content ++;
                pointer_content ++;




                if      (  * pointer_content == 'o'  ) {

                    that_about . flag [ that_site ] . deamon = 1;}

                else if (  * pointer_content == ' '  ) {

                    that_about . flag [ that_site ] . deamon = 0;}}



/*

 prepare for next loop

 we move it to the network/message/judge/information.h

*/

          * pointer_next = '\n';

            pointer_content = pointer_next + 1;

            pointer_next = strchr ( pointer_content, '\n' );}





// loop finished

        return 1;}
