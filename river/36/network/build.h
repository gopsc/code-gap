
struct gopi_connect {

           char        how[4][17];
           time_t      point_time[4];

           char        command[4][129];
           char        information[4][10240];

           char        update[4][10240];
           int         step_update[4];

           char        address_ip[4][129];
           int         port[2];
           int         fd[2];

    struct gopi_cpu    cpu[4];
    struct gopi_memory memory[4];
    struct gopi_disk   disk[4];
    struct gopi_sound  sound[4];};







gopi_connect gop_connect;
