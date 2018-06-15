



int load_about_mate (

                              gopi_about   that_about,

                              char *     buffer_convent

                          ) {






// we use malloc to do this soon

//      reallac ( pointer_about, number_mate + 1 );






               pointer_convent = strchr ( pointer_convent, '\n' ) + 1;
        char * pointer_next    = strchr ( pointer_convent, '\n' )    ;




        int number_cores;
        int number_frequency;

        int number_disk_size;
        int number_disk_rate;

        int number_memory_total;
        int number_memory_rate;

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

