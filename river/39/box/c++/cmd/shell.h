
void cmd_get(const char* that_commands, char* that_result) {



    FILE  *file_cmd;
    char   that_buffer[1025];
           that_result[0]   = '\0';



    file_cmd = popen(that_commands, "r");

    if (file_cmd != NULL) {

        while ( fgets(that_buffer, 1024, (FILE*)file_cmd) != NULL ) {

            strcat(that_result, that_buffer);}}

    pclose(file_cmd);}
