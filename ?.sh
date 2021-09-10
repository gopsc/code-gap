

# , ilyz
#
# , prepare




touch                                                './?.fst'

echo  ''                                         >>  './?.fst'




if  $#  -eq  1

then




    if [  $1 = 'test'  ];then




        echo  ''                                         >>  './?.fst'

        echo  '#define that_circuits_crystals___test'    >>  './?.fst'


        echo  ''                                         >>  './?.fst'

        echo  '#define that_circuits_test___'$2          >>  './?.fst'


        echo  ''                                         >>  './?.fst'

        echo  ''                                         >>  './?.fst'




    elif




        echo  ''                                         >>  './?.fst'

        echo  '#define that_circuits_crystals___island'  >>  './?.fst'


        echo  ''                                         >>  './?.fst'

        echo  ''                                         >>  './?.fst'


        echo  '#define that_circuits_mountains___'$2     >>  './?.fst'

        echo  ''                                         >>  './?.fst'


        echo  '#define that_circuits_star-fall___'$3     >>  './?.fst'

        echo  ''                                         >>  './?.fst'


        echo  ''                                         >>  './?.fst'

        echo  ''                                         >>  './?.fst'




    fi


fi




cat './abouts/prepare/c-scripts.c'                    >>  './?.fst'

cat './abouts/prepare/c-unix.c'                       >>  './?.fst'

#cat './abouts/prepare/c-windows.c'                    >>  './?.fst'


#cat './abouts/prepare/shell-unix.sh'                  >>  './?.fst'


cat './abouts/prepare/c++-scripts.cpp'         >>  './island.fst'
:<<EOF
#cat './fst/roots/mountains/prepare/c++-unix.cpp'            >>  './island.fst'

#cat './fst/roots/mountains/prepare/c++-windows.cpp'         >>  './island.fst'

cat './fst/roots/mountains/prepare/c++-arduino.cpp'         >>  './island.fst'


#cat './fst/roots/mountains/prepare/java.java'               >>  './island.fst'


cat './fst/roots/mountains/prepare/python3-scripts.py'      >>  './island.fst'

cat './fst/roots/mountains/prepare/python3-raspberrypi.py'  >>  './island.fst'









# , ilyz
#
# , package






cat './fst/roots/mountains/prepare/star-fall/poems-third-common.poems-third             >>  './?.fst'

cat './fst/roots/mountains/prepare/star-fall/poems-third-origin.poems-third'            >>  './?.fst'

cat './fst/roots/mountains/prepare/star-fall/poems-third-unix.poems-third'              >>  './?.fst'

#cat './fst/roots/mountains/prepare/star-fall/poems-third-windows.poems-third'           >>  './?.fst'


cat './fst/roots/mountains/prepare/star-fall/poems-annotation-common.poems-annotation'  >>  './?.fst'


cat './fst/roots/mountains/prepare/star-fall/poems-annotation-arduino.arduino'          >>  './?.fst'


//cat './fst/roots/mountains/prepare/starfall/shell-bash.shell'                          >>  './?.fst'

//cat './fst/roots/mountains/prepare/starfall/shell-ash.shell'                           >>  './?.fst'




#cat './fst/roots/mountains/prepare/circuits/arduino-nano.arduino'                     >>  './island.c'

#cat './fst/roots/mountains/prepare/circuits/arduino-micro.arduino'                    >>  './island.c'

cat './fst/roots/mountains/prepare/circuits/renesas-gadget-citrus.arduino'            >>  './island.c'


cat './fst/roots/mountains/prepare/circuits/science-technology-consulting-8g1k08a.c'  >>  './island.c'

cat './fst/roots/mountains/prepare/circuits/science-technology-consulting-15f104w.c'  >>  './island.c'


cat './fst/roots/mountains/prepare/circuits/sgs-thomson-32l011k4t6-nucleo.c'          >>  './island.c'


cat './fst/roots/mountains/prepare/circuits/linux-intel'                              >>  './island.c'

cat './fst/roots/mountains/prepare/circuits/linux-raspberrypi'                        >>  './island.c'




cat './fst/roots/mountains/soft-serial/prepare.arduno'              >>  './island.c'


cat './fst/roots/mountains/muti-serial/prepare.arduino'             >>  './island.c'

cat './fst/roots/mountains/muti-serial/winbond-w25q/erase.arduino'  >>  './island.c'

cat './fst/roots/mountains/muti-serial/winbond-w25q/read.arduino'   >>  './island.c'

cat './fst/roots/mountains/muti-serial/winbond-w25q/write.arduino'  >>  './island.c'



cat './fst/roots/threads/prepare'                                   >>  './island.c'

cat './fst/roots/threads/begin'                                     >>  './island.c'

cat './fst/roots/threads/end'                                       >>  './island.c'



#include "./roots/lakes/prepare.bases"


#include "./roots/lakes/waves/create.bases" // may stuck when it fail

#include "./roots/lakes/waves/free.bases" // may run out when it fail

#include "./roots/lakes/waves/resize.bases" // may stuck when it fail


