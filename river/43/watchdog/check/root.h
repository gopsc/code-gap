void check_root() {

    char that_result[129];






    cmd_get("whoami", that_result);

    if ( strcmp(that_result, "root\n") != 0 ) {

         printf("WARNNING: NO ROOT.\n");}}
