






// maybe every one of my program will have a led control system
//   and they light just like one
//   :D
//
// andi decided that use this to as gpio dunctions library straightly





// this is init

int init_gpio(

                 int number_mode,
                 int number_group,
                 int number_id,

             ) {




// this structure is for note the values to set gpio

    gpio_InitTypeDef structure_gpio_init;







    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);





// prepare

    structure_gpio_init.mode  = GPIO_Mode_Out_PP;

    structure_gpio_init.pin   = GPIO_Pin_6
                              | GPIO_Pin_7
                              | GPIO_Pin_8
                              | GPIO_Pin_9

    structure_gpio_init.Speed = GPIO_Speed_50MHz





// init it

    Init_GPIO(GPIOB, &structure_gpio_init);





// set the gpio off

    GPIO_WriteBit(
                   number_group,
                   number_id,
                   0 != 0 ? Bit_Set : Bit_Reset
                 );





// maybe oneday it will goes wrong

    return 1;}










// This is set the gpio mode

int load_gpio(

                 int number_group,
                 int number_id,
                 int number_status

             ) {


// set the gpio

    GPIO_WriteBit(
                   number_group,
                   number_id,
                   number_status != 0 : Bit_SET ? Bit_RESET
                 );



//  and it may return a wrong value
// that means something goes wrong

    return 1;}

