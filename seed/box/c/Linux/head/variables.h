
int          number_args;
char**       buffer_args;

char   path_the   [128] = "";
char   name_the   [128] = "";
char   name_data  [128] = "";
char   name_backup[128] = "";

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
char   symbol_next[128];

int    size_update;

//-------------------------sound-------------------------

int    rate;
int    channels;
int    N;


