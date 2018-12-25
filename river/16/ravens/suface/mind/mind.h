
pthread_t    thread[6];

int main(int argc, char *argv[]){

    pthread_create (&thread[1], NULL, gop_dog , NULL);
    sleep(2);
    pthread_create (&thread[2], NULL, gop_server_start, NULL);
    pthread_create (&thread[3], NULL, gop_client_start, NULL);
    pthread_create (&thread[4], NULL, gop_corde , NULL);
    //pthread_create (&thread[5], NULL, gop_window, NULL);

    while(flag_mind) {
        sleep(0.1);
        gop_command();}}









