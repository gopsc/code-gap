

/*

 the configurations

 used here and everywhere

 maybe then we should put them every where

 let it go

*/


struct gopi_configurations {




// about the option u open the program

    int    number_options;
    char * buffer_options [ 8 ];


// about the file-system

    char   path_the    [ 128 ];
    char   name_the    [ 128 ];
    char   name_date   [ 128 ];
    char   name_backup [ 128 ];


//-------------------------net---------------------------

    char   address_to [ 16 ];
    int    port_to;
    int    port_this;

    float  step_connection;
    char   symbol_next [ 128 ];

    int    size_update;

//-------------------------sound-------------------------

    int    rate;
    int    channels;
    int    N;



    } gop_configurations;

