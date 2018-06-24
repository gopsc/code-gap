



int load_about_mate (

                         struct  gopi_about     that_about,

                                 char *       buffer_words

                    ) {










/*

 we use malloc to do this soon

 then we can know about every mates


 use 'mate' to note its ship



 free space in cleanning

*/





    if  (  that_about . number_mates  ==  0  )  {


        that_about . mates   =   malloc  (  that_about . number_mates   *   sizeof ( void * )  );



    else {


        that_about . mates   =   reallac (  that_about . mates,  that_about . number_mate + 1   *   sizeof ( void * )  );




    that_about .  number_mate ++;













/*

 start at the first line

 to the last one of this line


 and move startting set to the network/message/judge/informastion.h

*/


//           pointer_words = strchr ( pointer_words, '\n' ) + 1;










/*

 use pointer of next to note enter we found

 could be blank

*/


//    char * pointer_next = strchr ( pointer_words, '\n' ) ;


    char * pointer_next;













/*

 soon we use realloc

 and  we could know about mates


 then we use 'rate' to note them

 then we could not see a mass

 about size is still zero

 and we know its rate



 this is useful to note the number and thought out the sum of these valus

*/


    int number_cores;

    int number_frequency;


    int number_disk_size;

    int number_disk_rate;


    int number_memory_total;

    int number_memory_rate;







/*

 sometimes dog show it

 and we are loaing



 about it and about its mates is two pieces of message

 move it to the start of message reading

*/


//    strcpy ( that_about . symbol, "reading" );







/*

 ok u got about that

 so u can know it's running

*/




    that_about . flag [ that_site ] . main  =  1;









/*

 if this isn't the last line

 we read to it


 if this is the last one of this line

 we read it

*/



//    while  (  strchr ( pointer_words, '\n' )  !=  NULL  ) {

    do {





/*

 this maybe last one

 it's blank

*/


        if ( pointer_next != NULL ) {

          * pointer_next  =  '\0';}











/*

 we jump over the blank one

 what help us understand more easily

*/

        if  (  0  ==  strcmp ( pointer_words, "" )  ) {

            ;}






/*

 we read this mate's name

 from that

*/


        else if  (  pointer_words  ==  strstr ( pointer_words, "Name             : " )  ) {


/*

 this and it's mates

 could work together

*/

            strcat ( that_about . system [ that_site ] . name,   "," );

            strcat ( that_about . system [ that_site ] . name,   strstr ( pointer_words, " :" ) + 3 );}






// we read the system it used


        else if  (  pointer_words  ==  strstr ( pointer_words, "System           : ") ) {


            strcat ( that_about . system [ that_site ] . system, "," );

            strcat ( that_about . system [ that_site ] . system, strstr ( pointer_words, " :" ) + 3  );}






/*

 we read the user of that


 for raspbrrypi it is root, dietpi, gop ...

 for arduino or stm32, gr-citrus

 that is,,


*/

        else if  (  pointer_words  ==  strstr ( pointer_words, "User             : " )  ) {


            strcat ( that_about . system [ that_site ] . user,   ","                         );

            strcat ( that_about . system [ that_site ] . user,   strstr ( pointer_words, " :" ) + 3  );}











// this is a loop in loop


            else if  (  pointer_convent  ==  strstr ( pointer_convent, "IP               : " )  ) {





// we add them to its address


                that_about . network [ that_site ] . number

             += atoi (  strstr ( pointer_convent, " :" ) + 3  );








/*

 return it

 we are going to read the lines

 after this line

*/

              * pointer_next = '\n';




// start at next line

                pointer_convent = strchr ( pointer_convent, '\n'  ) + 1;



// to the last of address

                pointer_next    = strstr ( pointer_next, "\n\n"   ) + 1;

              * pointer_next = '\0';









/*

 This is the index of

 where u noted

*/


                int number_ip = 1;







// Count the ip we have noted


                int i;

                for (  i = 1; i <= 32; i ++  ) {


                    if  (  strcmp ( that_about . network [ that_site ] . ip [ number_ip ] [2], "") == 0 ) {

                        break;}


                    else {

                        number_ip ++;}}



/*

 The first  ip is local,

 the second ip is blank

  in the final line

 and just can

     like a local ip


 termux may have not local ip

*/


                number_ip ++;



/*

 Copy new ip


 we use this pointer to note path

 could be null


 then we could not lost the path

*/

                char * pointer_network;

                for (

                                       pointer_network     =          pointer_convent;

                        strcmp ( "\n", pointer_network )  != 0 ;

                                       pointer_network     = strchr ( pointer_convent, '\n')

                    ) {



/*

 After the first loop,

  it plus every time.


 we set it before so they are same at first

*/


                    if  (  pointer_convent  !=  pointer_network  ) {

                        pointer_network = pointer_network + 1;}


// now copy it

                    strcpy(
                            gop_connection.network[that_site].ip[number_ip][1],
                            pointer_network
                          );

                   *strstr(
                            gop_connection.network[that_site].ip[number_ip][1],
                            " : "
                          )
                   ='\0';

                    strcpy(
                            gop_connection.network[that_site].ip[number_ip][2],
                            strstr(pointer_network, " : ") + 3
                          );

                   *strchr( gop_connection.network[that_site].ip[number_ip][2], '\n' )
                   ='\0';


                    pointer_recv = pointer_network + 1;




// The local ip lo,
//
//  if always be same
//
// dose not need to note ?
//
// forget it, and save as blank strings
//
// u can make a symbol to cut and does not change the number of the ip address


                    if (

                         strcmp(gop_connection.network[that_site].ip[number_ip][1], "lo")
                    !=  0

                    &&   strcmp(gop_connection.network[that_site].ip[number_ip][2], "127.0.0.1")
                    !=  0

                       )

                    number_ip++;}}




            else if ( pointer_recv == strstr(pointer_recv, "CPU cores        : ") ) {

                number_cores     = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "CPU frequency    : ") ) {

                number_frequency = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "CPU temperature  : ") ) {



                if ( gop_connection.cpu[that_site].temperature < atoi(strstr(pointer_recv, " :")+3) ) {

                     gop_connection.cpu[that_site].temperature   = atoi(strstr(pointer_recv, " :")+3);}}


            else if ( pointer_recv == strstr(pointer_recv, "CPU rate         : ") ) {

                gop_connection.cpu[that_site].rate              += atoi(strstr(pointer_recv, " :")+3);

                gop_connection.cpu[that_site].rate
              = gop_connection.cpu[that_site].rate
              / gop_connection.cpu[that_site].cores;}


            else if ( pointer_recv == strstr(pointer_recv, "Memory total     : ") ) {

                number_memory_total = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Memory used rate : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';

                number_memory_rate  = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Disk size        : ") ) {

                number_disk_size    = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Disk user rate   : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';

                number_disk_rate = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound control    : ") ) {

                gop_connection.sound[that_site].number_control  += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound capture    : ") ) {

                gop_connection.sound[that_site].number_capture  += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound playback   : ") ) {

                gop_connection.sound[that_site].number_playback += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Status           : ") ) {

// o o o o o
//
// dog,
// server,
// client,
// sound,
// daemon

                pointer_recv = strstr(pointer_recv, " :")+3;


                gop_connection.flag[that_site].main   = 1;



                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].dog    = 1;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].connector = 1;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].connector = 1;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].sound = 1;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].deamon = 1;}}




// This piece of
// information is read over,
// return the words and
//  fresh the pointer

           *pointer_next = '\n';

            pointer_recv = pointer_next + 1;

            pointer_next = strchr(pointer_recv, '\n' );}






// Prepare the information got about memorys


                gop_connection.memory[that_site].free

             += number_memory_total

              * (  100 - number_memory_rate  )

              /    100;


                gop_connection.memory[that_site].total

             += number_memory_total;





// Prepare the information got about disk
// It's just like the memory's

                gop_connection.disk[that_site].available

             += number_disk_size

              * ( 100 - number_disk_rate )

              /   100;


                gop_connection.disk[that_site].size

             += number_disk_size;


// Prepare the information got about cpu

        number_frequency

      = gop_connection.cpu[that_site].cores      * gop_connection.cpu[that_site].frequency

      +                        number_cores      * number_frequency;


        gop_connection.cpu[that_site].cores     += number_cores;


        gop_connection.cpu[that_site].frequency

      = number_frequency / gop_connection.cpu[that_site].cores;




        return 1;}

