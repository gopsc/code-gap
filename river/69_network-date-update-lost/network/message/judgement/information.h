

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

        return 1;}

//-----------------------------------------------

    else if ( strstr(pointer_recv, "Information of host." ) == pointer_recv ) {

              pointer_recv   = strchr(pointer_recv, '\n' ) + 1;
        char* pointer_next   = strchr(pointer_recv, '\n' )    ;



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

                gop_connection.memory[that_site].total           = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Memory used rate : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';

                gop_connection.memory[that_site].free
              = gop_connection.memory[that_site].total
              * (100 - atoi(strstr(pointer_recv, " :")+3)) / 100;}


            else if ( pointer_recv == strstr(pointer_recv, "Disk available   : ") ) {

                gop_connection.disk[that_site].available         = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Disk user rate   : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';

                gop_connection.disk[that_site].used
              = gop_connection.disk[that_site].available
              * (100 - atoi(strstr(pointer_recv, " :")+3)) / 100;}


            else if ( pointer_recv == strstr(pointer_recv, "Sound control    : ") ) {

                gop_connection.sound[that_site].number_control   = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound capture    : ") ) {

                gop_connection.sound[that_site].number_capture  = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound playback   : ") ) {

                gop_connection.sound[that_site].number_playback = atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Status           : ") ) {

                pointer_recv = strstr(pointer_recv, " :")+3;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].main   = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].main   = 0;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].deamon = 1;}

                else if ( *pointer_recv == ' ' ) {

                    gop_connection.flag[that_site].deamon = 0;}

                pointer_recv++;
                pointer_recv++;


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

                    gop_connection.flag[that_site].sound  = 0;}}




           *pointer_next = '\n';

            pointer_recv = pointer_next + 1;

            pointer_next = strchr(pointer_recv, '\n' );}


        return 1;}

//-----------------------------------------------

    else if ( strstr(pointer_recv, "Information of guest.") == pointer_recv ) {


              pointer_recv   = strchr(pointer_recv, '\n' ) + 1;
        char* pointer_next   = strchr(pointer_recv, '\n' )    ;



        while ( strchr(pointer_recv, '\n') != NULL ) {

           *pointer_next = '\0';


            if      ( 0            == strcmp(pointer_recv, "") ) {

                ;}

            else if ( pointer_recv == strstr(pointer_recv, "Name             : ") ) {

                strcpy(gop_connection.system[that_site].name,   ","                         );
                strcat(gop_connection.system[that_site].name,   strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "System           : ") ) {

                strcpy(gop_connection.system[that_site].system, ","                         );
                strcat(gop_connection.system[that_site].system, strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "User             : ") ) {

                strcpy(gop_connection.system[that_site].user,   ","                         );
                strcat(gop_connection.system[that_site].user,   strstr(pointer_recv, " :")+3);}

            else if ( pointer_recv == strstr(pointer_recv, "IP               : ") ) {

                gop_connection.network[that_site].number += atoi(strstr(pointer_recv, " :" )+3);

               *pointer_next = '\n';
                pointer_recv = strchr(pointer_recv, '\n'  ) +1;
                pointer_next = strstr(pointer_next, "\n\n") +1;
               *pointer_next = '\0';


                int number_ip = 1;

                int i;
                for ( i=1; i<=32; i++ ) {

                    if ( strcmp(gop_connection.network[that_site].ip[number_ip][2], "") == 0 ) {

                        break;}}

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

                    number_ip++;}}


            else if ( pointer_recv == strstr(pointer_recv, "CPU cores        : ") ) {

                gop_connection.cpu[that_site].cores             += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "CPU frequency    : ") ) {

                gop_connection.cpu[that_site].frequency         += atoi(strstr(pointer_recv, " :")+3);

                gop_connection.cpu[that_site].frequency
              = gop_connection.cpu[that_site].frequency
              / gop_connection.cpu[that_site].cores;}


            else if ( pointer_recv == strstr(pointer_recv, "CPU temperature  : ") ) {

                if ( gop_connection.cpu[that_site].temperature < atoi(strstr(pointer_recv, " :")+3) ) {

                     gop_connection.cpu[that_site].temperature   = atoi(strstr(pointer_recv, " :")+3);}}


            else if ( pointer_recv == strstr(pointer_recv, "CPU rate         : ") ) {

                gop_connection.cpu[that_site].rate              += atoi(strstr(pointer_recv, " :")+3);

                gop_connection.cpu[that_site].rate
              = gop_connection.cpu[that_site].rate
              / gop_connection.cpu[that_site].cores;}


            else if ( pointer_recv == strstr(pointer_recv, "Memory total     : ") ) {

                gop_connection.memory[that_site].total          += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Memory used rate : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';

                gop_connection.memory[that_site].free
             =  gop_connection.memory[that_site].free

             + (
                        gop_connection.memory[that_site].total
             -  ( 100 - gop_connection.memory[that_site].free  * 100 )
               )

             * (100 - atoi(strstr(pointer_recv, " :")+3)) / 100;}


            else if ( pointer_recv == strstr(pointer_recv, "Disk available   : ") ) {

                gop_connection.disk[that_site].available        += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Disk user rate   : ") ) {

               *strchr(pointer_recv, '%')                        = '\0';

                gop_connection.disk[that_site].used
             =  gop_connection.disk[that_site].used

             + (
                        gop_connection.disk[that_site].available
             -  ( 100 - gop_connection.disk[that_site].used  * 100 )
               )

             * (100 - atoi(strstr(pointer_recv, " :")+3)) / 100;}


            else if ( pointer_recv == strstr(pointer_recv, "Sound control    : ") ) {

                gop_connection.sound[that_site].number_control  += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound capture    : ") ) {

                gop_connection.sound[that_site].number_capture  += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Sound playback   : ") ) {

                gop_connection.sound[that_site].number_playback += atoi(strstr(pointer_recv, " :")+3);}


            else if ( pointer_recv == strstr(pointer_recv, "Status           : ") ) {

                pointer_recv = strstr(pointer_recv, " :")+3;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].main   = 1;}

                pointer_recv++;
                pointer_recv++;


                if      ( *pointer_recv == 'o' ) {

                    gop_connection.flag[that_site].deamon = 1;}

                pointer_recv++;
                pointer_recv++;


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

                    gop_connection.flag[that_site].sound  = 1;}}




           *pointer_next = '\n';

            pointer_recv = pointer_next + 1;

            pointer_next = strchr(pointer_recv, '\n' );}


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
                          "Connectting"
                         )
                   == 0

            ||     strcmp(
                           gop_connection.how[i],
                          "Sop"
                         )
                   == 0
               ) {

                strcpy(gop_connection.command[i], "Sopi.");}}



        clean_connection( that_site, "sopi");

        strcat(buffer_send, "Sopi.");

        return 1;}

//-----------------------------------------------

    else {

        strcat(buffer_send, "Who is that now?");

        return 1;}}
