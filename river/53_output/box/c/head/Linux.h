

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#include <math.h>
#include <string.h>
#include <ifaddrs.h>
#include <fcntl.h>

#include <time.h>
#include <dirent.h>
#include <pthread.h>
#include <signal.h>     // for check_deamon() ->

#include <sys/time.h>   // for note_save() -> gettimeofday()
#include <sys/socket.h>
#include <sys/stat.h>
#include <sys/types.h>  // for check_deamon() ->
#include <sys/param.h>  // for ...

#include <arpa/inet.h>

