void check_ssh() {

    char that_result[129];




    cmd_get("uname -n", that_result);

    if ( strcmp(that_result, "raspberrypi\n") == 0 ) {

        cmd_get("service ssh restart", that_result);}}
