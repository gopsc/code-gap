




int init_deamon() {





    if ( number_args <= 1 ) {

// it is not the deamon mode

        return 1;}



    else {


        if ( strcmp(buffer_args[1], "deamon") != 0 ) {


// it is not deamon mode

            return 1;}



         else {

// it is deamon mode

            information_flag.deamon = 1;






// Maybe it need to wait
//   for some of program

            usleep(100000);

            output_print("string", "Start deamon...\n");




            int pid = fork();

            if      ( pid     ) {

                // It's the father ps, exit it.

                return 0;}

            else if ( pid < 0 ) {

                // fork failled, exit it.

                return 0;}

            // Now it's the first son ps.




            // Make the 1st son ps become a
            //      new session and ps group leader
            //      and leave control terminal

            setsid();



            pid = fork();

            if      ( pid     ) {

                // It's the 1st son ps, exit it.

                return 0;}

            else if ( pid < 0 ) {

                // fork failled, exit it.

                return 0;;}

            // Now it's the second son ps.
            //     the 2nd son ps is
            //     not session group leader
            //     any more


            char buffer_nofile[16];

            int  number_nofile     = atoi(buffer_nofile);



            int  i;

            for ( i=0; i<number_nofile; ++i) {

                close(i);

                chdir("/");  //Change work dirent.

                umask(0);    //Reset file building modeling

                return 1;}


// something goes wrong

            return 0;}}}
