
void output_print(
                     const char* that_type,
                     const char* that_words
                 ) {




    if ( !information_flag.deamon ) {

        if ( strcmp(that_type, "string") == 0 ) {

            printf("%s",            that_words);}


        if ( strcmp(that_type, "int")    == 0 ) {

            printf("%d",  *(int*)   that_words);}


        if ( strcmp(that_type, "long")   == 0 ) {

            printf("%ld", *(long*)  that_words);}


        if ( strcmp(that_type, "float")  == 0 ) {

            int buffer_number;

            printf("%f",  *(float*) that_words);}


        if ( strcmp(that_type, "double") == 0 ) {

            printf("%f",  *(double*)that_words);}}


    else if ( information_flag.deamon ) {

        FILE* buffer_file = fopen( "/opt/TxL_deamon.note", "a" );

        if ( strcmp(that_type, "string") == 0 ) {

            fprintf(buffer_file, "%s",            that_words);}


        if ( strcmp(that_type, "int")    == 0 ) {

            fprintf(buffer_file, "%d",  *(int*)   that_words);}


        if ( strcmp(that_type, "long")   == 0 ) {

            fprintf(buffer_file, "%ld", *(long*)  that_words);}


        if ( strcmp(that_type, "float")  == 0 ) {

            int buffer_number;

            fprintf(buffer_file, "%f",  *(float*) that_words);}


        if ( strcmp(that_type, "double") == 0 ) {

            fprintf(buffer_file, "%f",  *(double*)that_words);}

        fclose( buffer_file );}}
