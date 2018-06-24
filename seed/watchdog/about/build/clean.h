



// this struct is huge, i must use a function to clean it,,




 int clean_about  (  struct gopi_about that_about  ) {







/*

 first add this before i change the name of the about struct everywhere

    or the dog won't run


 and dog do this other way



 sometimes we clean it

 when lost a connectting

*/


//    gop_about.flag.main = 1;











/*

 there is a symbol about this

 if it is reading we don't clean the symbol

 if not we clean it to blank

*/



    if  (  strcmp ( that_about . symbol, "reading" )  !=  0  ) {


        strcpy ( that_about . symbol, "waitting" );}









/*

 clean about this

 ...

*/





    strcpy ( that_about . system . system, "" );

    strcpy ( that_about . system . name, "" );

    strcpy ( that_about . system . user, "" );














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





        int i;

        for  (  i = 0;  i < that_about . numbr_mates;  i ++  ) {


            clean_about (  ( gopi_about * ) that_about . mates [ i ]  );






    that_about = 0;



    return 1;}
