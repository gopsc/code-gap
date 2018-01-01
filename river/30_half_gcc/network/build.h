
struct gopi_connect {

        char      how[4][20];
        time_t    point_time[4];

        char      command[4][100];
        char      information[4][10240];

        char      update[4][10240];
        int       step_update[4];

        char      address_ip[4][100];
        int       port[2];
        int       fd[2];};

gopi_connect gop_connect;
