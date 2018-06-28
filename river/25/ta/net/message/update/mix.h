


void  update_mix(int site) {





                        gop_connect.update[site] = "";


                        cout << "MIX FILES..." << endl;









                        cmd_get("net_update", cmd_update_rm);
                        cmd_get("net_update", cmd_update_mv);








                        while ( control_update(&(gop_connect.update[site]))   !=   "Done." ) {




                            if ( gop_connect.update[site].find(".")   !=   gop_connect.update[site].rfind(".") ) {



                                if ( gop_connect.update[site].find(".")  !=  gop_connect.update[site].rfind("/")+1 ) {

                                   //. and ..






                                    string that_update      = gop_connect.update[site].substr(0, gop_connect.update[site].rfind("."));
                                    string that_update_mix  = path_the;
                                           that_update_mix += "/gop/downloads/";
                                           that_update_mix += that_update.substr(that_update.find(name_the), that_update.length());






                                    if ( !is_file((char*)that_update_mix.c_str()) ) {






                                        int    num_update_file   = 0;
                                        string that_update_file  = that_update;
                                               that_update_file += ".0";






                                        while ( is_file((char*)that_update_file.c_str()) ) {




                                            if ( num_update_file == 0 ) {
                                                file_save(that_update_mix, file_get(that_update_file));}
                                            else {
                                                file_append(that_update_mix, file_get(that_update_file));}



                                            num_update_file++;
                                            that_update_file  = that_update;
                                            that_update_file += ".";
                                            that_update_file += to_string(num_update_file);}




                                        cout << that_update_mix << endl;}}}}

                        cout << "Done." << endl;

                        cmd_get("net_update", cmd_update_rm);
                        cmd_get("net_update", cmd_update_mv);

                        gop_connect.update[site] = "";



                        for ( int i=0; i<=3; i++ ) {
                            if ( gop_connect.how[i] == "Sopi" or gop_connect.how[i] == "Connectted") {
								gop_connect.command[i] = "Update.";}}}
