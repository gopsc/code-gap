
string information_get() {

//|===============================================================================|
/*|*/   string msg;                                                             //|
/*|*/   msg += "------------------------------";                    msg += '\n';//|
/*|*/   msg += info_name;                                           msg += ','; //|
/*|*/   msg += info_system;                                         msg += '\n';//|
/*|*/                                                               msg += '\n';//|
/*|*/   msg += "TIME            :";                                             //|
/*|*/   msg += to_string(info_time);                                msg += '\n';//|
/*|*/                                                                           //|
/*|*/   msg += "IP              :";                                            ;//|
/*|*/   msg += to_string(point_ip[1]);                              msg += '\n';//|
/*|*/   for ( int i=1 ; i<=point_ip[1]; i++ ) {                                 //|
/*|*/       msg += "                 ";                                         //|
/*|*/       msg += info_ip[1][i][2];                                            //|
/*|*/       msg += '\n';}                                                       //|
/*|*/                                                               msg += '\n';//|
/*|*/   msg += "CPU CORES       :";                                             //|
/*|*/   msg += to_string(info_cpu.cores);                           msg += '\n';//|
/*|*/   msg += "CPU F           :";                                             //|
/*|*/   msg += to_string(info_cpu.f);                               msg += '\n';//|
/*|*/   msg += "CPU TEMPERATURE :";                                             //|
/*|*/   msg += to_string(info_cpu.temperature);                     msg += '\n';//|
/*|*/   msg += "CPU RATE        :";                                             //|
/*|*/   msg += to_string(info_cpu.rate);                            msg += '%'; //|
/*|*/                                                               msg += '\n';//|
/*|*/                                                               msg += '\n';//|
/*|*/   msg += "MEM TOTAL       :";                                             //|
/*|*/   msg += to_string(info_memory.total);                        msg += '\n';//|
/*|*/   msg += "MEM USED RATE   :";                                             //|
/*|*/   msg += to_string(100-(100*info_memory.free)/info_memory.total);         //|
/*|*/                                                               msg += '%'; //|
/*|*/                                                               msg += '\n';//|
/*|*/                                                               msg += '\n';//|
/*|*/                                                               msg += '\n';//|
/*|*/   msg += "SOUND CONTROL   :";                                             //|
/*|*/   msg += to_string(info_sound.num_control);                   msg += '\n';//|
/*|*/   msg += "SOUND CAPTURE   :";                                             //|
/*|*/   msg += to_string(info_sound.num_capture);                   msg += '\n';//|
/*|*/   msg += "SOUND PLAYBACK  :";                                             //|
/*|*/   msg += to_string(info_sound.num_playback);                  msg += '\n';//|
/*|*/   msg += "------------------------------";                    msg += '\n';//|
//|===============================================================================|

    return msg;}












