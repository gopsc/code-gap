
void action_shell( char* that_command ) {


    char buffer_command[65];

    if ( strstr(that_command, "Shell ")  != NULL ) {

        strcpy(buffer_command, "bash ");
        strcat(buffer_command, path_the);
        strcat(buffer_command, "/");
        strcat(buffer_command, name_the);
        strcat(buffer_command, "/box/Linux/");
        strcat(buffer_command, strstr(that_command, "Shell ") + 6);}

    system(buffer_command);}