
void action_save() {


    char cmd[129] = "";

    strcat(cmd, "bash ");
    strcat(cmd, path_the);
    strcat(cmd, "/");
    strcat(cmd, name_the);
    strcat(cmd, "/box/Linux/save.sh");

    system(cmd);}
