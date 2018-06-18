
void* information_get( char* message ) {

//|========================================================================================================================================================|
/*|*/   char buffer_message[129];                                                                                                                        //|
/*|*/                                                                                                                                                    //|
/*|*/   strcpy(message, "------------------------------");                                                                         strcat(message, "\n");//|
/*|*/   strcat(message, "NAME            :");                                                                                                            //|
/*|*/   strcat(message, information_name);                                                                                                               //|
/*|*/   strcat(message, "SYSTEM          :");                                                                                                            //|
/*|*/   strcat(message, information_system);                                                                                                             //|
/*|*/   strcat(message, "USER            :");                                                                                                            //|
/*|*/   strcat(message, information_user);                                                                                         strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "TIME            :");                     gcvt(time(NULL),                        10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "IP              :");                     gcvt(information_ip_number,             10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   for ( int i=1 ; i<=information_ip_number;               i++ )  {                                                                                 //|
/*|*/   for ( int ii=1; ii<=15-strlen(information_ip[i][1]); ii++ ) {                                                                                    //|
/*|*/       strcat(message, " ");}                                                                                                                       //|
/*|*/       strcat(message, information_ip[i][1]);                                                                                                       //|
/*|*/       strcat(message, " :");                                                                                                                       //|
/*|*/       strcat(message, information_ip[i][2]);                                                                                                       //|
/*|*/       strcat(message, "\n");}                                                                                                                      //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "CPU CORES       :");                     gcvt(information_cpu.cores,             10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU FREQUENCY   :");                     gcvt(information_cpu.frequency,         10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU TEMPERATURE :");                     gcvt(information_cpu.temperature,       10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "CPU RATE        :");                     gcvt(information_cpu.rate,              10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "MEM TOTAL       :");                     gcvt(information_memory.total,          10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "MEM USED RATE   :");                     gcvt(100-(100*information_memory.free)/information_memory.total, 10, buffer_message);  //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "DISK AVAILABLE  :");                     gcvt(information_disk.available,        10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "DISK USED RATE  :");                     gcvt(100-(100*information_disk.used)/information_disk.available, 10, buffer_message);  //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "%"); //|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/   strcat(message, "SOUND CONTROL   :");                     gcvt(information_sound.number_control,  10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "SOUND CAPTURE   :");                     gcvt(information_sound.number_capture,  10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/   strcat(message, "SOUND PLAYBACK  :");                     gcvt(information_sound.number_playback, 10, buffer_message);                           //|
/*|*/   strcat(message, buffer_message);                                                                                           strcat(message, "\n");//|
/*|*/                                                                                                                              strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "Status          :");                                                                                                            //|
/*|*/   if ( flag_mind   ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_dog    ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_server ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_client ) { strcat(message, "o"); } else { strcat(message, " "); } strcat(message, " ");                                                //|
/*|*/   if ( flag_sound  ) { strcat(message, "o"); } else { strcat(message, " "); }                                                strcat(message, "\n");//|
/*|*/                                                                                                                                                    //|
/*|*/   strcat(message, "------------------------------");                                                                         strcat(message, "\n");//|
//|========================================================================================================================================================|

        }