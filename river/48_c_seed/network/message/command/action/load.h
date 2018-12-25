
void action_load() {

    char cmd[100] = "";

    strcat(cmd, "bash " );
    strcat(cmd, path_the);
    strcat(cmd, "/"     );
    strcat(cmd, name_the);
    strcat(cmd, "/box/Linux/load.sh");

    system(cmd);}