
int action_command( const char* that_command ) {


    system(strstr(that_command, "Command ") + 8);


    return 1;}
