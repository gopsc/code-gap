

void command_sprinkle() {


    printf("...\n");

    char cmd[100] = "";

    strcat(cmd, "bash ");
    strcat(cmd, path_the);
    strcat(cmd, "/");
    strcat(cmd, name_the);
    strcat(cmd, "/box/Linux/alsa.sh");

    system(cmd);

    printf("OVER.\n");}