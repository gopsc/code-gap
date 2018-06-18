
void init_deamon() {



    if ( number_args > 1 ) {

        if ( strcmp(buffer_args[1], "deamon") == 0 ) {

            information_flag.deamon = 1;
            output_print("string", "Start deamon...\n");




            int pid = fork();

            if      ( pid     ) {
                // It's the father ps, exit it.

                exit(0);}

            else if ( pid < 0 ) {
                // fork failled, exit it.

                exit(1);}

            // Now it's the first son ps.




            // Make the 1st son ps become a
            //      new session and ps group leader
            //      and leave control terminal
            setsid();



            pid = fork();

            if      ( pid     ) {
                // It's the 1st son ps, exit it.

                exit(0);}

            else if ( pid < 0 ) {
                // fork failled, exit it.

                exit(1);}

            // Now it's the second son ps.
            //     the 2nd son ps is
            //     not session group leader
            //     any more


            char buffer_max-file[16];
            int  number_max-file     = atoi(buffer_max-file);
            int  i;

            for ( i=0; i<number_max-file; ++i) {

                close(i);
                chdir("/");  //Change work dirent.
                umask(0);    //Reset file building modeling

                return;}}}}
