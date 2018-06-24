


/*

 maybe we should bring the struct to the function

 but it one network there

 and maybe not

*/



int clean_connection (

//                         struct gop_network that_network,

                               int          that_site,

                         const char *       that_type

                     ) {













// sometimes we forget this connection, we restet it all

    if (  strcmp ( that_type, "all" ) == 0  ) {


        strcpy ( gop_connection . how        [ that_site ],  "Wait" );

        strcpy ( gop_connection . command    [ that_site ],  ""     );

        strcpy ( gop_connection . audio      [ that_site ],  ""     );
        strcpy ( gop_connection . video      [ that_site ],  ""     );



/*

 we use this function straightly

 clean the update message

*/

        clean_connection ( that_site, "update" );

/*
        strcpy ( gop_connection . update      [ that_site ],  ""    );
                 gop_connection . step_update [ that_site ]   = 0;
                 gop_connection . flag_update [ that_site ]   = 0;
*/







/*

 not clean the address for connector

  these will keep to save the address we go to

*/

        if (  that_site != 0  ) {

            strcpy ( gop_connection . address_ip [ that_site ],  ""    );

                     gop_connection . port       [ that_site ] = 0      ;}







// now return it

        return 1;}


















    else if (  strcmp ( that_type, "sopi" ) == 0  ) {


// the clean for sopi changing


        strcpy ( gop_connection . command [ that_site ],  "" );



// it is coming,,

/*
        strcpy ( gop_connection . audio [ that_site ],  "" );
        strcpy ( gop_connection . video [ that_site ],  "" );
*/




// the update end

        clean_connection ( that_site, "update" );

/*
        strcpy ( gop_connection . update      [ that_site ],  "" );
                 gop_connection . step_update [ that_site ] = 0   ;
                 gop_connection . flag_update [ that_site ] = 0   ;
*/




        if      (
                  strcmp(
                          gop_connection . how [ that_site ],

                         "Connectted"
                        )
                  == 0
           ) {

               strcpy ( gop_connection . how [ that_site ], "Sop" );

               return 1;}




        else if (

                  strcmp (

                           gop_connection . how [ that_site ],

                          "Sop"

                         )
                  == 0

                ) {

               strcpy ( gop_connection . how [ that_site ], "Connectted" );

               return 1;}



        else if (

                  strcmp (

                            gop_connection . how [ that_site ],

                           "Connectting"

                          )
                  == 0

                ) {

               strcpy ( gop_connection . how [ that_site ], "Sopi" );

               return 1;}



        else if (

                  strcmp (

                          gop_connection . how [ that_site ],

                         "Sopi"

                        )
                   == 0

                ) {

               strcpy ( gop_connection . how [ that_site ], "Connectting" );

               return 1;}}













/*

 it's in plan should, sometimes

 somethong went to this and return a zero

*/


    return 0;}


















    else if (  strcmp ( that_type, "update" ) == 0  ) {

/*

 we just don't wanna update this time

 just clean all the update things

*/

        strcpy ( gop_connection.update      [ that_site ],  "" );
                 gop_connection.step_update [ that_site ] = 0;
                 gop_connection.flag_update [ that_site ] = 0;

        return 1;}









/*

 let them quit

*/

    else if  (  strcmp ( that_type, "quit"  )  ==  0  ) {

        return 1;}




// something goes wrong

    return 0;}
