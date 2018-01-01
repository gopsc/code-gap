void information_CPU_rate_get() {

    struct gopi_cpu buffer_cpu;

          FILE*    buffer_file;
          char     buffer_words[1025];



//===============================================================

// Get status for cpu here.
//      the first time

                   buffer_file         = fopen("/proc/stat", "r");

    fgets        ( buffer_words, sizeof(buffer_words), buffer_file );

    sscanf       (
                   buffer_words, "%s %u %u %u %u",
                                                  information_cpu.name,
                                                 &information_cpu.user,
                                                 &information_cpu.nice,
                                                 &information_cpu.system,
                                                 &information_cpu.idle
                 );

    fclose  (buffer_file);

//===============================================================

// Wait 0.1 second.

    usleep(100000);

//===============================================================

//      the second time

             buffer_file         = fopen("/proc/stat", "r");

    fgets  ( buffer_words, sizeof(buffer_words), buffer_file );

    sscanf  (buffer_words, "%s %u %u %u %u",
                                             buffer_cpu.name,
                                            &buffer_cpu.user,
                                            &buffer_cpu.nice,
                                            &buffer_cpu.system,
                                            &buffer_cpu.idle);

    fclose  (buffer_file);

//===============================================================
// Calculate.

    unsigned long od, nd;
    unsigned long id, sd;
             int  that_use = 0;

                  od      = (unsigned long)(information_cpu.user + information_cpu.nice   + information_cpu.system   + information_cpu.idle);
                  nd      = (unsigned long)(buffer_cpu.user      + buffer_cpu.nice + buffer_cpu.system + buffer_cpu.idle);

                  id      = (unsigned long)(buffer_cpu.user   - information_cpu.user);
                  sd      = (unsigned long)(buffer_cpu.system - information_cpu.system);

//===============================================================


    if( (nd-od) != 0 )
        that_use = ( (sd+id)* 100 ) / (nd-od);
    else
        that_use = 0;

    information_cpu.rate = that_use;}