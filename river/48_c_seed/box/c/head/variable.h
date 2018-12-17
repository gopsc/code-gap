
int          number_args;
char**       buffer_args;

char   path_the [129] = "";
char   name_the [129] = "";
char   name_data[129] = "";

//------------------------mind---------------------------
int    flag_main      = 1;

int    flag_dog       = 1;
int    flag_start     = 0;
int    flag_show;

int    flag_client;
int    flag_server;

int    flag_sound;
int    flag_sound_show;
int    flag_sound_save;
//-------------------------net---------------------------
char     address_to[16];
int      port_to;
int      port_this;

float    step_connection;
int      size_update;
int      count_update;
int      count_update_max;

//-------------------------sound-------------------------
int      rate;
int      channels;
int      N;
