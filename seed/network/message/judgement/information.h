

int judgement_message_information(
                                     int   that_site,
                                     char* pointer_recv,
                                     char* buffer_send
                                 ) {

//PS. the varitable 'pointer_recv' was selected before
//        so there is just a command leave.

//-----------------------------------------------

    if (
           strstr(pointer_recv, "Here."  )
           ==     pointer_recv
    ||     strstr(pointer_recv, "Recive.")
           ==     pointer_recv
       ) {

        if ( strcmp(gop_connection.command[that_site], "") == 0 ) {

            strcat(buffer_send, "Who is that now?");}

        return 1;}

//-----------------------------------------------

    else if ( strstr(pointer_recv, "Information of host." ) == pointer_recv ) {



              pointer_recv   = strchr(pointer_recv, '\n' ) + 1;
        char* pointer_next   = strchr(pointer_recv, '\n' )    ;



        gop_connection.flag[that_site].main   = 1;



        while ( strchr(pointer_recv, '\n') != NULL ) {

           *pointer_next = '\0';


            if      ( 0            == strcmp(pointer_recv, "") ) {

                ;}

            else if ( pointer_recv == strstr(pointer_recv, "Name             : ") ) {

                strcpy(gop_connection.system[that_site].name,   strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "System           : ") ) {

                strcpy(gop_connection.system[that_site].system, strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "User             : ") ) {

                strcpy(gop_connection.system[that_site].user,   strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "IP               : ") ) {

                gop_connection.network[that_site].number = atoi(strstr(pointer_recv, " :" )+3);

               *pointer_next = '\n';
                pointer_recv = strchr(pointer_recv, '\n'  ) +1;
                pointer_next = strstr(pointer_next, "\n\n") +1;
               *pointer_next = '\0';


                int number_ip = 1;

                char* pointer_network;
                for (
                                     pointer_network   =        pointer_recv;
                        strcmp("\n", pointer_network) != 0                  ;
                                     pointer_network   = strchr(pointer_recv, '\n')
                    ) {

                    if ( pointer_recv != pointer_network ) {
                        pointer_network = pointer_network + 1;}


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

                    number_ip++;}

                for ( ; number_ip<=32; number_ip++ ) {

                    if   ( strcmp(gop_connection.network[that_site].ip[number_ip][2], "") != 0 ) {

                        strcpy(gop_connection.network[that_site].ip[number_ip][2], "");}

                    else {

                        break;}}}



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





            else if ( pointer_recv == strstr(pointer_recv, "Disk available   : ") ) {


                gop_connection.disk[that_site].available = atoi(strstr(pointer_recv, " :")+3);}




            else if ( pointer_recv == strstr(pointer_recv, "Disk user rate   : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';


                gop_connection.disk[that_site].used
              = gop_connection.disk[that_site].available

              * (  100 -   atoi(strstr(pointer_recv, " :")+3)  )
              /    100;}



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

                    gop_connection.flag[that_site].server = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].server = 0;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].client = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].client = 0;}

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

