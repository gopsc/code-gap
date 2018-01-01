
void command_python(char* that_command) {


    char buffer_command[65];

    if ( strcmp(that_command, "Python ") != 0 ) {

        strcpy(buffer_command, "python3 ");
        strcat(buffer_command, path_the);
        strcat(buffer_command, "/");
        strcat(buffer_command, name_the);
        strcat(buffer_command, "/box/python/");
        strcat(buffer_command, strstr(that_command, "Python") + 7);}




    system(buffer_command);}