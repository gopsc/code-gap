
int          number_args;
char**       buffer_args;

char   path_the [129] = "";
char   name_the [129] = "";
char   name_data[129] = "";

//------------------------mind---------------------------
struct gopi_flag {
    int    main      ;
    int    deamon    ;

    int    dog       ;
    int    start     ;
    int    show      ;

    int    client    ;
    int    server    ;

    int    sound     ;
    int    sound_show;
    int    sound_save;} information_flag;
//-------------------------net---------------------------
char   address_to[16];
int    port_to;
int    port_this;

float  step_connection;
char   symbol_next[129];

int    size_update;
int    count_update;
int    count_update_max;

//-------------------------sound-------------------------
int    rate;
int    channels;
int    N;
