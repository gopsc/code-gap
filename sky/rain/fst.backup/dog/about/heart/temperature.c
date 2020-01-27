

 int about_CPU_temperature ()

  {






 char note_path_temperature [ 64 ]  =  "/sys/class/thermal/thermal_zone0/temp";

 char note_temperature [ 32 ];

 int  note_number_temperature;










/*

 some don't have it

 maybe other place

*/

 if (  ! is_file ( path_temperature )  )

  {

 gop_about . cpu . temperature  =  -1;

  }




 else

  {


 file_get ( note_path_temperature, note_temperature );


 note_number_temperature  =  atoi ( note_temperature );





 if  (  strcmp ( gop_about . system . name, "raspberrypi" )  ==  0  )

  {

 gop_about . cpu . temperature  =  ( int ) note_number_temperature / 1000;

  }





 else if  (  strcmp ( gop_about . system . name, "Orangepi" )  ==  0  )

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }




 else if  (  strcmp ( gop_about . system . name, "OrangePI" )  ==  0  )

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }

/*

 ...

*/




 else if  (  number_temperature  >  10000  )

  {

 gop_about . cpu . temperature  =  ( int ) note_number_temperature / 1000;

  }


 else

  {

 gop_about . cpu . temperature  =  note_number_temperature;

  }





  }


 return 0;

  }
