



 int about_address ()

  {





 struct  ifaddrs  *  buffer_struct  =  NULL;





 void * buffer_pointer  =  NULL;

 char   buffer_address [ 128 ];

 int    number_address [ 2 ]  =  [ 0, 0 ];








/*

 use free soon

 aftr we could use symbol every step

*/


/*

 int i;

 for  (  i = 0;  i <= gop_about . network . number;  i ++   )

  {

 free  (  gop_about . network . ip [ i ]  );

  }

*/







/*

 get address tree

*/


 getifaddrs ( & buffer_struct );






 while  (  buffer_struct  !=  NULL  )

  {










/*

 this address may not gets

*/






 if (

         buffer_struct
                       -> ifa_addr

         !=  NULL

     )


  {












// IPv4


 if (

        buffer_struct
                      -> ifa_addr
                                  -> sa_family

        ==  AF_INET

    )


  {






 number_address [ 1 ] ++;




 buffer_pointer = & (

                      ( struct sockaddr_in * ) buffer_struct
                                                             ->  ifa_addr
                    )
                      -> sin_addr;



 inet_ntop (

             AF_INET,

             buffer_pointer,

             buffer_address,

             INET_ADDRSTRLEN

           );





 strcpy (

          gop_about . network . ip [  number_ip [ 1 ]  ] [ 1 ],

          buffer_struct -> ifa_name

        );


 strcpy (

          gop_about . network . ip [  number_ip [ 1 ]  ] [ 2 ],

          buffer_address

        );



  }











/*

/*

 IPv6


 use a little later

*/




 else if (

             buffer_struct
                           -> ifa_addr
                                       -> sa_family

             ==  AF_INET6

         )


 {





 number_address [ 2 ] ++;




 buffer_pointer =
                  & (
                      ( struct sockaddr_in * ) buffer_struct
                                                             -> ifa_addr
                    )
                      -> sin_addr;



 inet_ntop (

             AF_INET6,

             buffer_pointer,

             buffer_address,

             INET6_ADDRSTRLEN

           );



 strcpy (

          gop_about . network . ip [ 2 ] [  number_address [ 2 ]  ] [ 1 ],

          buffer_struct -> ifa_name

        );


 strcpy (

          gop_about . network . ip [ 2 ] [  number_address [ 2 ]  ] [ 2 ],

          buffer_address

         );



  }



*/





  }




/*

 get next one's place

*/

 buffer_struct  =  buffer_struct -> ifa_next;



  }








 gop_about . network . number  =  number_address [ 1 ];




 freeifaddrs ( buffer_struct );




 return 1;



  }















/*

 get address from ifconfig

 some linux don't have this

 maybe we could use ip link



 1 for name, 2 for address

*/




/*


 commandline_get  (  "ifconfig | grep 'Link encap' | cut -d ' ' -f1",             buffer_address [ 1 ]  );

 commandline_get  (  "ifconfig | grep 'inet addr'  | tr -s ' ' : | cut -d: -f4",  buffer_address [ 2 ]  );




/*

 it use different word

 and some could be another

*/




 if  (  strcmp ( buffer_address [ 1 ], "" )  ==  0  )

  {

 commandline_get  (  "ifconfig | grep ': '  | tr -s ' ' : | cut -d: -f1",  buffer_address [ 1 ] );

  }



 if  (  strlen ( buffer_address [ 2 ] )  <  7  )

  {

 commandline_get  (  "ifconfig | grep 'inet 地址'  | tr -s ' ' : | cut -d: -f4",  buffer_address [ 2 ]  );

  }



 if  ( strlen ( buffer_address [ 2 ] )  <  7  )

  {

 commandline_get  (  "ifconfig | grep 'inet '  | tr -s ' ' : | cut -d: -f3",  buffer_address [ 2 ]  );

  }









// for second read


 if  (  buffer_address [ 1 ] [  strlen ( buffer_address [ 1 ] ) - 1  ]  !=  '\n'  )

  {

 strcat ( buffer_address [ 1 ], "\n" );

  }




 if  (  buffer_address [ 2 ] [  strlen ( buffer_address [ 2 ] ) - 1  ]  !=  '\n'  )

  {

 strcat ( buffer_address [ 2 ], "\n" );

  }












/*

 second read


 line by line

*/







 int     number_address [ 3 ];

 char    buffer_address [ 3 ] [ 256 ];

 char * pointer_address [ 3 ];







 int i;

 for  (  i = 1;  i <= 2;  i = i + 1  )

  {





 number_address [ i ]  =  0;






// It will goes mess


 strcpy ( buffer_address [ i ], " " );

 pointer_address [ i ]  =  buffer_address [ i ];








/*

 here mess


 read it long words

*/

 while  (  strlen ( pointer_address [ i ] )  !=  0  )

  {




 number_address [ i ] ++;





 strcpy ( buffer_address [ i ], buffer_address [ i ] );



 pointer_address [ i ]  =  strstr ( buffer_address [ i ],  "\n" );





 if  (  strcmp ( pointer_address [ i ], "\n" )  !=  0  )

  {





 strcpy ( buffer_address [ i ], pointer_address [ i ] + 1 );





 * pointer_address [ i ]  =  '\0';



 pointer_address [ i ] ++;




 strcpy  (  gop_about . network . ip [  number_address [ i ]  ] [ i ],  buffer_address [ i ]  );




  }

  }


  }




 gop_about . network . number  =  number_address [ 1 ];




 return 1;

*/
