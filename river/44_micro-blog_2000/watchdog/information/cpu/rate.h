void information_CPU_rate_get() {


    information_CPU_status_get(0);
    usleep(100000);
    information_CPU_status_get(1);


    unsigned long od, nd;
    unsigned long id, sd;
             int  that_use = 0;

                  od      = (unsigned long)(information_cpu.user + information_cpu.nice   + information_cpu.system   + information_cpu.idle);
                  nd      = (unsigned long)(buffer_cpu.user      + buffer_cpu.nice + buffer_cpu.system + buffer_cpu.idle);

                  id      = (unsigned long)(buffer_cpu.user   - information_cpu.user);
                  sd      = (unsigned long)(buffer_cpu.system - information_cpu.system);



    if( (nd-od) != 0 )
        that_use = ( (sd+id)* 100 ) / (nd-od);
    else
        that_use = 0;

    information_cpu.rate = that_use;}