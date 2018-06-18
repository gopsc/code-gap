
int action_TxL() {




// sometimes there is already a link exist there
// and i don know what to do

    if ( is_file("/etc/init.d/?")   ) {
       system("rm /etc/init.d/?");}

    if ( is_file("/etc/rc3.d/S10?") ) {
       system("rm /etc/rc3.d/S10?");}

    if ( is_file("/etc/rc5.d/S10?") ) {
       system("rm /etc/rc5.d/S10?");}

    if ( is_file("/etc/rc6.d/K10?") ) {
       system("rm /etc/rc6.d/K10?");}




// process it

    char   buffer_commandline  [128];


    strcpy(buffer_commandline, "gcc "                       );
    strcat(buffer_commandline,  path_the                    );
    strcat(buffer_commandline, "/"                          );
    strcat(buffer_commandline,  name_the                    );
    strcat(buffer_commandline, "/box/c/Linux/code/deamon.c" );
    strcat(buffer_commandline, " -o"                        );
    strcat(buffer_commandline, " /etc/init.d/?"             );

    commandline_get(buffer_commandline, buffer_commandline  );




// make the link

    system("ln /etc/init.d/? /etc/rc3.d/S10?");
    system("ln /etc/init.d/? /etc/rc5.d/S10?");
    system("ln /etc/init.d/? /etc/rc6.d/K10?");




// set the service

    commandline_get("service ? restart", buffer_commandline);



// return it

    return 1;}
