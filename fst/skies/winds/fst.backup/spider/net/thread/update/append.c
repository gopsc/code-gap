

int append_message_data_update(
                                  int   that_site,
                                  char* buffer_send
                              ) {





    if (

           strcmp(gop_connection.how[that_site], "Connectted"  ) != 0
    &&     strcmp(gop_connection.how[that_site], "Sopi"        ) != 0

       ) {

// ?
//   others should not come here

        return 0;}









    else {

// enter the program




        if ( gop_connection.flag_update[that_site] <= 9 ) {

// count_update means times between tow update message
//
// this is not update time
//
//  and we don need to use it
//
//  and if the client have not return
//
//   we don't read, and keep this
//
// time is here and we just send the same update package last time
//
//  and if sop recived the update message,
//
//   we send load update file and send the file right that now


            gop_connection.flag_update[that_site] ++;

            return 0;}









        else {

// it's time to send update
// clean the buffer

            gop_connection.flag_update[that_site] = 0;







// connect the send buffer

            strcat ( buffer_send, "Update." );
            strcat ( buffer_send, "\n"      );




// Prepare

            char buffer_file          [102400];
            char buffer_file_length   [16];
            char buffer_sum           [16];
            char buffer_step          [16];




// get the start path

            char   buffer_path_start  [32];

            strcpy(buffer_path_start, path_the);
            strcat(buffer_path_start, "/"     );
            strcat(buffer_path_start, name_the);





/* if ( strcmp(gop_connection.update[that_site], buffer_path_start) == 0 ) {// the loop program returned wrong flag//// if this is just like started just before//// there're two kind of possibility//// it is a beginning, something goes wrong// or it's end////// but we read the returned before//// so if it's like a beginning now//// it must be a beginning//// because we we will clean the buffer when the if ( control_message_update(gop_connection.update[that_site]) == 0 ) {// so we just loop it first//// if it returned a special value that means something really goes wrong//// it is done, we should never send a update message and we can fix it output_print( "string", "There is no TxL source.\n" );// clean it. strcpy(gop_connection.update[that_site], "" );// clean buffer of send *strstr(buffer_send, "Update.") = '\0';// this is a wrong,,, return 0;}}// ok we had loop it before in the judging's value//// now we get the files file_get( gop_connection.update[that_site], buffer_file );// and get the length of the file snprintf( buffer_file_length, sizeof(buffer_file_length) / sizeof(char) - 1, "%d", strlen(buffer_file) );// some file is very long, we can't send it once//// even if we can't read it unless used the changed buffer size//// and i still can't use that :c if ( gop_connection.step_update[that_site] * size_update > strlen(buffer_file) ) {// the value named 'step_update' means how many times we have send it//// and if this is over the last time of send this file already,//// we should loop it again//// for next append// loop it again if ( control_message_update(gop_connection.update[that_site]) != 0 ) {// this is the last step, but not the last file//// and be ready to send next file; gop_connection.step_update[that_site] = 0;} else {// if it is normal before//// and returned wrong now//// it means there is no another one file now// clean it and send message strcpy(gop_connection.update [that_site], "" ); gop_connection.step_update[that_site] = 0;















// start
//
// the update range next file load what is moving
//  to another place
// where the gop recived a recived message
//
// where named judge/infrmation
//
// :)


// start the update sending


// the information format of update
//
// File name:   ...
// File step:   ...
// File length: ...
// File sum:    ...




// get the numer of sums;
//
//
// first should get the file convent
//
// it seems like already got the file convent before
//
// but that was check


            file_get     (gop_connection.update[that_site], buffer_file);

// prepare
//
// if the length < path
//
// don't worry,
// path end flag will be where after the end flag there

            strcpy       (buffer_file, buffer_file + gop_connection.step_update[that_site] * size_update);

                          buffer_file[size_update] = '\0';

// get the value of sum

            secret_encode(buffer_file, "sum");

// get that

            strcpy       (buffer_sum, buffer_file);





// reget the file convent

            file_get(gop_connection.update[that_site], buffer_file);





// get the length we've send

            if (

                   ( (gop_connection.step_update[that_site] + 1) * size_update )

                   >  strlen(buffer_file)

               ) {

// if this is the last file
//
// the size is the left

                snprintf(

                          buffer_file_length,
                          sizeof(buffer_file_length) / sizeof(char) - 1,
                          "%d",
                          strlen(buffer_file) - gop_connection.step_update[that_site] * size_update

                        );}

            else {

// if this is not the last file
//
// the size is as the plan

                snprintf(
                          buffer_file_length,
                          sizeof(buffer_file_length) / sizeof(char) - 1,
                          "%d",
                          size_update
                        );}



// go to turn the step

            snprintf(buffer_step, sizeof(buffer_step) / sizeof(char) - 1, "%d", gop_connection.step_update[that_site]);















// make the update information

            strcat(
                    buffer_send,
                    strstr(gop_connection.update[that_site], name_the) + strlen(name_the)
                  );


            strcat(buffer_send, ",");
            strcat(buffer_send, buffer_step);
            strcat(buffer_send, ",");
            strcat(buffer_send, buffer_file_length);
            strcat(buffer_send, ","       );
            strcat(buffer_send, buffer_sum);
            strcat(buffer_send, "."       );
            strcat(buffer_send, "\n"      );




// this is the main convent
//
// prepare the convent of file

            strcpy(
                    buffer_file,
                    buffer_file + gop_connection.step_update[that_site] * size_update
                  );

                   buffer_file[size_update] = '\0';



// cat the convent of file

            strcat(buffer_send, buffer_file);




// plus the step of update
//
//   we don't need to do this now
//
//   we fresh the step when sop return






// show file name if it have not begin

// print the file name
//
// i think something could change
// to have a beautiful interface
//
// and these output message have a type different

            if ( gop_connection.step_update[that_site] == 1 ) {


                output_print( "string", gop_connection.update[that_site] );
                output_print( "string", " send size : "                  );
                output_print( "string", buffer_file_length               );
                output_print( "string", "\n"                             );}}




// appending done, return it

        return 1;}}
