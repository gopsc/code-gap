
struct gopi_connection {

           char        how        [4][16];
           time_t      time       [5];

           int         descriptor [2];
           int         connection [5];
           char        address_ip [4][128];
           int         port       [2];

           char        command    [4][128];

           char        update     [4][10240];
           int         step_update[4];
           int         flag_update[4];

           char        video      [4][102400];
           char        audio      [4][102400];

    struct gopi_system  system    [4];
    struct gopi_network network   [4];
    struct gopi_cpu     cpu       [4];
    struct gopi_memory  memory    [4];
    struct gopi_disk    disk      [4];
    struct gopi_sound   sound     [4];
    struct gopi_flag    flag      [4];

           char         note      [4]   [1024];

    } gop_connection;

//==========================================================================

int clean_connection(

                              int    that_site,
                        const char * that_type

                    ) {







// sometimes we forget this connection, we restet it all

    if (  strcmp ( that_type, "all" ) == 0  ) {


        strcpy ( gop_connection.how        [that_site],  "Wait" );

        strcpy ( gop_connection.command    [that_site],  ""     );

        strcpy ( gop_connection.audio      [that_site],  ""     );
        strcpy ( gop_connection.video      [that_site],  ""     );

//we use this function straightly

        clean_connection ( that_site, "update" );

/*
        strcpy ( gop_connection.update     [that_site],  ""    );
                 gop_connection.step_update[that_site]   = 0;
                 gop_connection.flag_update[that_site]   = 0;
*/



        if ( that_site != 0 ) {

            strcpy(gop_connection.address_ip [that_site],  ""    );
                   gop_connection.port       [that_site] = 0      ;}


// now return it

        return 1;}





//==========================================================================

    else if (  strcmp ( that_type, "sopi" ) == 0  ) {


// the clean for sopi changing


        strcpy ( gop_connection.command    [that_site],  "" );

        strcpy ( gop_connection.audio      [that_site],  "" );
        strcpy ( gop_connection.video      [that_site],  "" );


// the update end

        clean_connection ( that_site, "update" );

/*
        strcpy ( gop_connection.update     [that_site],  "" );
                 gop_connection.step_update[that_site] = 0   ;
                 gop_connection.flag_update[that_site] = 0   ;
*/






        if      (
                  strcmp(
                          gop_connection.how[that_site],

                         "Connectted"
                        )
                  == 0
           ) {

               strcpy ( gop_connection.how[that_site], "Sop" );

               return 1;}


        else if (
                  strcmp(
                          gop_connection.how[that_site],

                         "Sop"
                        )
               == 0
           ) {

               strcpy ( gop_connection.how[that_site], "Connectted" );

               return 1;}


        else if (
                  strcmp(
                          gop_connection.how[that_site],

                         "Connectting"
                        )
               == 0
           ) {

               strcpy ( gop_connection.how[that_site], "Sopi" );

               return 1;}


        else if (
                  strcmp(
                          gop_connection.how[that_site],

                         "Sopi"
                        )
               == 0
           ) {

               strcpy ( gop_connection.how[that_site], "Connectting" );

               return 1;}



// somethong went to this and return a wrong

    return 0;}












    else if (  strcmp ( that_type, "update" ) == 0  ) {

// we just don't wanna update this time
//
// just clean all the update things

        strcpy ( gop_connection.update     [that_site],  "" );
                 gop_connection.step_update[that_site] = 0;
                 gop_connection.flag_update[that_site] = 0;

        return 1;}










// sometimes another didn't send the message, it will be stack, then this can fix it

    else if (  strcmp ( that_type, "check" ) == 0  ) {



// the connect is over but the recive/send is still running

        if (
               strcmp ( gop_connection.how        [ that_site ],  "Wait" ) == 0

        &&              gop_connection.descriptor [ that_site ] != 0
           ) {


// for connector, the description of connection is the description of network
//
//  so we just shut it down for a little time to let the mistake do not happen
//
// but if something just restart it when this check shut it down but the connector file does not return
//
//   a mistake coule happen
//
// maybe i should not allow the the connector turn on?

            if (  that_site == 0  ) {

                information_flag.connector = 0;}


// shut it down



// just for connctor
//
// restart

            if ( that_site == 0 ) {

                information_flag.connector = 1;}}}







// something goes wrong

    return 0;}
