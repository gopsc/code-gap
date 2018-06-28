
void control_message_update(const char* path_update, char* that_result) {

/*

           //    /opt/7lc
           string   path_update_start  = path_the;
                    path_update_start += "/";
                    path_update_start += name_the;

           DIR      *pDir;
    struct dirent   *ent       = NULL;

	       // is saving what file we are send
           string   that_file = "";






    if (*path_update == "") {

       *path_update = path_update_start;}





    if (*path_update != path_update_start) {

        that_file    = (*path_update).substr((*path_update).rfind("/")+1,   (*path_update).length());

        *path_update = (*path_update).substr(0, (*path_update).rfind("/"));}






    pDir = opendir((*path_update).c_str());




    if ( "" != that_file ) {

        ent = readdir( pDir );

        while ( that_file != ent->d_name) {

            ent = readdir( pDir );}}






    ent = readdir( pDir );



    while ( ent != NULL ) {

        if (   (int)ent->d_type == 4 ) {

            if ( *ent->d_name == '.') {

                ent = readdir(pDir);}

            else {

                *path_update += '/';
                *path_update += ent->d_name;

                closedir( pDir );

                pDir = opendir((*path_update).c_str());
                ent  = readdir(pDir);}}



        else if ( (int)ent->d_type == 8 ) {

            *path_update += '/';
            *path_update += ent->d_name;

            closedir( pDir );
            return *path_update;}}


     // A dirent is finished
    if ( *path_update != path_update_start ) {

        closedir( pDir );
        return control_update(path_update);}


    else {

        closedir( pDir );
        *path_update = "";
        return "Done.";}

*/

}
