
struct gopi_connection {

           char        how        [4][17]     ;
           time_t      time       [4]         ;

           int         descriptor [2]         ;
           char        address_ip [4][129]    ;
           int         port       [2]         ;

           char        command    [4][128]    ;

           char        update     [4][10240]  ;
           int         step_update[4]         ;

           char        video      [4][102400] ;
           char        audio      [4][102400] ;

    struct gopi_system  system    [4];
    struct gopi_network network   [4];
    struct gopi_cpu     cpu       [4];
    struct gopi_memory  memory    [4];
    struct gopi_disk    disk      [4];
    struct gopi_sound   sound     [4];

           char         note      [4]   [1024];

    } gop_connection;

//==========================================================================

void clean_connection(
                               int   that_site,
                         const char* that_type
                     ) {

    if      ( strcmp(that_type, "all")     == 0 ) {


            strcpy(gop_connection.how        [that_site],  "Wait");
            strcpy(gop_connection.command    [that_site],  ""    );
            strcpy(gop_connection.update     [that_site],  ""    );
                   gop_connection.step_update[that_site]   = 0    ;

        if ( that_site == 0 ) {

            strcpy(gop_connection.address_ip [that_site],  ""    );
                   gop_connection.port       [that_site] = 0      ;}}

//==========================================================================

    else if ( strcmp(that_type, "sopi")    == 0 ) {

        strcpy(gop_connection.command    [that_site],  "");
        strcpy(gop_connection.update     [that_site],  "");
               gop_connection.step_update[that_site] = 0  ;

        if      (
                  strcmp(
                          gop_connection.how[that_site],
                         "Connectted"
                        )
                  == 0
           ) {
               strcpy(gop_connection.how[that_site], "Sop");}

        else if (
                  strcmp(
                          gop_connection.how[that_site],
                         "Sop"
                        )
               == 0
           ) {
               strcpy(gop_connection.how[that_site], "Connectted");}

        else if (
                  strcmp(
                          gop_connection.how[that_site],
                         "Connectting"
                        )
               == 0
           ) {
               strcpy(gop_connection.how[that_site], "Sopi");}

        else if (
                  strcmp(
                          gop_connection.how[that_site],
                         "Sopi"
                        )
               == 0
           ) {
               strcpy(gop_connection.how[that_site], "Connectting");}}

//==========================================================================

    else if ( strcmp(that_type, "update") == 0 ) {

        strcpy(gop_connection.update     [that_site],  "");
               gop_connection.step_update[that_site] = 0;}


    return;}