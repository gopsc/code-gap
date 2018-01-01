


int action_python(

                     char* that_command

                 ) {






    char   buffer_command[65];

    strcpy(buffer_command, "");




    if ( strstr(that_command, "Python")  == that_command ) {



        strcpy(buffer_command, "python3");}




    if ( strstr(that_command, "Python ") == that_command ) {



        strcat(buffer_command, " ");

        strcat(buffer_command, path_the);

        strcat(buffer_command, "/");

        strcat(buffer_command, name_the);

        strcat(buffer_command, "/box/python/");

        strcat(buffer_command, strstr(that_command, "Python ") + 7);}




    system(buffer_command);




    return 1;}
