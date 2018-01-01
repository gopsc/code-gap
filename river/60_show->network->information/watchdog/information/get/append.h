
void* information_append(
                                   char*        message     ,
                            struct gopi_system  that_system ,
                            struct gopi_network that_network,
                            struct gopi_cpu     that_cpu    ,
                            struct gopi_memory  that_memory ,
                            struct gopi_disk    that_disk   ,
                            struct gopi_sound   that_sound
                        ) {

//|========================================================================================================================================================|
/*|*/   char buffer_message[129];                                                                                                                        //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Name             : ");                                                                                                          //|
/*|*/   strcat(message, that_system.name);                                                                                                       //|
/*|*/   strcat(message, "System           : ");                                                                                                          //|
/*|*/   strcat(message, that_system.system);                                                                                                      //|
/*|*/   strcat(message, "User             : ");                                                                                                          //|
/*|*/   strcat(message, that_system.user);                                                                                  strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Time             : ");                     gcvt(time(NULL),                        10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "IP               : ");                     gcvt(that_network.number,        10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   for ( int i=1 ; i<=that_network.number; i++ )  {                                                                            //|
/*|*/   for ( int ii=1; ii<=16-strlen(that_network.ip[i][1]); ii++ ) {                                                                            //|
/*|*/       strcat(message, " ");}                                                                                                                       //|
/*|*/       strcat(message, that_network.ip[i][1]);                                                                                               //|
/*|*/       strcat(message, " : ");                                                                                                                      //|
/*|*/       strcat(message, that_network.ip[i][2]);                                                                                               //|
/*|*/       strcat(message, "\n");}                                                                                                                      //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "CPU cores        : ");                     gcvt(that_cpu.cores,             10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU frequency    : ");                     gcvt(that_cpu.frequency,         10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU temperature  : ");                     gcvt(that_cpu.temperature,       10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU rate         : ");                     gcvt(that_cpu.rate,              10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Memory total     : ");                     gcvt(that_memory.total,          10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Memory used rate : ");                     gcvt(100-(100*that_memory.free)/that_memory.total, 10, buffer_message);//|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Disk available   : ");                     gcvt(that_disk.available,        10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Disk user rate   : ");                     gcvt(100-(100*that_disk.used)/that_disk.available, 10, buffer_message);//|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Sound control    : ");                     gcvt(that_sound.number_control,  10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Sound capture    : ");                     gcvt(that_sound.number_capture,  10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Sound playback   : ");                     gcvt(that_sound.number_playback, 10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Status           : ");                                                                                                          //|
/*|*/   if ( flag_main   ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_dog    ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_server ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_client ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_sound  ) { strcat(message, "o"); } else { strcat(message, " "); }                                                strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
//|========================================================================================================================================================|

        }