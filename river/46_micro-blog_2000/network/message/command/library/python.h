
void command_python(const char* that_command) {


    char  buffer_command[1024];
    strcpy(buffer_command, "python3");

    if ( strcmp(that_command, "Python") != 0 ) {

        strcat(buffer_command, " ");
        strcat(buffer_command, path_the);
        strcat(buffer_command, "/");
        strcat(buffer_command, name_the);
        strcat(buffer_command, "/box/python/");
        strcat(buffer_command, that_command + 7);}

    system(buffer_command);}
