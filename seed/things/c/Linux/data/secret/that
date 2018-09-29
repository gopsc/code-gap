















 int secret_encode (
                           char * that_message,
                     const char * that_type
                   )

  {






/*

 moved secrets keepping ways to another place

*/







/*

 drop note in message 

 use to read note 

*/



 if  (  strcmp ( that_type, "drop note" )  ==  0  )

  {


 secret_drop_note ( that_message );


 return 0;


  }









/*

 sum them


 and could judge the convent of words


 but this is still could goes wrong

 when this


 ...3...8...

 ...5...6...



 so there must be a another way to keep this secret


*/




 else if  (  strcmp ( that_type, "sum" )  ==  0  )

  {


 secret_sum ( tht_message );


 return 0;


  }











/*

 i test this way when i just found it

 now i could test it by 

*/


 else if  (  strcmp ( that_type, "blank" )  ==  0  )


  {


 return 1;


  }











/*

 something happened

*/



 return 0;



  }
