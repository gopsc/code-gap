
string info_get() {
//|===============================================================================|
/*|*/   string msg;                                                             //|
/*|*/   msg += "------------------------------";                    msg += '\n';//|
/*|*/   msg += info_time;                                         //msg += '\n';//|
/*|*/                                                                           //|
/*|*/   msg += info_name;                                           msg += ','; //|
/*|*/   msg += info_system;                                         msg += '\n';//|
/*|*/                                                                           //|
/*|*/   msg += to_string(info_cpu.cores);                           msg += ','; //|
/*|*/   msg += to_string(info_cpu.f);                               msg += ','; //|
/*|*/   msg += to_string(info_cpu.temperature);                     msg += ','; //|
/*|*/   msg += to_string(info_cpu.rate);                            msg += '\n';//|
/*|*/                                                                           //|
/*|*/   msg += to_string(info_memory.total);                        msg += ","; //|
/*|*/   msg += to_string(info_memory.free/info_memory.total);       msg += '%'; //|
/*|*/                                                               msg += '\n';//|
/*|*/   msg += to_string(info_memory.buffers);                      msg += ","; //|
/*|*/   msg += to_string(info_memory.cached/info_memory.buffers);   msg += '%'; //|
/*|*/                                                               msg += '\n';//|
/*|*/                                                                           //|
/*|*/   msg += to_string(info_sound.num_control);                   msg += ','; //|
/*|*/   msg += to_string(info_sound.num_capture);                   msg += ','; //|
/*|*/   msg += to_string(info_sound.num_playback);                  msg += '.'; //|
/*|*/                                                               msg += '\n';//|
/*|*/   msg += "------------------------------";                    msg += '\n';//|
//|===============================================================================|
        return msg;}