//-----------------------------------------------

    else if ( strstr(pointer_recv, "Information of guest.") == pointer_recv ) {




              pointer_recv   = strchr(pointer_recv, '\n' ) + 1;
        char* pointer_next   = strchr(pointer_recv, '\n' )    ;




        int number_cores;
        int number_frequency;

        int number_disk_available;
        int number_disk_used;

        int number_memory_total;
        int number_memory_used;

        gop_connection.flag[that_site].main   = 1;




        while ( strchr(pointer_recv, '\n') != NULL ) {

           *pointer_next = '\0';


            if      ( 0            == strcmp(pointer_recv, "") ) {

                ;}

            else if ( pointer_recv == strstr(pointer_recv, "Name             : ") ) {

                strcat(gop_connection.system[that_site].name,   ","                         );
                strcat(gop_connection.system[that_site].name,   strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "System           : ") ) {

                strcat(gop_connection.system[that_site].system, ","                         );
                strcat(gop_connection.system[that_site].system, strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "User             : ") ) {

                strcat(gop_connection.system[that_site].user,   ","                         );
                strcat(gop_connection.system[that_site].user,   strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "IP               : ") ) {



                gop_connection.network[that_site].number += atoi(strstr(pointer_recv, " :" )+3);



               *pointer_next = '\n';
                pointer_recv = strchr(pointer_recv, '\n'  ) +1;
                pointer_next = strstr(pointer_next, "\n\n") +1;
               *pointer_next = '\0';





// This is the index of
// where u arrived

                int number_ip = 1;



// Count the ip u've gottens

                int i;

                for ( i=1; i<=32; i++ ) {


                    if ( strcmp(gop_connection.network[that_site].ip[number_ip][2], "") == 0 ) {

                        break;}


                    else {

                        number_ip ++;}}



// The first  ip is local,
// the second ip is blank
//  in the final line
//
// and just can
//     like a local ip

                number_ip ++;



// Copy the  new ip
//   in this new information

                char* pointer_network;

                for (

                                      pointer_network    =        pointer_recv;
                        strcmp( "\n", pointer_network ) != 0                  ;
                                      pointer_network    = strchr(pointer_recv, '\n')

                    ) {


// After the first loop,
//  it plus every time.

                    if ( pointer_recv != pointer_network ) {

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

                number_memory_used  = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Disk available   : ") ) {

                number_disk_available = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Disk user rate   : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';

                number_disk_used = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound control    : ") ) {

                gop_connection.sound[that_site].number_control  += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound capture    : ") ) {

                gop_connection.sound[that_site].number_capture  += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound playback   : ") ) {

                gop_connection.sound[that_site].number_playback += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Status           : ") ) {

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

                    gop_connection.flag[that_site].server = 1;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].client = 1;}

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
/*
                gop_connection.memory[that_site].free
              = gop_connection.memory[that_site].total

              * (  100 -   atoi(strstr(pointer_recv, " :")+3)  )
              /    100;
*/


// Prepare the information got about disk




// Prepare the information got about cpu

        number_frequency

      = gop_connection.cpu[that_site].cores      * gop_connection.cpu[that_site].frequency

      +                        number_cores      * number_frequency;


        gop_connection.cpu[that_site].cores     += number_cores;


        gop_connection.cpu[that_site].frequency

      = number_frequency / gop_connection.cpu[that_site].cores;




        return 1;}

//-----------------------------------------------

    else if (
                strstr(
                        pointer_recv,
                       "Update lost."
                      )
                ==      pointer_recv
            ) {

        if (
               strcmp(
                       strchr(pointer_recv, '\n'),
                       "\n"
                     )
               == 0
           ) {

            strcpy( gop_connection.update     [that_site], path_the );
            strcat( gop_connection.update     [that_site], "/"      );
            strcat( gop_connection.update     [that_site], name_the );

                    gop_connection.step_update[that_site] = 0;}

        else {

            strcpy( gop_connection.update     [that_site], strchr(pointer_recv, '\n')+1 );
                    gop_connection.step_update[that_site]
     = atoi(strrchr(gop_connection.update     [that_site], '.') + 1)  ;
           *strrchr(gop_connection.update     [that_site], '.') = '\0';}


//        output_print    ( "string" , "Update lost." );
//        clean_connection( that_site, "update"       );

        return 1;}

//-----------------------------------------------

    else if (
                strstr(
                        pointer_recv,
                        "Sopi."
                      )
                ==      pointer_recv
            ) {


        output_print( "string", "Got Sopi\n" );


        int i;

        for ( i=0; i<=3; i++ ) {

            if (
                   strcmp(
                           gop_connection.how[i],
                          "Connectted"
                         )
                   == 0

            ||     strcmp(
                           gop_connection.how[i],
                          "Sopi"
                         )
                   == 0
               ) {

                strcpy(gop_connection.command[i], "Sopi.");}}


        clean_connection( that_site,   "sopi"  );

        strcat          ( buffer_send, "Sopi." );

        return 1;}

//-----------------------------------------------

    else if (
                strstr(
                        pointer_recv,
                        "Who is that now?"
                      )
                ==      pointer_recv
            ) {

// It means giving you  sopi
//    when  a host send sopi

        if ( that_site == 0 ) {

            strcat      (buffer_send,      "Sopi."      );}

        else {

            strcat      (buffer_send, "Who is that now?");}

        return 1;}

//-----------------------------------------------

    else {

        strcat(buffer_send, "Who is that now?");

        return 0;}

//===============================================

    return 0;}
