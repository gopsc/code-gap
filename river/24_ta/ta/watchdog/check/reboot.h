
int    num_reboot   = -1;

void check_reboot() {

    if ( num_reboot != -1 ) {
        num_reboot--;}

    if ( num_reboot == 0 ) {
        num_reboot = -1;

        string that = cmd_get("dog_reboot", cmd_reboot);}}

