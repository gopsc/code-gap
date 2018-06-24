

int load_about (

                   gopi_about    that_about,

                   char *     pointer_words

               ) {






/*

 the first loop set

 pointer_words note where we've read

 pointer_next  note the  enter of this line

 maybe blank pointer



 when we read address, we read lines after this line

 change words we have read

 and read the address


 and return it after addresss



 maybe let it note the address & its name

 but the enter may be clear

 and the symbol of blank pointer may be lost


 loop may can't quit


 and we could put it after read name & address

*/





/*

 first loop set


 start at first line



 move it to network/message/judge/information.h

 top than here

 so we got the whole content

*/

//    pointer_words   =  strchr ( pointer_words, '\n' ) + 1;





/*

 to the one next of this line


 maybe we should put it at the first of loop


 fresh it every loop

*/


//    char * pointer_next = strchr ( pointer_words, '\n' ) ;


    char * pointer_next = pointer_words;














/*

 start to set about



 first we clean it

 this come soon


 clean it to blank could cause blank about it

 and we could let it wait

 make a symbol


 if it isn't reading, we clean the symbol

 if it isn't reading, we put the about

*/

    strcpy ( that_about . symbol, "reading" );

    clean_about (  that_about  );







/*

 we've recived the message

 so it is running


 maybe we add it to clean


 ok but not

 sometimes we clean it for good and it haven't a connection


 the main flag set is here



 and we could let it read symbol

 'read' then it's running

 but we don't clean its mate

*/

    that_about . flag . main   =  1;







/*

 loop it line by line


 last line of words could not be enter

 we use pointer_next to note


 to miss null

*/


    while (  pointer_next  !=  NULL  ) {






/*

 start at this line


 fresh before and last line of this loop

 ...



 to the next line

 we move it here

*/

        pointer_next  =  strchr ( pointer_words, '\n' );







/*

 if this isn't the end

 we read this, to the pointer of next

 and return it soon


 if it is, we read this


 we have set it before the first loop

 after this we set it every loop


 and we could set it here make it simple :d



 this could be last line of words

 then we read to this

*/


        if  (  pointer_next != NULL  ) {

      * pointer_next  =  '\0';}









/*

 load here

 and things about it







 went over the blank lines

 there're blank lines let it easy to be saw

*/

        if  (  0  ==  strcmp ( pointer_words, "" )  ) {

            ;}






// read the name of that

        else if (  pointer_words  ==  strstr ( pointer_words, "Name             : " )  ) {


// it always start with a ':'

            strcpy (

                      that_about . system . name,

                      strstr ( pointer_words, " :" ) + 3

                   );}




// read system name

        else if (  pointer_words  ==  strstr ( pointer_words, "System           : " )  ) {


            strcpy (
                      that_about . system . system,

                      strstr ( pointer_words, " :" ) + 3

                   );}




// read user name

        else if (  pointer_words  ==  strstr ( pointer_words, "User             : " ) ) {


            strcpy (

                     that_about . system . user,

                     strstr ( pointer_words, " :" ) + 3

                   );}













        else if (  pointer_words  ==  strstr ( pointer_words, "IP               : " ) ) {


/*

 why

 network address alway start with a number of them


 we used it to check address


 and may not to use it

 and make it clear

*/

            that_about . network . number

            =  atoi (  strstr ( pointer_words, " :"  ) + 3  );








// prepare





/*

 return the last one

 we will read next lines

 change the words we've read


 to the last one of address

*/

          * pointer_next  =  '\n';










// start with next line


            pointer_words  =  strchr ( pointer_words, '\n'  ) + 1;




/*

 to the last one of address



   address  :  2
       name : address
       name : address

   ...


 there're two blank enter



 and it will read over the blank lines anyway

*/

             pointer_next  =  strstr ( pointer_next, "\n\n" );

           * pointer_next  =  '\0';







/*

 prepare to read them


 the number of the address we've read


 maybe we use it to realloc it anyway


 maybe we realloc it and don't use it

*/

            int  number_ip  =  1;








/*

 this is to note the line we will read

 may null happened

 the pointer may lost


 pointer of network will be used to let it not happen


 they has name and address one line

 and use this to find the path


 if use pointer of next to do this

 and return

 that could cause mess

 if we use a single arduino with esp8266 to connect this

 and the there's not a enter after address

*/

            char * pointer_network;









/*

 we read them line by line

 to the blank line


 it is last one

*/


            for (

                     pointer_network    =           pointer_words;

                     pointer_network   !=  NULL ;

/*

 if it is null

 we read it once

 and quit the loop

 next circle

*/
                     pointer_network    =  strchr ( pointer_words, '\n' )

                ) {





/*

 symbol


 one    loop  for function

 two    loop  for read about

 three  loop  for start to adress

 four   loop  for read address

*/






/*

 the pointer of network  we use it to  miss the null happened


 we fresh it first  at beginning of the loop


 after first put, we fresh the pointer of network

 in the loop


 but pointer we've read we've used haven't


 if not, it isn't first line

 we fresh it

*/


                if  (  pointer_words  !=  pointer_network  ) {



/*

 pointer of network read to the enter after first loop

 read over the enter



 if it is null it is the last one

 then we won't let it start




 we saw it before and this is not blank line

 fresh the pointer we've read


 and this could be blank line if this don't have a address

 and if there's not a address, we don't use socket

 maybe like bit coins


 and this circle won't start

*/




/*

 before this we use this pointer to read

 then we plus it every time

 now we plus pointer of words

*/


/*

                    if  (  pointer_network  !=  NULL  ) {


                    pointer_network  =  pointer_network + 1;

*/






                    pointer_words  =  pointer_network + 1;}











/*

// prepare to note them










 start here


 we should read over the charactors


         name : address
    name-long : address

*/


                while (  * pointer_words  ==  ' '  ) {

                    pointer_words ++;}






/*

 to here


 name finish at ':'

 and address start at it

*/

                pointer_network = strstr (  pointer_words, " : " );

                pointer_network =  '\0';






// note name

                strcpy (

                         that_about . network . ip [ number_ip ] [ 1 ],

                         pointer_words

                       );

// return it

              * pointer_network  =  ' ';









/*

 the address start here



 the pointer of network  point  where ' : ' is

 and return it before

 start after that

*/
                pointer_words  =  pointer_network + 3 );








/*

 to here


 the last one of this line

*/

                pointer_network  =  strchr ( pointer_words, '\n' );

              * pointer_network  =  '\0';





// note address

                strcpy(

                        that_about . networks . ip [ number_ip ] [ 2 ],

                        pointer_words

                      );



// return it

              * pointer_network  =  '\n';








/*

 don't needto plus it here


 because we have fresh it

 when we had read to the address' beginning

*/

//                pointer_words = pointer_words + 1;





/*

 plus this count



 soon we won't use it

 we read to the blank box


 or we use it

 and we could realloc the pointer of address

*/


                number_ip ++;}








/*

 read address finished

 clean it within blank


 we clean them in  watchdog/information/build/clean.h  soon



 read address and their number finished

*/

            }









// about cpu

        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU cores        : " )  ) {

            that_about . cpu . cores  =  atoi (  strstr ( pointer_words, " :" )  + 3  );}





        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU frequency    : " )  ) {

            that_about . cpu . frequency  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU temperature  : " )  ) {

            that_about . cpu . temperature  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





        else if  (  pointer_words  ==  strstr ( pointer_words, "CPU rate         : " )  ) {

/*

 maybe there's a little %

 and we could see


 we read to it

 and jump over after this

*/

                if  (  strchr ( pointer_words, '%' )  !=  NULL  ) {

                  * strchr ( pointer_words, '%' ) = '\0';}




                that_about . cpu . rate  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Memory total     : " )  ) {


                that_about . memory . total  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Memory used rate : " )  ) {



              * strchr ( pointer_words, '%' ) = '\0';

/*

 it goes wrong when rate send before the total



 and we use a buffer to note it soon

*/

                that_about . memory . free

              = that_about . memory . total

              *     (  100 -   atoi (  strstr ( pointer_words, " :" ) + 3  )  )     / 100;}









            else if  (  pointer_words  ==  strstr ( pointer_words, "Disk size        : " )  ) {


                that_about . disk . size  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Disk user rate   : " )  ) {


              * strchr ( pointer_words, '%' )  = '\0';


/*

 it went wrong when a message dosen't bring a disk size 

 and we note this rate

*/

                that_about . disk . available

              = that_about . disk . size

              *   atoi (  strstr ( pointer_words, " :" ) + 3  )   / 100;}




            else if  (  pointer_words  ==  strstr ( pointer_words, "Sound control    : " )  ) {

                that_about . sound . number_control  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Sound capture    : " )  ) {

                that_about . sound . number_capture  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Sound playback   : " )  ) {

                that_about . sound . number_playback  =  atoi (  strstr ( pointer_words, " :" ) + 3  );}





            else if  (  pointer_words  ==  strstr ( pointer_words, "Status           : " )  ) {




// prepare

                pointer_words  =  strstr ( pointer_words, " :" ) + 3;


/*

 dog,
 server,
 client,
 sound,
 daemon

*/

                if      (  * pointer_words == 'o'  ) {

                    that_about . flag . dog  =  1;}


                else if (  * pointer_words == ' '  ) {

                    that_about . flag . dog  =  0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words == 'o'  ) {

                    that_about . flag . connectted = 1;}


                else if (  * pointer_words == ' '  ) {

                    that_about . flag . connectted = 0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words == 'o'  ) {

                    that_about . flag . connector = 1;}


                else if (  * pointer_words == ' '  ) {

                    that_about . flag . connector = 0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words == 'o'  ) {

                    that_about . flag . sound = 1;}


                else if (  * pointer_words == ' '  ) {

                    that_about . flag . sound = 0;}


                pointer_words ++;
                pointer_words ++;




                if      (  * pointer_words == 'o'  ) {

                    that_about . flag . deamon = 1;}


                else if (  * pointer_words == ' '  ) {

                    that_about . flag . deamon = 0;}}



/*

 prepare for next loop


 return it


 this could be NULL

 that means we read to this

*/


        if  (  pointer_next  !=  NULL  ) {




          * pointer_next = '\n';




// start at next line


            pointer_words = pointer_next + 1;}





/*

 loop restart at next line

 we move it to the first of loop

*/

//         pointer_next = strchr ( pointer_words, '\n' );



        }




/*

 loop finished



 read finished

*/


    strcpy ( that_about, "waitting" );




    return 1;}
