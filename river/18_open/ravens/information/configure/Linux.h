
//---------------------information"----------------------
string   path_temperature             = "/sys/class/thermal/thermal_zone0/temp";
//-----------------------temporary"----------------------
string   path_temporary_shell         = "/opt/gop/temporary/shell.temporary";
string   cmd_temporary_shell          = "> /opt/gop/temporary/shell.temporary";
//-------------------------note--------------------------
string   path_note                    = "/opt/gop/note/";
//-------------------------cmd---------------------------
string   cmd_save                     = "bash /opt/ravens/box/Linux/save.sh";
string   cmd_load                     = "bash /opt/ravens/box/Linux/load.sh";
string   cmd_install                  = "bash /opt/ravens/box/Linux/install.sh";
string   cmd_download                 = "bash /opt/ravens/box/Linux/download.sh";
string   cmd_ssh                      = "service ssh restart";
string   cmd_ssh_sudo                 = "sudo service ssh restart";
string   cmd_reboot                   = "reboot";
string   cmd_temperature              = "cat /sys/class/thermal/thermal_zone0/temp";
//------------------------update"------------------------
string   update_name                  = "ravens";
string   path_update_start            = "/opt/ravens";
string   path_update_download         = "/opt/gop/downloads";
string   path_update_download_ravens  = "/opt/gop/downloads/ravens";

string   cmd_update_rm                = "rm -rf /opt/ravens";
string   cmd_update_mv                = "mv /opt/gop/downloads/ravens /opt/";
//-------------------------sound-------------------------
char     device_p[7]                  = "hw:0,0";
char     device_c[7]                  = "hw:2,0";
string   path_sound                   = "/opt/gop/sound";
