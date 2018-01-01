
//------------------------mind---------------------------
bool     flag_mind      = true;
bool     flag_dog       = true;
bool     flag_show      = false;
bool     flag_client    = true;
bool     flag_server    = true;
bool     flag_sound     = false;
int      flag_reboot    = 60;


//-------------------------net---------------------------
char     address_to[16]        = "192.168.1.112";
int      port_to               = 520;
int      port_this             = 520;

float    step_connect          = 0.2;
int      size_update           = 1000;
int      count_update          = 0;
int      count_update_max      = 3;



//-------------------------sound-------------------------
int      rate                  = 44100;
int      channels              = 1;

int      N                     = 1024;
//-----------------------calculate-----------------------
string calculate_now = "Free";





string   path_the                     = "/opt";
string   name_the                     = "7lc";


//---------------------information"----------------------
string   cmd_system_name              = "uname -n";
string   cmd_system_system            = "uname -s";
string   path_temperature             = "/sys/class/thermal/thermal_zone0/temp";
string   cmd_temperature              = "cat /sys/class/thermal/thermal_zone0/temp";
//-----------------------temporary"----------------------
string   path_temporary               = "/opt/gop/temporary";
string   cmd_temporary                = "> /opt/gop/temporary";
//-------------------------cmd---------------------------
string   cmd_save                     = "bash /opt/7lc/box/Linux/save.sh";
string   cmd_load                     = "bash /opt/7lc/box/Linux/load.sh";
string   cmd_install                  = "bash /opt/7lc/box/Linux/install.sh";

string   cmd_test                     = "bash /opt/7lc/box/Linux/net.sh";
string   cmd_test_alsa                = "bash /opt/7lc/box/Linux/alsa.sh";

string   cmd_ssh_restart_sudo         = "sudo service ssh restart";
string   cmd_reboot                   = "reboot";
//------------------------update"------------------------
string   cmd_update_rm                = "rm -rf /opt/7lc";
string   cmd_update_mv                = "mv /opt/gop/downloads/7lc /opt/";
//-------------------------sound-------------------------
char     device_p[7]                  = "hw:0,0";
char     device_c[7]                  = "hw:2,0";
string   path_sound                   = "/opt/gop/sound";
