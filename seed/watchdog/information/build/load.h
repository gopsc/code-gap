

int load_about (

                   gopi_about   that_about,

                   char *     buffer_convents

               ) {





// the first loop set

// pointer_recive note this path

// pointer_next note the path last one at this line

// maybe blank pointer


// and noto network address

// when read this, we read lines after this

// all of the address


               pointer_recv   =  strchr(pointer_recv, '\n' ) + 1;
        char * pointer_next   =  strchr(pointer_recv, '\n' )    ;






// start the set


// first we clean it

//        clean_about ( gop_connection . about [ that_site ] );



// we've recived the message

// so it is running


// maybe we add it to clean

        gop_connection . about [ that_site ] . flag . main   =  1;









// if this not the end

// we read this, to the pointer of next

// and return soon


// if it is, it read this

        while (  strchr ( pointer_recv, '\n' )  !=  NULL  ) {

           * pointer_next = '\0';







// went over the blank lines

// there're several blank lines make us easy to see

            if      (  0  ==  strcmp ( pointer_recv, "" )  ) {

                ;}





// read the name of that

            else if (  pointer_recv == strstr ( pointer_recv, "Name             : " )  ) {

// it always start with a ':'

                strcpy (

                          gop_connection . about . system [ that_site ] . name,

                          strstr ( pointer_recv, " :" ) + 3

                       );}




// read system name

            else if (  pointer_recv == strstr ( pointer_recv, "System           : " )  ) {

                strcpy (
                          gop_connection . about . system [ that_site ] . system,

                          strstr ( pointer_recv, " :" ) + 3

                       );}




// read user name

            else if (  pointer_recv == strstr ( pointer_recv, "User             : " ) ) {

                strcpy (

                         gop_connection . about . system [ that_site ] . user,

                         strstr ( pointer_recv, " :" ) + 3

                       );}













            else if (  pointer_recv == strstr ( pointer_recv, "IP               : " ) ) {


// why

// network address alway start with a number of them



                gop_connection . about . network [ that_site ] . number

                =  atoi (  strstr ( pointer_recv, " :"  ) + 3 );








// prepare







// return the last one

// we will read next lines

// change the convent we've read

               * pointer_next  =  '\n';




// start with next line

                 pointer_recv  =  strchr ( pointer_recv, '\n'  ) + 1;




// to the last one

/*
   address  :  2
       name : address
       name : address

   ...
*/

                 pointer_next  =  strstr ( pointer_next, "\n\n" );

               * pointer_next  =  '\0';







// prepare to read them


// the number of the address we've read

                int number_ip = 1;




// this is to save the line we will read

// may null happened

// the pointer maybe last


// pointer of network will be used for return when this happened



// this has name and address one line

// and use this to find the path


                char * pointer_network;







// we read them line by line

// to the blank line

// then this is the last one


                for (
                                       pointer_network    =           pointer_recv;
                        strcmp ( "\n", pointer_network ) !=  0 ;
                                       pointer_network    =  strchr ( pointer_recv, '\n' )
                    ) {



// the pointer of network  we use it to  miss the null happened


// after first set, we fresh the pointer of network

// but pointer we've read not


// if not, it isn't first line

// we fresh it



                    if (  pointer_recv  !=  pointer_network  ) {


//  jump over the '\n'

                        pointer_network  =  pointer_network + 1;


// fresh the pointer we've read

                        pointer_recv     =  pointer_network;}







// prepare to note them






// start here


// we should jump over the blank charactor

/*
         name : address
    name-long : address
*/


                  while (  * pointer_recv  ==  ' ' )  ) {

                      pointer_recv ++;





// to here

                    pointer_network = strstr (  pointer_recv, " : " );

                    pointer_network =  '\0';



// note it

                    strcpy(

                            gop_connection . about . network [ that_site ] . ip [ number_ip ] [ 1 ],

                            pointer_recv

                          );

// return it

                  * pointer_network  =  ' ';










// the address start here

                    pointer_recv  =  strstr ( pointer_recv, " : " + 3 );


// to here

                    pointer_network  =  strchr ( pointer_recv, '\n' );

                  * pointer_network  =  '\0';





// note the address

                    strcpy(

                            gop_connection . about . network [ that_site ] . ip [ number_ip ] [ 2 ],

                            pointer_recv

                          );

// return it

                  * pointer_network  =  '\0';





// don't need to, because we have fresh this when we jumped to the address' beginning

//                    pointer_recv = pointer_recv + 1;



// plus it

                    number_ip ++;}




// clean it

// we use them in the watchdog/information soon

/*
                for ( ; number_ip <= 32; number_ip ++ ) {

                    if   ( strcmp ( gop_connection . about . network [ that_site ] . ip [ number_ip ] [ 2 ], "") != 0 ) {

                        strcpy (  gop_connection . about . network [ that_site ] . ip [ number_ip ] [ 2 ], ""  );}

                    else {

                        break;}}
*/

                }











            else if ( pointer_recv == strstr(pointer_recv, "CPU cores        : ") ) {

                gop_connection.cpu[that_site].cores              = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "CPU frequency    : ") ) {

                gop_connection.cpu[that_site].frequency          = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "CPU temperature  : ") ) {

                gop_connection.cpu[that_site].temperature        = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "CPU rate         : ") ) {

                gop_connection.cpu[that_site].rate               = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Memory total     : ") ) {


                gop_connection.memory[that_site].total = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Memory used rate : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';


                gop_connection.memory[that_site].free
              = gop_connection.memory[that_site].total

              * (  100 -   atoi(strstr(pointer_recv, " :")+3)  )
              /    100;}





            else if ( pointer_recv == strstr(pointer_recv, "Disk size        : ") ) {


                gop_connection.disk[that_site].size = atoi(strstr(pointer_recv, " :")+3);}




            else if ( pointer_recv == strstr(pointer_recv, "Disk user rate   : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';


                gop_connection.disk[that_site].available
              = gop_connection.disk[that_site].size

              * atoi(strstr(pointer_recv, " :")+3) / 100;}



            else if ( pointer_recv == strstr(pointer_recv, "Sound control    : ") ) {

                gop_connection.sound[that_site].number_control   = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound capture    : ") ) {

                gop_connection.sound[that_site].number_capture  = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound playback   : ") ) {

                gop_connection.sound[that_site].number_playback = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Status           : ") ) {

                pointer_recv = strstr(pointer_recv, " :")+3;


// dog,
// server,
// client,
// sound,
// daemon



                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].dog    = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].dog    = 0;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].connectted = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].connectted = 0;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].connector = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].connector = 0;}

                pointer_recv++;
                pointer_recv++;



                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].sound  = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].sound  = 0;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].deamon = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].deamon = 0;}}




           *pointer_next = '\n';

            pointer_recv = pointer_next + 1;

            pointer_next = strchr(pointer_recv, '\n' );}


        return 1;}
