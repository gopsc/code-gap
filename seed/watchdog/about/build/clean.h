



// this struct is huge, i must use a function to clean it,,




 int clean_about  (  struct gopi_about that_about  ) {







/*

 first add this before i change the name of the about struct everywhere

    or the dog won't run


 and dog do this other way

*/


//    gop_about.flag.main = 1;











/*

 there is a symbol about this

 if it is reading we don't clean the symbol

 if not we clean it to blank

*/



    if (  strcmp ( that_about.symbol, "reading" ) != 0  ) {


        strcpy ( that_about.symbol, "wait" );}









/*

 clean about this

 ...

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



    return 1;}
