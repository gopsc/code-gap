

// This is stm32 vga program
//  use onenet kylin mini board
//  connectted to gop could
//  proved the vga display output
//
// of cause, this is plan,,




// here are the head files

#include <gop_library_stm32.h>





// the control function

int main( void ) {




// init the led

    init_gpio_group( group_led );

//  and the pin

    init_gpio_pin(

                   mode_gpio_out,
                   group_led,
                   pin_led_1 | pin_led_2 | pin_led_3 | pin_led_4
                   speed_gpio

                 );



// the main loop

    while (1) {

        load_gpio( group_gpio, 6, mode_gpio_on  );

        sleep(1);

        load_gpio( group_gpio, 6, mode_gpio_off );

        sleep(1);}}

