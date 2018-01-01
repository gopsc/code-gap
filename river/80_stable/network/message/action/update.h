



int action_update(

                     int     that_site,
                     char*   that_command,
                     char* buffer_send

                 ) {





    if (

           strcmp(gop_connection.how[that_site], "Connectting") == 0
    ||     strcmp(gop_connection.how[that_site], "Sop"        ) == 0

       ) {






        strcpy(that_command, strchr(that_command, '\n') + 1);







        if (

               strcmp(that_command, "Done.")
               == 0

           ) {




            strcpy(gop_connection.update[that_site], "");


            load_update(that_site);



            return 1;}




        else {







// Preparing.
//
// name,site,length,sum.
// words

            char*  pointer_update;

            char   buffer_update_name  [128]    = "";
            char   buffer_update_site  [16]     = "";
            char   buffer_update_length[16]     = "";
            char   buffer_update_sum   [16]     = "";
            char   buffer_update_words [102400] = "";



            strcpy(buffer_update_words, that_command);



            pointer_update = strchr(buffer_update_words, '\n');
           *pointer_update = '\0';




// Check the information of update

            int number_times = 0;


            for (
                    pointer_update  =        buffer_update_words     ;
                    pointer_update != NULL                           ;
                    pointer_update  = strchr(pointer_update + 1, ',')
                ) {


                number_times++;}




            if ( number_times >= 4 ) {




// Copy the information of name.
//     ( apart of it )

                pointer_update = strchr(buffer_update_words, ',');
               *pointer_update = '\0';

                strcpy(buffer_update_name,               path_the            );
                strcat(buffer_update_name,               "/downloads"        );
                strcat(buffer_update_name,               buffer_update_words );




// Copy the information of site
//      and compile the name.

               *pointer_update = ',';
                                 strcpy(buffer_update_words, pointer_update+1);
                pointer_update = strchr(buffer_update_words, ','             );
               *pointer_update = '\0';

                strcpy(buffer_update_site,               buffer_update_words );
                strcat(buffer_update_name,               "."                 );
                strcat(buffer_update_name,               buffer_update_site  );





// Copy the information of length

               *pointer_update = ',';
                                 strcpy(buffer_update_words, pointer_update+1);
                pointer_update = strchr(buffer_update_words, ','             );
               *pointer_update = '\0';

                strcpy(buffer_update_length,             buffer_update_words );





// Copy the information of sum

               *pointer_update = ',';
                                 strcpy(buffer_update_words, pointer_update+1);
                pointer_update = strchr(buffer_update_words, '.'             );
               *pointer_update = '\0';

                strcpy(buffer_update_sum,                buffer_update_words );





// Copy the information of words

                strcpy(buffer_update_words, strchr(that_command, '\n') + 1);}




            else {

                strcpy(buffer_update_sum, "errors");}





// Read information done,
//  and ready to check,
// then save.
            
            secret_encode(buffer_update_words, "sum"                  );

            strcpy(buffer_update_site,  buffer_update_words           );

            strcpy(buffer_update_words, strchr(that_command, '\n') + 1);






            if (

                (

                      atoi(buffer_update_length)
            ==      strlen(buffer_update_words )

                )

            &&

                (

                   strcmp(buffer_update_site, buffer_update_sum) == 0

                )

               ) {



                output_print( "string",  buffer_update_name                   );
                output_print( "string", "\n"                                  );

                strcpy   (gop_connection.update[that_site], buffer_update_name);

                file_save(buffer_update_name, buffer_update_words             );


                return 1;}




            else {



//               *strchr      (that_command, '\n'        ) = '\0';
//                output_print("string",     that_command);



                strcat(buffer_send, "Update lost.\n"                );

                strcat(buffer_send, gop_connection.update[that_site]);

                strcat(buffer_send, symbol_next                     );


                return 0;}}}





    return 0;}



