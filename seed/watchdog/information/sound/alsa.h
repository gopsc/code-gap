
int information_sound_get() {





    DIR           *buffer_dirent;
    struct dirent *pointer_dirent;




    information_sound.number_control  = 0;
    information_sound.number_capture  = 0;
    information_sound.number_playback = 0;





    int number_control                = 0;
    int number_capture                = 0;
    int number_playback               = 0;




    char buffer_name[17]              = " \0";
    char buffer_id[17]                = " \0";


    char buffer[3][8];









    buffer_dirent = opendir("/dev/snd");

    pointer_dirent = readdir(buffer_dirent);


    while (

              (  pointer_dirent = readdir(buffer_dirent)  )
              != NULL

          ) {





        strcpy(buffer_name, pointer_dirent->d_name);




        if ( strstr(buffer_name, "control") == buffer_name ) {

// if it is a control device

            number_control++;}





        else if ( strstr(buffer_name, "pcm") == buffer_name ){

// if it is a pcm device

           strcpy( buffer_name, strstr(buffer_name, "pcm")+3 );




           if ( buffer_name[strlen(buffer_name)-1] == 'c' ) {

// if it is a pcm corde divice

               number_capture++;



// get the first of the id

               strcpy( buffer_name, strchr(buffer_name, 'C') + 1);

              *strchr( buffer_name,                     'D'     ) = '\0';

               strcpy( buffer[1]  ,        buffer_name          );


                       buffer_name[strlen(buffer_name)]           = 'D' ;


// get the second of the id

               strcpy( buffer_name, strchr(buffer_name, 'D') + 1);

                       buffer_name [strlen(buffer_name)-1]        = '\0';  

               strcpy( buffer[2]  ,        buffer_name          );



               strcpy(buffer_id, "hw:");
               strcat(buffer_id, buffer[1]); 
               strcat(buffer_id, ",");
               strcat(buffer_id, buffer[2]);


               strcpy(information_sound.device[1][number_capture], buffer_id);}







           else if ( buffer_name[strlen(buffer_name)-1] == 'p' ) {



               number_playback++;



               strcpy( buffer_name, strchr(buffer_name, 'C') + 1);

              *strchr( buffer_name,                     'D'     ) = '\0';

               strcpy( buffer[1]  ,        buffer_name          );


                       buffer_name[strlen(buffer_name)]           = 'D' ;


               strcpy( buffer_name, strchr(buffer_name, 'D') + 1);

                       buffer_name [strlen(buffer_name)-1]        = '\0';  

               strcpy( buffer[2]  ,        buffer_name          );



               strcpy(buffer_id, "hw:");
               strcat(buffer_id, buffer[1]); 
               strcat(buffer_id, ",");
               strcat(buffer_id, buffer[2]);



               strcpy(information_sound.device[2][number_playback], buffer_id);}}}





    closedir(buffer_dirent);




    information_sound.number_control  = number_control;
    information_sound.number_capture  = number_capture;
    information_sound.number_playback = number_playback;

    return 1;}
