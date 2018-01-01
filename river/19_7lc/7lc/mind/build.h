
pthread_t    thread[6];





int main(int argc, char *argv[]){






    pthread_create (&thread[1], NULL, gop_dog,          NULL);
    sleep(1);
    pthread_create (&thread[2], NULL, gop_server_start, NULL);
    pthread_create (&thread[3], NULL, gop_client_start, NULL);
    pthread_create (&thread[4], NULL, gop_corde ,       NULL);









    while(flag_mind) {


        gop_command();


        sleep(1);}}










