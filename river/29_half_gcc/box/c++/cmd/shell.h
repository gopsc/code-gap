
void cmd_get(const char* commands, char* that_result) {



    FILE *read;
    char  that_buffer[10];
          that_result[0] = '\0';



    read = popen(commands, "r");

    if (read != NULL) {

        while ( fread(that_buffer, sizeof(char), 10, read) != 0 ) {

            strcat(that_result, that_buffer);}}

    pclose(read);}
