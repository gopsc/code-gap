










 struct gopi_sound


  {




/*

 Sometimes i wanna use alsa

 maybe sometimes we need to use

 adc, network, or python or otherss

*/

//    char type_corde [ 32 ] = "blank";









/*

 The saving path of
     sound  files


 we use data of trees

*/


// char  path_sound [ 128 ];







/*

 The number of words' file

*/

 int number_listen = 1;










/*


  ------<--------1234...-------------



 maybe use a symbol

 maybe two of it

*/



 double result_sound [ 200 ] [ 513 ];
//                   [ num ] [  t  ]


 double result_ft [ 200 ] [ 513 ];
//                [  t  ] [  w  ]


 double buffer_listen [ 100 ] [ 513 ] [ 200 ];
//                    [ num ] [  w  ] [  t  ]



  };



