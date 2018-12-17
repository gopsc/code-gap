
struct gopi_connection {

           char        how[4][17];
           time_t      time[4];

           char        command[4][129];
           char        information[4][10240];

           char        update[4][10240];
           int         step_update[4];

           char        address_ip[4][129];
           int         port[2];
           int         descriptor[2];

    struct gopi_cpu    cpu[4];
    struct gopi_memory memory[4];
    struct gopi_disk   disk[4];
    struct gopi_sound  sound[4];

    } gop_connection;
