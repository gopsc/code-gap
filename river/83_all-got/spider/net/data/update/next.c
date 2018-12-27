


 int next_message_data_update () {







// update next we should move it to it's mother site

/*

            if ( strcmp(gop_connection.update[that_site], buffer_path_start) == 0 ) {


// the loop program returned wrong flag
//
// if this is just like started just before
//
// there're two kind of possibility
//
// it is a beginning, something goes wrong
// or it's end
//
//
// but we read the returned before
//
//  so if it's like a beginning now
//
//  it must be a beginning
s//
//  because we we will clean the buffer when the






                if ( control_message_update(gop_connection.update[that_site]) == 0 ) {


// so we just loop it first
//
// if it returned a special value that means something really goes wrong
//
// it is done, we should never send a update message and we can fix it

                    output_print( "string", "There is no TxL source.\n" );


// clean it.

                    strcpy(gop_connection.update[that_site], "" );


// clean buffer of send

                   *strstr(buffer_send, "Update.") = '\0';


// this is a wrong,,,

                    return 0;}}







// ok we had loop it before in the judging's value
//
//   now we get the files

            file_get( gop_connection.update[that_site], buffer_file );


// and get the length of the file

            snprintf(
                      buffer_file_length,
                      sizeof(buffer_file_length) / sizeof(char) - 1,
                      "%d",
                      strlen(buffer_file)
                    );







// some file is very long, we can't send it once
//
// even if we can't read it unless used the changed buffer size
//
//  and i still can't use that :c


            if ( gop_connection.step_update[that_site] * size_update > strlen(buffer_file) ) {


// the value named 'step_update' means how many times we have send it
//
// and if this is over the last time of send this file already,
//
//  we should loop it again
//
// for next append






// loop it again

                if ( control_message_update(gop_connection.update[that_site]) != 0 ) {


// this is the last step, but not the last file
//
//  and be ready to send next file;

                    gop_connection.step_update[that_site] = 0;}








                else {

// if it is normal before
//
// and returned wrong now
//
// it means there is no another one file now


// clean it and send message


                    strcpy(gop_connection.update     [that_site], ""        );

                           gop_connection.step_update[that_site] = 0;



// print out and send message

                    output_print( "string",                       "Done.\n" );

                    strcat      (buffer_send,                     "Done."   );





// ready to update to another one
//
// something went worng, can't send update together

                    int i;

                    for (
                            i  = that_site + 1;
                            i <= 3;
                            i ++
                        ) {


                        if (
                               strcmp(gop_connection.how[i],     "Sopi")       == 0
                        ||     strcmp(gop_connection.how[i],     "Connectted") == 0
                           ) {

// it is next sop client
//
// send the update

                            strcpy(gop_connection.command[that_site], ""             );
                            strcpy(gop_connection.command[i],         "Clean update.");


// update one client once

                            break;}}



// this update is done, return it

                    return 1;}}


*/





// something happened

            return 0;