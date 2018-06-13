
int load_listen() {




    output_print( "string", "Load listen...\n" );




// the path of the files saved

// now it is trees/*

    char buffer_path [ 128 ];




// It's for saving the name of the dirent

    char buffer_name[128];


// it's for saving the name of the files

    char buffer_file[128];


// it's for saving the file content

    char buffer_word[10240];


// Prepare the path

    strcpy(buffer_path, path_the   );
    strcat(buffer_path, "/"        );
    strcat(buffer_path, name_data  );



// it is for counting the files

    int   number_step;


// if is for reading the file convent

    char* pointer_word;


// if is for reading the file entre

    char* pointer_enter;











    do {


// changed the number of listen 
//     and into a buffer

        snprintf(buffer_word, sizeof(buffer_word) / sizeof(char) - 1, "%d", number_listen);


// Prepare the path
//
// TxL/trees/number/w/t.snake
//                  .

        strcpy(buffer_name, buffer_path);
        strcat(buffer_name, "/");
        strcat(buffer_name, buffer_word);

        number_listen++;



// If this dirent is exist
// we read it

        if ( is_dirent(buffer_name) ) {


// Print it
            output_print( "string",  buffer_name );
            output_print( "string", "\n"         );



// Take a loop to read note  files
//
//...
//
// Take a loop to read snake files

            int w;

            for ( w = 1; w <= N; w++ ) {


// Find a place to transform
//  the number of w

                snprintf(buffer_word, sizeof(buffer_word) / sizeof(char) - 1, "%d", w);

// Prepare the file name
// TxL/trees/number/w/t.snake
//                    .

                strcpy(buffer_file, buffer_name  );
                strcat(buffer_file, "/"          );
                strcat(buffer_file, buffer_word  );
                strcat(buffer_file, ".snake"     );



// if the file does not exist

                     if ( !is_file(buffer_file) ) {

                    break;}



// If it is exist

                else if (  is_file(buffer_file) ) {

// get the file

                    file_get(buffer_file, buffer_word);

                    number_step     = 1;



// Take the loop for
// read the convent
//   of the file


                    pointer_enter =         buffer_word;


                    do {

// set the start path

                        pointer_word =           pointer_enter;

// find the next enter

                        pointer_enter = strchr(  pointer_enter, '\n'  );




// The last line was no enter
//  so we don't need to judge did it get the pointer

                        if ( pointer_enter != NULL ) {

                           *pointer_enter = '\0';}

// Tranform the convent

                        buffer_listen[number_listen][w][number_step] = atoi(pointer_word);


// reset it
                        if ( pointer_enter != NULL ) {

                           *pointer_enter = '\n';

                            pointer_enter ++;

                             number_step  ++;}


// end this loop when it's no more enter

                  } while ( pointer_enter != NULL );}}}



// end this loop when is's no more dirent

  } while ( is_dirent(buffer_name) );




    return 1;}
