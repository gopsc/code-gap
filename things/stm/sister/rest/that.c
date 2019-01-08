







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

 若明 _DELAY_H

 預示 _DELAY_H

 也

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











/*

 prepare


 預備

*/



 SysTick  ->  LOAD   =
                             (  *  (  unsigned float *  )  that_number_seconds_rest  )

                        *  (  *  (  unsigned int *  )  that_number_count_rest  )

                        *  1000000;


/*

 SysTick 之下 LOAD 為

 相化 無端點数址化 数之秒者之息者

 乘以 相化 無端数址化 数之累者之息者

 乘以 壹佰萬

*/



    SysTick  ->  VAL   =  0;
	
    SysTick  ->  CTRL  =  1;





















/*

 start the loop

*/


/*

    do {

*/


 do
 
  {


/*

 執行

 其

*/

















/*

 one command
 note this result

*/


/*

        number_result_control = SysTick->CTRL;

*/


/*

 add a format translate
 
 maybe slow it

*/


 *  (  unsigned int *  )  that_number_result_tick   =   SysTick  ->  CTRL;


/*

 相化 無端数址化 数之計者 為 SysTick 之下 CTRL 也

*/


















/*

 one command
 judge the loop

*/


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

               (      (   *  ( unsigned int * )  that_number_result_tick   &     0x01        )   )

     &&        (   !  (   *  ( unsigned int * )  that_number_resule_tick   &   ( 1 << 16 )   )   )
           )


/*

 權當

 相化 無端数址化 数之計者 比 0x01

 與

 相化 無端数址化 数之計者 不比 壹 左移 拾陆

 时

*/


/*

 權當

 其 相化 無端数址化 数之計者 之果 比 0x01

 與

 其 相化 無端数址化 数之計者 之果 不比 其 壹 左移 拾陆 之果

 时

*/















/*

 clear this system tick

*/



/*

    SysTick->CTRL = 0;
    SysTick->VAL  = 0;

*/


 SysTick  ->  CTRL   =   0;

 SysTick  ->  VAL    =   0;


/*

 SysTick 之下 CTRL 為 零 也

 SyeTick 之下 VAL 為 零 也

*/











/*

 don't know what will happen when the system tick with a wrong

*/



/*

    return 1;

*/


/*

 return  that . about . dream . yes;

*/


 return  that  ->  about  ->  dream  ->  yes
 

/*

 终成 雲夢泽 之 顺 也

*/


/*

 终成 雲夢泽 之下 顺 也

*/







  }


/*

 也

*/

