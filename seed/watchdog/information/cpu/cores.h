
int information_CPU_cores_get() {


// When the loop start,
//   it plus one so
// the  lines can be smaller
    int        num_result        = -1;


// Somehow,
//  there should be
// some Enter there

    char      that_file  [10240] = "\n\n\n\n";


// There's 'processor' in
// the words sometimes
    char    target_name  [17]    = "\nprocessor";


// u should put a pointer
//  to note where you've read 

    char*  pointer_file          = that_file;



// Put the words in the
//  Second site

    file_get("/proc/cpuinfo",  that_file + 1);

// Start the loop

    while( pointer_file != NULL ) {

        num_result++; 

        pointer_file = strstr( pointer_file + 1, target_name );}

// Get the data

    information_cpu.cores = num_result;


    return 1;}
