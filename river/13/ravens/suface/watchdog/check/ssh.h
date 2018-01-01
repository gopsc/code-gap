
char   restart_ssh[20] = "service ssh restart";
int    num_ssh   = 1;
string that;

void ssh_check() {
    num_ssh++;
    if ( num_ssh == 120 ) {
        num_ssh = 0;
        that = shell_get(restart_ssh);}}

