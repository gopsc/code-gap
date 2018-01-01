
int action_TxL() {

    if ( is_file("/etc/init.d/?")   ) {
       system("rm /etc/init.d/?");}

    if ( is_file("/etc/rc3.d/S10?") ) {
       system("rm /etc/rc3.d/S10?");}

    if ( is_file("/etc/rc5.d/S10?") ) {
       system("rm /etc/rc5.d/S10?");}

    if ( is_file("/etc/rc6.d/K10?") ) {
       system("rm /etc/rc6.d/K10?");}


    char   buffer_commandline  [128];


    strcpy(buffer_commandline, "gcc "                   );
    strcat(buffer_commandline,  path_the                );
    strcat(buffer_commandline, "/"                      );
    strcat(buffer_commandline,  name_the                );
    strcat(buffer_commandline, "/box/c/example/deamon.c");
    strcat(buffer_commandline, " -o"                    );
    strcat(buffer_commandline, " /etc/init.d/?"         );

    system(buffer_commandline);


    system("ln /etc/init.d/? /etc/rc3.d/S10?");
    system("ln /etc/init.d/? /etc/rc5.d/S10?");
    system("ln /etc/init.d/? /etc/rc6.d/K10?");


    strcat(buffer_commandline, "service ? start"        );
    system(buffer_commandline);


    return 1;}
