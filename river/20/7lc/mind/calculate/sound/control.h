string control_calculate_sound(string information) {






           DIR      *pDir;
    struct dirent   *ent       = NULL;
           string   that_file  = "";
           string   this_file  = "";
           string   first_file = "";






    if ( calculate_now == "Free" ) {
        



//---------------------------------------------------------------




        pDir = opendir((path_sound).c_str());


        ent = readdir( pDir );


        that_file = ent->d_name;


        while ( ent->d_name != "" and ent != NULL ) {

            if ( *ent->d_name != '.' ) {


                this_file = ent->d_name;

                if ( atoi(this_file.substr(0, that_file.find(".")).c_str())  >  atoi(that_file.substr(0, that_file.find(".")).c_str())) {

                    that_file = this_file;}}



            ent = readdir( pDir );}

        closedir( pDir );

//---------------------------------------------------------------

        first_file = that_file;


        pDir = opendir((path_sound).c_str());


        ent = readdir( pDir );


        that_file = ent->d_name;

        while ( ent->d_name != "" and ent != NULL ) {

            if ( *ent->d_name != '.' and ent->d_name != first_file ) {


                this_file = ent->d_name;

                if ( atoi(this_file.substr(0, that_file.find(".")).c_str())  >  atoi(that_file.substr(0, that_file.find(".")).c_str())) {

                    that_file = this_file;}}



            ent = readdir( pDir );}

        closedir( pDir );




//---------------------------------------------------------------




        first_file  = path_sound;
        first_file += "/";
        first_file += that_file;
        first_file += ",";
        first_file += "0";

        calculate_now  = first_file;}





//---------------------------------------------------------------





    if ( calculate_now != "Working" ) {


        string that  = calculate_now.substr(0,                         calculate_now.find(","));
        string that2 = calculate_now.substr(calculate_now.find(",")+1, calculate_now.length());
        string that3 = "";





        if ( information.find(":Free") != -1 ) {

            that3 = file_get(that);


            if (that3.length() > atoi(that2.c_str())*4096+4096) {

                that3 = that3.substr(atoi(that2.c_str())*4096, 4096);


                that += "\n";
                that += that3;

                return that;}

            else {
                return "WAIT...";
                //检测是否计算完毕,未完毕则等待，完毕则重新回到监听状态
                }}
        else {
            // wait free
            return "wait";}}}


