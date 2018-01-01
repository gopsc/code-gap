
void control_command(
                              int   site,
                              char* that_command,
                              char* buffer_send
                    ) {



    char that_type[16];






    if      (  site == -1 ) {

        strcpy(that_type, "guest");}




    else if (
               strcmp(gop_connection.how[site], "Connectted") == 0
    or         strcmp(gop_connection.how[site], "Sopi"      ) == 0
            ) {

        strcpy(that_type, "host");}




    else if (
               strcmp(gop_connection.how[site], "Connectting") == 0
    or         strcmp(gop_connection.how[site], "Sop"        ) == 0
            ) {

        strcpy(that_type, "guest");}











    if ( strcmp(that_type, "guest") == 0 ) {


        

        if      ( strcmp(that_command, "Help." ) == 0 ) {

            command_help();}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Connect ") == that_command ) {

            that_command[strlen(that_command)-1] = '\0';
            command_connect(that_command);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, " .") == 0 ) {

            command_message();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Quit.") == 0 ) {

            command_quit();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Save.") == 0 ) {

            command_save();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Load.") == 0 ) {

            command_load();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test." ) == 0 ) {

            command_test();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test alsa.") == 0 ) {

            command_test_alsa();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Install.") == 0 ) {

            command_install();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Remove.") == 0 ) {

            command_remove();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Show.") == 0 ) {

            command_show();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sound.") == 0 ) {

            command_sound();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sound show.") == 0 ) {

            command_show_sound();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Sopi.") == 0 ) {

            command_sopi(site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Update.") == that_command ) {

            command_update(site, that_command, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test dft.") == 0 ) {

            command_test_dft();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Test fft.") == 0 ) {

            command_test_fft();}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Command ") != NULL ) {

            that_command[strlen(that_command)-1] = '\0';
            command_command(that_command);}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Reload configure.") == 0 ) {

            command_reload_configure();}

//-----------------------------------------------------------------------

        else if ( strcmp(that_command, "Reload listen.") == 0 ) {

            command_reload_listen();}

//-----------------------------------------------------------------------

        else if (
                    strcmp(that_command, "Who is that?"    ) == 0
             or     strcmp(that_command, "Who is that now?") == 0
                ) {

            command_who_is_that(site, buffer_send);}

//-----------------------------------------------------------------------

        else if ( strstr(that_command, "Smile. ") == that_command ) {

            command_smile(site, that_command, buffer_send);}

//-----------------------------------------------------------------------

        else {

            command_else(site, that_command, buffer_send);}}








    else if (
                strcmp(
                        that_type,
                       "host"
                      )
                == 0
            ) {






        if ( strstr(that_command, "Update.") == that_command ) {

            command_update(site, that_command, buffer_send);}


//-----------------------------------------------------------------------

        else {

            command_else(site, that_command, buffer_send);}}}