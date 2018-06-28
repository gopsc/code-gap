
struct gopi_connect {

        string    how[4];
        time_t    point_time[4];

        string    command[4];
        string    information[4];

        string    update[4];
        int       step_update[4];

        string    address_ip[4];
        int       port[2];
        int       fd[2];};

gopi_connect gop_connect;
