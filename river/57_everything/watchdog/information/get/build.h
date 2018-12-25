
void* information_get( char* message ) {

//|========================================================================================================================================================|
/*|*/   char buffer_message[129];                                                                                                                        //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Name             : ");                                                                                                          //|
/*|*/   strcat(message, information_system.name);                                                                                                       //|
/*|*/   strcat(message, "System           : ");                                                                                                          //|
/*|*/   strcat(message, information_system.system);                                                                                                      //|
/*|*/   strcat(message, "User             : ");                                                                                                          //|
/*|*/   strcat(message, information_system.user);                                                                                  strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Time             : ");                     gcvt(time(NULL),                        10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "IP               : ");                     gcvt(information_network.number,        10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   for ( int i=1 ; i<=information_network.number;               i++ )  {                                                                            //|
/*|*/   for ( int ii=1; ii<=16-strlen(information_network.ip[i][1]); ii++ ) {                                                                            //|
/*|*/       strcat(message, " ");}                                                                                                                       //|
/*|*/       strcat(message, information_network.ip[i][1]);                                                                                               //|
/*|*/       strcat(message, " : ");                                                                                                                      //|
/*|*/       strcat(message, information_network.ip[i][2]);                                                                                               //|
/*|*/       strcat(message, "\n");}                                                                                                                      //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "CPU cores        : ");                     gcvt(information_cpu.cores,             10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU frequency    : ");                     gcvt(information_cpu.frequency,         10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU temperature  : ");                     gcvt(information_cpu.temperature,       10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU rate         : ");                     gcvt(information_cpu.rate,              10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Memory total     : ");                     gcvt(information_memory.total,          10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Memory used rate : ");                     gcvt(100-(100*information_memory.free)/information_memory.total, 10, buffer_message);//|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Disk available   : ");                     gcvt(information_disk.available,        10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Disk user rate   : ");                     gcvt(100-(100*information_disk.used)/information_disk.available, 10, buffer_message);//|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "Sound control    : ");                     gcvt(information_sound.number_control,  10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Sound capture    : ");                     gcvt(information_sound.number_capture,  10, buffer_message);                         //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "Sound playback   : ");                     gcvt(information_sound.number_playback, 10, buffer_message);                         //|
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