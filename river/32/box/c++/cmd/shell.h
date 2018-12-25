
void cmd_get(const char* commands, char* that_result) {



    FILE  *fp_cmd;
    char   that_buffer[10];
           that_result[0] = '\0';



    fp_cmd = popen(commands, "r");

    if (fp_cmd != NULL) {

        while ( fgets(that_buffer, 1024, (FILE*)fp_cmd) != NULL ) {

            strcat(that_result, that_buffer);}}

    pclose(fp_cmd);}
