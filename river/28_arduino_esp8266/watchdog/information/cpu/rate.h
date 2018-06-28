void info_CPU_rate_get() {


    info_CPU_get(0);
    gop_delay(0.1);
    info_CPU_get(1);


    unsigned long od, nd;
    unsigned long id, sd;
    int cpu_use = 0;

    od = (unsigned long)(info_cpu.user + info_cpu.nice + info_cpu.system + info_cpu.idle);
    nd = (unsigned long)(buffer_cpu.user + buffer_cpu.nice + buffer_cpu.system + buffer_cpu.idle);

    id = (unsigned long)(buffer_cpu.user - info_cpu.user);
    sd = (unsigned long)(buffer_cpu.system - info_cpu.system);



    if((nd-od) != 0)
        cpu_use = ((sd+id)* 100)/(nd-od);
    else
        cpu_use = 0;

    info_cpu.rate = cpu_use;}









