#include "./All/All.h"
#include "./Linux/Linux.h"
//----------------------------------------------------
bool          flag_info  = false;
//----------------------------------------------------
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
/*|*/   msg += to_string(point_capture);                            msg += ','; //|
/*|*/   msg += to_string(point_playback);                           msg += '.'; //|
/*|*/                                                               msg += '\n';//|
/*|*/   msg += "------------------------------";                    msg += '\n';//|
//|===============================================================================|
        return msg;}

void* gop_information(void*){
    while(true){
        info_time_get();
        info_name_get();
        info_system_get();
        info_memory_get();
        info_cpu_get();
        //info_ip_get();
        info_sound_get();

        flag_info = true;}}


