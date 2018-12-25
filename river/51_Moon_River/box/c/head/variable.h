
int          number_args;
char**       buffer_args;

char   path_the [129] = "";
char   name_the [129] = "";
char   name_data[129] = "";

//------------------------mind---------------------------
int    flag_main       = 1;
int    flag_deamon     = 0;

int    flag_dog        = 1;
int    flag_start      = 0;
int    flag_show       = 0;

int    flag_client     = 0;
int    flag_server     = 0;

int    flag_sound      = 0;
int    flag_sound_show = 0;
int    flag_sound_save = 0;
//-------------------------net---------------------------
char     address_to[16];
int      port_to;
int      port_this;

float    step_connection;
char     symbol_next[129];

int      size_update;
int      count_update;
int      count_update_max;

//-------------------------sound-------------------------
int      rate;
int      channels;
int      N;
