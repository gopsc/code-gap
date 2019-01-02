







/*

 i can't understand these two lines

 ! this is used to judge is this head file has been included before

 i don need this because i always have a clearly plan
 
 
 is that good?
 is that good?

*/


/*

#ifndef  _DELAY_H


#define  _DELAY_H

// ...

#endif

*/











/*

 named it just like on gcc

 maybe someday it can use the seed code straightly



 yes i've been doing it
 
*/


/* 

int gop_sleep( unsigned short number_seconds ) {

*/


/*

 void * wait (  void * that_number_seconds  )
 
  {

*/


/*

 delay  =>  rest / wait

*/

/*

 void  *  that_delay  (
                         void  *  that_number_seconds,
                         void  *  that_number_count_delay
				      )
 
 {

*/

 void  *  that_rest  (
                        void  *  that_number_seconds_rest,
						void  *  that_number_count_rest
					 )
					 
  {








/*

 this is to save the result of 'SysTick->ctrl'

*/



/*

    unsigned int number_result_control;

*/


/*

 void  *  that_number_resule_control;


 that_number_result_control  =  malloc  (  sizeof ( unsigned int )  );

*/


 void  *  that_number_result_tick;
 
 
 that_number_result_tick  =  malloc  (  sizeof ( unsigned int )  );












/*

 ??
 turn it?

*/

/*

    number_seconds &= 0x00FFFFFF;

*/

 *  (  unsigned float *  )  that_number_seconds_rest  &=  0x00FFFFFF;












// prepare


    SysTick  ->  LOAD  =
                             (  *  (  unsigned float *  )  that_number_seconds_rest  )

					      *  (  *  (  unsigned int *  )  that_number_count_rest  )

			    		  *  1000000;


    SysTick  ->  VAL   =  0;
	
    SysTick  ->  CTRL  =  1;














// start the loop


/*

    do {

*/


 do
 
  {





// one command
// note this result


/*

        number_result_control = SysTick->CTRL;

*/


/*

 add a format translate
 
 coule slow it

*/


 *  (  unsigned int *  )  that_number_result_tick   =   SysTick  ->  CTRL;







// one command
// judge the loop


/*

 ?
 
*/



/*

      } while (

                (  number_result_control &   0x01      )

        &&      ( !number_result_control & ( 1 << 16 ) )

              )

*/


  }  while  (

                      (   *  ( unsigned int )  that_number_result_tick   &     0x01            )

     &&        (   !  (   *  ( unsigned int )  that_number_resule_tick   &   ( 1 << 16 )   )   )
           )








// clear this system tick


/*

    SysTick->CTRL = 0;
    SysTick->VAL  = 0;

*/


 SysTick  ->  CTRL   =   0;

 SysTick  ->  VAL    =   0;
















// don't know what will happen when the system tick with a wrong



/*

    return 1;

*/


 return  that . about . dream . yes;
 
 
 
  }


