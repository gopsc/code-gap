void check_ssh() {

    if (cmd_get("dog_check_ssh", "uname -n")=="raspberrypi") {

        cmd_get("dog_check_ssh", "sudo service ssh restart");}}
