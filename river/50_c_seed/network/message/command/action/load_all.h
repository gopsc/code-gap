
void action_load_all() {

    char cmd[100] = "";

    strcat(cmd, "bash " );
    strcat(cmd, path_the);
    strcat(cmd, "/"     );
    strcat(cmd, name_the);
    strcat(cmd, "/box/Linux/load_all.sh");

    system(cmd);}