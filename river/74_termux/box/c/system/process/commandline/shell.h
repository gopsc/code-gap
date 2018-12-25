
void commandline_get(const char* that_commands, char* that_result) {



    FILE  *file_commandline;
    char   that_buffer[1025];
           that_result[0]   = '\0';



    file_commandline = popen(that_commands, "r");

    if (file_commandline != NULL) {

        while ( fgets(that_buffer, 1024, (FILE*)file_commandline) != NULL ) {

            strcat(that_result, that_buffer);}}

    pclose(file_commandline);}
