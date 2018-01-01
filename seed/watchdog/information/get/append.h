
int information_append(
                                 char*        message     ,
                          struct gopi_system  that_system ,
                          struct gopi_network that_network,
                          struct gopi_cpu     that_cpu    ,
                          struct gopi_memory  that_memory ,
                          struct gopi_disk    that_disk   ,
                          struct gopi_sound   that_sound  ,
                          struct gopi_flag    that_flag
                      ) {

//|========================================================================================================================================================|
/*|*/   char buffer_message[32];                                                                                                                         //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Name             : ");                                                                                                          //|
/*|*/   strcat(message, that_system.name);                                                                                         strcat(message, "\n");//|
/*|*/   strcat(message, "System           : ");                                                                                                          //|
/*|*/   strcat(message, that_system.system);                                                                                       strcat(message, "\n");//|
/*|*/   strcat(message, "User             : ");                                                                                                          //|
/*|*/   strcat(message, that_system.user);                                                                                         strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Time             : ");                     snprintf(buffer_message, 31, "%ld", time(NULL));                                     //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "IP               : ");                     snprintf(buffer_message, 31, "%d", that_network.number);                             //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   int i ;                                                                                                                                          //|
/*|*/   int ii;                                                                                                                                          //|
/*|*/   for ( i=1 ; i<=that_network.number; i++ )      {                                                                                                 //|
/*|*/   for ( ii=1; ii<=16-strlen(that_network.ip[i][1]); ii++ )     {                                                                                   //|
/*|*/       strcat(message, " ");}                                                                                                                       //|
/*|*/       strcat(message, that_network.ip[i][1]);                                                                                                      //|
/*|*/       strcat(message, " : ");                                                                                                                      //|
/*|*/       strcat(message, that_network.ip[i][2]);                                                                                                      //|
/*|*/       strcat(message, "\n");}                                                                                                                      //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "CPU cores        : ");                     snprintf(buffer_message, 31, "%d", that_cpu.cores);                                  //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU frequency    : ");                     snprintf(buffer_message, 31, "%d", that_cpu.frequency);                              //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU temperature  : ");                     snprintf(buffer_message, 31, "%d", that_cpu.temperature);                            //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU rate         : ");                     snprintf(buffer_message, 31, "%d", that_cpu.rate);                                   //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Memory total     : ");                     snprintf(buffer_message, 31, "%lu", that_memory.total);                              //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Memory used rate : ");                     snprintf(buffer_message, 31, "%lu", 100-(100*that_memory.free)/that_memory.total);   //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Disk available   : ");                     snprintf(buffer_message, 31, "%lu", that_disk.available);                            //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Disk user rate   : ");                     snprintf(buffer_message, 31, "%lu",     (100*that_disk.used)/that_disk.available);   //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Sound control    : ");                     snprintf(buffer_message, 31, "%d", that_sound.number_control);                       //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Sound capture    : ");                     snprintf(buffer_message, 31, "%d", that_sound.number_capture);                       //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Sound playback   : ");                     snprintf(buffer_message, 31, "%d", that_sound.number_playback);                      //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Status           : ");                                                                                                          //|
/*|*/   if ( that_flag.dog    ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                           //|
/*|*/   if ( that_flag.server ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                           //|
/*|*/   if ( that_flag.client ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                           //|
/*|*/   if ( that_flag.sound  ) { strcat(message, "o"); } else { strcat(message, " "); }                                           strcat(message, "\n");//|
/*|*/   if ( that_flag.deamon ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                           //|
/*|*/                                                                                                                                                    //|
//|========================================================================================================================================================|

        return 1;}