#include "./roots/lakes/forms/waters/prepare.bases"

#include "./roots/lakes/forms/silts/prepare.bases"

#include "./roots/lakes/forms/stones/prepare.bases"


#include "./roots/lakes/waters/show.bases" // use __int8_t,  only decimal system,   maybe less than zero

#include "./roots/lakes/waters/clean.bases" // use __int8_t


#include "./roots/lakes/stones/copy.bases"

#include "./roots/lakes/stones/append.bases"

#include "./roots/lakes/stones/measure.bases"

#include "./roots/lakes/stones/compare.bases"

#include "./roots/lakes/stones/find.bases"



#include "./roots/trees/remove.computers"


#include "./roots/trees/dirents/is.linuxes" // note_structure

#include "./roots/trees/dirents/create.linuxes"


#include "./roots/trees/files/is.linuxes" // note_structure

#include "./roots/trees/files/write.computers" // note_files

#include "./roots/trees/files/read.computers" // note_files; may read even wrong



#include "./roots/parks/terminals/out-silts.bases"

#include "./roots/parks/terminals/out-stones.bases"




#include "./branches/threads/prepare.bases"

#include "./branches/threads/begin.bases"

#include "./branches/threads/end.bases"


#include "./branches/lakes/prepare.bases"

#include "./branches/lakes/begin.bases"

#include "./branches/lakes/end.bases"


#include "./branches/lakes/waves/add.bases"  // support types include waters, silts and stones

#include "./branches/lakes/waves/drop.bases"

#include "./branches/lakes/waves/fish.bases"

#include "./branches/lakes/waves/graze.bases"


#include "./branches/lakes/forms/stones/copy.bases"

#include "./branches/lakes/forms/stones/append.bases"

#include "./branches/lakes/forms/stones/compare.bases"


#include "./branches/lakes/bubbles/prepare.bases"

#include "./branches/lakes/bubbles/clean.bases"


#include "./branches/lakes/bubbles/lights/prepare.bases"

#include "./branches/lakes/bubbles/lights/clean.bases"


#include "./branches/lakes/bubbles/threads/prepare.bases"

#include "./branches/lakes/bubbles/threads/clean.bases"


#include "./branches/lakes/bubbles/moons/prepare.bases"

#include "./branches/lakes/bubbles/moons/clean.bases"



#include "./branches/trees/dirents/is.linuxes"

#include "./branches/trees/dirents/create.linuxes"
//
#include "./branches/trees/dirents/remove.linuxes"


#include "./branches/trees/files/is.linuxes"

#include "./branches/trees/files/save.linuxes"

#include "./branches/trees/files/get.linuxes"

#include "./branches/trees/files/remove.linuxes"



#include "./branches/parks/tenderness/out.bases"



#include "./branches/selfcheck/lakes/show.bases"

#include "./branches/selfcheck/lakes/judge-lights.bases"



#include "./branches/dreams/prepare.bases"

#include "./branches/dreams/clean.bases"


#include "./branches/dreams/checks/prepare.bases"

#include "./branches/dreams/checks/clean.bases"

#include "./branches/dreams/checks/begin.bases"


#include "./branches/dreams/checks/forms/blank.bases"


//#include "./branches/dreams/deamons/begin.bases"


#include "./branches/dreams/tests/prepare.bases"

#include "./branches/dreams/tests/clean.bases"

#include "./branches/dreams/tests/begin.bases"


//#include "./branches/dreams/snows/prepare.bases"

//#include "./branches/dreams/snows/clean.bases"

//#include "./branches/dreams/snows/begin.bases"

//#include "./branches/dreams/snows/deamons.bases"


#include "./branches/dreams/showings/prepare.bases"

#include "./branches/dreams/showings/clean.bases"

#include "./branches/dreams/showings/begin.bases"


//#include "./branches/dreams/spiders/prepare.bases"

//#include "./branches/dreams/spiders/clean.bases"

//#include "./branches/dreams/spiders/begin.bases"

//#include "./branches/dreams/spiders/deamons.bases"


#include "./branches/dreams/fallings/begin.bases"




#include "./stars-ship.c"




#include "./branches/dreams/seeds/begin.bases"




#include "./branches/flowers/begin.bases" // no blank check yet


#include "./roots/flowers/begin.standards" // int main(), return 0

cat './fst/roots/flowers/begin.arduino'  >>  './island.c'

EOF







# , ilyz
#
# , convert


cp  ./?.fst  ./?.c


:<<EOF

cp  ./?.fst  ./?.cpp

cp  ./?.fst  ./?.sh

cp  ./?.fst  ./?.java

cp  ./?.fst  ./?.py

EOF









# , ilyz
#
# , compile




cc   ./?.c  -o ./?


:<<EOF

c++  ./?.cpp  (-std=c++0x)   (-lm)   (-lpthead)   (-lasound)   (-lwiringpi)   -o ?

EOF









# , ilyz
#
# , clean




rm ./?.fst

rm ./?.c


:<<EOF

rm ./?.cpp

rm ./?.sh

rm ./?.java

rm ./?.py



rm ./?

EOF

