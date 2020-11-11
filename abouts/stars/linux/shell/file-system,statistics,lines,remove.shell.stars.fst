



# start with "##"


less -S 'target file name' | grep -v ‘^##’>"result file name"



# include "##"


less -S 'target file name' | grep -v ‘##’>"result file name"



