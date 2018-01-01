

double     result_sound[200][513];
//                     [num][ t ]

double     result_ft[200][513];
//                  [ t ][ w ]

double     buffer_listen[100][513][200];
//                      [num][ w ][ t ]

int        number_listen = 1;
// Number of word's files

char       path_sound[100];
// Save path of sound files.