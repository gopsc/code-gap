string control_calculate_sound(string information) {






           DIR      *pDir;
    struct dirent   *ent       = NULL;


           string   that_file  = "";
           string   this_file  = "";
           string   first_file = "";






    if ( calculate_now == "Free" ) {




//---------------------------------------------------------------
//find the nearly file



        pDir = opendir((path_sound).c_str());


        ent = readdir( pDir );


        that_file = "0.sound";


        while ( ent->d_name != "" and ent != NULL ) {


             this_file = ent->d_name;


            if ( this_file.find(".sound") != -1 ) {



                if ( atoi(this_file.substr(0, that_file.find(".")).c_str())  >  atoi(that_file.substr(0, that_file.find(".")).c_str())) {

                    that_file = this_file;}}



            ent = readdir( pDir );}

        closedir( pDir );




//        cout << that_file << endl;
//---------------------------------------------------------------



        first_file = that_file;


        pDir = opendir((path_sound).c_str());


        ent = readdir( pDir );


        that_file = "0.sound";






        while ( ent->d_name != "" and ent != NULL ) {


            this_file = ent->d_name;





            if ( this_file.find(".sound") != -1 and this_file != first_file ) {


                if ( atoi(this_file.substr(0, that_file.find(".")).c_str())  >  atoi(that_file.substr(0, that_file.find(".")).c_str())) {

                    that_file = this_file;}}



            ent = readdir( pDir );}

        closedir( pDir );




    if (that_file == "0.sound") {

        that_file = ".";}





//---------------------------------------------------------------

//        cout << that_file << endl;

        if ( that_file != "." and that_file != "..") {
            first_file  = path_sound;
            first_file += "/";
            first_file += that_file;
            first_file += ",";
            first_file += "0";

//            cout << first_file << endl;
            calculate_now  = first_file;}}



//---------------------------------------------------------------














    if ( calculate_now != "Working" and calculate_now != "Free" ) {                                                           //表示此台上位机已经就绪





        string that  = calculate_now.substr(0,                         calculate_now.find(","));
        string that2 = calculate_now.substr(calculate_now.find(",")+1, calculate_now.length());
        string that3 = "";








        if ( information.find(":Free") != -1 ) {
        //表示有空闲下位机





            that3 = file_get(that);



            int number_site1 = 0;
            int number_count = 0;

            while ( number_site1 != -1 and number_count != atoi(that2.c_str())*N/2 ) {

                number_count++;

                number_site1 = that3.find("\n", number_site1) + 1;}






                number_count = 0;
            int number_site2 = 0;

            while ( number_site2 != -1 and number_count != atoi(that2.c_str())*N/2+N ) {

                number_count++;

                number_site2 = that3.find("\n", number_site2) + 1;}






            if ( number_site1 < number_site2  ) {
               //表示文件能进行计算，且还未发完




                that3 = that3.substr(number_site1 , number_site2-number_site1);
                //cout << that3.length() << endl;
                //发送文件， 更新记录 



                calculate_now  = that;
                calculate_now += ",";
                calculate_now += to_string( atoi(that2.c_str())+1 );


                that          += ",";
                that          += "ft";
                that          += ",";
                that          += to_string( atoi(that2.c_str()));

                that          += "\n";
                that          += that3;

//              /opt/gop/sound/xxx.sound,2.
//                cout << that.length() << endl;


                return that;}







            else {

                that3  = that.substr(0 , calculate_now.find("sound/"));
                that3 += "ft/";
                that3 += that.substr(calculate_now.find("sound/")+6,
                                     calculate_now.find(".sound") - (calculate_now.find("sound/")+6));
                that3 += ".ft";

  //           /opt/gop/temporary/xxx.ft

                string that4;
                bool   that_finished = true;

                for (int i = 0; i <= atoi(that2.c_str())-1; i++) {

                    that4  = that3;
                    that4 += ".";
                    that4 += to_string(i);

                    if ( !is_file(that4.c_str()) ) {

                        that_finished = false;}}

                if ( that_finished == true ) {



                    that3  = that.substr(0, calculate_now.find("sound/"));
                    that3 += "sound/";
                    that3 += that.substr(calculate_now.find("sound/")+6,
                                         calculate_now.find(".sound") - (calculate_now.find("sound/")+6));
                    that3 += ".sound";

                    remove(that3.c_str());

                    calculate_now = "Free";}


                return "Wait";}}







        else {
                                                                                                                              //表示没有空闲下位机，等待
            return "Wait";}}


    return "Wait";}

