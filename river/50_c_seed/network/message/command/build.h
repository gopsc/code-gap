
void control_command(
                              int   site,
                              char* that_command,
                              char* buffer_send
                    ) {



    char that_type[16];






    if      (  site == -1 ) {

        strcpy(that_type, "master");}




    else if (
               strcmp(gop_connection.how[site], "Connectted") == 0
    ||         strcmp(gop_connection.how[site], "Sopi"      ) == 0
            ) {

        strcpy(that_type, "host");}




    else if (
               strcmp(gop_connection.how[site], "Connectting") == 0
    ||         strcmp(gop_connection.how[site], "Sop"        ) == 0
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

            action_message();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Leave.") == 0 ) {

            action_leave();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Save.") == 0 ) {

            action_save();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Save all.") == 0 ) {

            action_save_all();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Load.") == 0 ) {

            action_load();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Load all.") == 0 ) {

            action_load_all();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sprinkle little." ) == 0 ) {

            printf("...\n");
            action_seed  ("base");
            action_flower("base");
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sprinkle voice.") == 0 ) {

            printf("...\n");
            action_seed  ("alsa");
            action_flower("alsa");
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Sprinkle away.") == that_command ) {

            action_sprinkle_away(site);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sprinkle.") == 0 ) {

            printf("...\n");

            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Seed base.") == 0 ) {

            printf("...\n");
            action_seed("base");
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Seed alsa.") == 0 ) {

            printf("...\n");
            action_seed("alsa");
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Flower base.") == 0 ) {

            printf("...\n");
            action_flower("base");
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Flower alsa.") == 0 ) {

            printf("...\n");
            action_flower("alsa");
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Mars it.") == 0 ) {

            printf("...\n");
            action_mars_it();
            printf("Over.\n");}

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

            action_sopi(site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test snake.") == 0 ) {

            action_test_snake();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test fft.") == 0 ) {

            action_test_fft();}

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

            action_reload_configure();
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Reload listen.") == 0 ) {

            action_reload_listen();
            printf("Over.\n");}

//-----------------------------------------------------------------------

        else {

            action_else(site, that_command, buffer_send);}}



//=======================================================================



    else if (
                strcmp( that_type, "guest" )
                == 0
             ) {

//-----------------------------------------------------------------------

        if      ( strcmp(that_command, "Sopi.") == 0 ) {

            action_sopi(site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Update.") == that_command ) {

            action_update(site, that_command, buffer_send);}
//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Clean update.") == that_command ) {

            action_update_clean(site, buffer_send);}

//-----------------------------------------------------------------------

        else if (
                    strcmp(that_command, "Who is that?"    ) == 0
             ||     strcmp(that_command, "Who is that now?") == 0
                ) {

            action_who_is_that(site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Smile. ") == that_command ) {

            action_smile(site, that_command, buffer_send);}
//-----------------------------------------------------------------------

        else {

            action_else(site, that_command, buffer_send);}}



//=======================================================================



    else if (
                strcmp( that_type, "host" )
                == 0
             ) {



// Host's "recived commands" are "judgement"

//-----------------------------------------------------------------------

        if      ( strstr(that_command, "Update.") == that_command ) {

            action_update(site, that_command, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Clean update.") == that_command ) {

            action_update_clean(site, buffer_send);}

//-----------------------------------------------------------------------

        else {

            action_else(site, that_command, buffer_send);}}}
