































































/*

 This is stm32 vga program
  use onenet kylin mini board
  connectted to gop could
  proved the vga display output

  of cause, this is plan,,



 use fsst/things to use on other board

*/













/*

 here are the head files

*/











/*

 # include "../startup_stm32f10x_hd.s"

*/





/*

 # include "../things/Kylin_mini_v1.2.h"


 # include "../things/library_stm32.h"

*/


 # include "../../things/stm/seed/dream.c"


/*

 引於 「../../things/stm/seed/dream.c」

*/




















/*

 the control function


 main door

*/


/*

 int main( void )

 {

*/


 void  *  main  (  void *  )

  {


/*

 無形 主人 擇 無形 者

 其

*/





























/*
		
 init the led

*/


/*

    init_gpio_group( group_led );

*/


 sleep_branch_basket   (   dream_saw  (  "apples_branch_basket_light"  )   );


/*

 夢柬枝 擇 夢柬 擇 「燈林枝號」者 者也

*/












/*

  and the pin

*/


/*

    init_gpio_pin(

                   mode_gpio_out,
                   group_led,
                   pin_led_1 | pin_led_2 | pin_led_3 | pin_led_4
                   speed_gpio

                 );

*/


 sleep_branch (



// the main loop

    while (1) {

        load_gpio( group_gpio, 6, mode_gpio_on  );

        sleep(1);

        load_gpio( group_gpio, 6, mode_gpio_off );

        sleep(1);}}

*/

  }

