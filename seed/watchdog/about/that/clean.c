


/*

 this struct is huge, i must use a function to clean it,,


 give a value of its structure and that could clean many where

*/



 int clean_about  (  struct  gopi_about  that_about  )

  {

















/*

 first add this before change about name

    or the dog won't run


 and dog load configurations



 sometimes we clean it

 when lost a connectting

*/



 gop_about . flag . main  =  1;

 gop_about . flag . deamon  =  gop_about . flag . deamon;


 gop_about . flag . dog  =  0;

 gop_about . flag . start  =  0;

 gop_about . flag . show  =  0;


 gop_about . flag . connector  =  0;

 gop_about . flag . connectted  =  0;


 gop_about . flag . sound  =  0;

 gop_about . flag . sound_show  =  0;

 gop_about . flag . sound_save  =  0;












/*

 there is a symbol about it

 if it is reading we don't clean the symbol

 if not we clean it to blank



 we use symbol to little about soon

 then we put them with waitting

*/



 if  (

       strcmp ( that_about . symbol, "reading" )  !=  0

     )

  {


 strcpy ( that_about . symbol, "waitting" );

  }









/*

 clean about this

 ...

*/





    strcpy ( that_about . system . system, "" );

    strcpy ( that_about . system . name, "" );


/*
    strcpy ( that_about . system . user, "" );
*/













/*

 maybe we could found blank box

 or use realloc

*/



    int  number_ip;


    for (

           number_ip  = 0;
           number_ip <= 32;
           number_ip ++

        ) {


        if  (  strcmp (  that_about . network . ip [ number_ip ] [ 2 ],  ""  )  !=  0  ) {

            strcpy (  that_about . network . ip [ number_ip ] [ 2 ],  ""  );}

        else {

            break;}}



/*

 and others

 ...

*/






/*

 there are space used where mates pointe

 and clean them


 could be zero

*/


    if  (  that_about . number_mates  >  0  ) {




/*

 clean them, and free space

*/

        int i;

        for  (  i = 0;  i < that_about . numbr_mates;  i ++  ) {


            clean_about (  ( gopi_about * ) that_about . mates [ i ]  );

            free ( that_about . mates [ i ] );}






    that_about = 0;







    return 1;}
