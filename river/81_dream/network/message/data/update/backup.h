
int count_backup () {



// This is for count the number
//
// the 0 dirent usually to save the special things

    int number_count = 1;





// it's for saving the name of dirent

    char buffer_dirent[128];








// it's for saving the dirent

            DIR*    pointer_dirent = NULL;
    struct  dirent* ent            = NULL;






// prepare the dirent path

    strcpy(buffer_dirent, path_the   );
    strcat(buffer_dirent, "/"        );
    strcat(buffer_dirent, name_backup);







// open the dirent

    pointer_dirent = opendir(buffer_dirent);



// may be it's not exist

    if ( NULL != pointer_dirent ) {

// start the loop of read

        do {


// read the dirent

            ent = readdir( pointer_dirent );



// may be it's not exist

            if ( NULL != ent ) {

// Somtimes the point of the version will be at the last of the name of the dirent
// so we save it

                strcpy( buffer_dirent, ent->d_name );


                if ( NULL != strchr(buffer_dirent, '_') ) {

// it is usually very short
//  and the computers are usually very fast
// do not need to prepare a new pointer to save it

                    *strchr(buffer_dirent, '_') = '\0';}


// compare them and find the big one

                    if ( atoi(buffer_dirent) > number_count ) {

                    number_count = atoi(buffer_dirent);}}


          } while ( ent != NULL );
          }





// don't forget close it

    closedir(pointer_dirent);


    return number_count;}


