void check_root() {

    if ( cmd_get("watchdog", "whoami") != "root" ) {

        cout << "WARNNING: NO ROOT." << endl;}}
