
int control_command(
                       int   that_site,
                       char* that_command,
                       char* buffer_send
                   ) {



    char that_type[16];






    if      (  that_site == -1 ) {

        strcpy(that_type, "master");}




    else if (
               strcmp(gop_connection.how[that_site], "Connectted") == 0
    ||         strcmp(gop_connection.how[that_site], "Sopi"      ) == 0
            ) {

        strcpy(that_type, "host");}




    else if (
               strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||         strcmp(gop_connection.how[that_site], "Sop"        ) == 0
            ) {

        strcpy(that_type, "guest");}











    if ( strcmp(that_type, "master") == 0 ) {




        if      ( strcmp(that_command, "Help." ) == 0 ) {

            action_help();}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Connect ") == that_command ) {

            that_command[strlen(that_command)-1] = '\0';
            action_connect(that_command);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, " .") == 0 ) {

            action_information();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Leave.") == 0 ) {

            action_leave();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sprinkle little." ) == 0 ) {

            output_print ( "string", "...\n"   );
            action_seed  ( "base"              );
            action_flower( "base"              );
            output_print ( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sprinkle voice.") == 0 ) {

            output_print ( "string", "...\n"   );
            action_seed  ( "alsa"              );
            action_flower( "alsa"              );
            output_print ( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Sprinkle away.") == that_command ) {

            action_sprinkle_away(that_site);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Seed base.") == 0 ) {

            output_print( "string", "...\n"   );
            action_seed ( "base"              );
            output_print( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Seed alsa.") == 0 ) {

            output_print( "string", "...\n"   );
            action_seed ( "alsa"              );
            output_print( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Flower base.") == 0 ) {

            output_print ( "string", "...\n"   );
            action_flower( "base"              );
            output_print ( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Flower alsa.") == 0 ) {

            output_print ( "string", "...\n"   );
            action_flower( "alsa"              );
            output_print ( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Mars it.") == 0 ) {

            output_print  ( "string", "...\n"  );
            action_mars_it(                    );
            output_print  ( "string", "Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "TxL.") == 0 ) {

            output_print( "string", "...\n"  );
            action_TxL  (                    );
            output_print( "string", "Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Show.") == 0 ) {

            action_show();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sound.") == 0 ) {

            action_sound();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sound show.") == 0 ) {

            action_show_sound();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sopi.") == 0 ) {

            action_sopi(that_site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test snake.") == 0 ) {

            test_ft("snake");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test fft.") == 0 ) {

            test_ft("fft"  );}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Shell ") != NULL ) {

            that_command[strlen(that_command)-1] = '\0';

            action_shell(that_command);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Python") != NULL ) {

            that_command[strlen(that_command)-1] = '\0';

            action_python(that_command);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Command ") != NULL ) {

            that_command[strlen(that_command)-1] = '\0';
            action_command(that_command);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Reload configure.") == 0 ) {

            action_reload_configure(                     );
            output_print           ( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Reload listen.") == 0 ) {

            action_reload_listen(                     );
            output_print        ( "string", "Over.\n" );}

//-----------------------------------------------------------------------

        else {

            action_else(that_site, that_command, buffer_send);

            return 0;}


        reuturn 1;}



//=======================================================================

    else if (
                strcmp( that_type, "guest" )
                == 0
             ) {

//-----------------------------------------------------------------------

        if      ( strcmp(that_command, "Sopi.") == 0 ) {

            action_sopi(that_site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Update.") == that_command ) {

            action_update(that_site, that_command, buffer_send);}
//-----------------------------------------------------------------------

        else if ( strstr(that_command,                     "Clean update.")  == that_command ) {

            if  ( strcmp(gop_connection.update[that_site], "")               == 0            ) {

                action_update_clean(that_site, buffer_send);}}

//-----------------------------------------------------------------------

        else if (
                    strcmp(that_command, "Who is that?"    ) == 0
             ||     strcmp(that_command, "Who is that now?") == 0
                ) {

            action_who_is_that(that_site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Smile. ") == that_command ) {

            action_smile(that_site, that_command, buffer_send);}

//-----------------------------------------------------------------------

        else {

            action_else(that_site, that_command, buffer_send);

            return 0;}


        return 1;}



//=======================================================================



    else if (
                strcmp( that_type, "host" )
                == 0
             ) {



// Host's "recived commands" are "judgement"

//-----------------------------------------------------------------------

        if ( strstr(that_command, "Clean update.") == that_command ) {

            action_update_clean(that_site, buffer_send);}

//-----------------------------------------------------------------------

        else {

            action_else(that_site, that_command, buffer_send);

            return 0;}


        return 1;}


    return 0;}
