// maybe it's not needed

typedef struct {

    mode_gpio_off=0;

    mode_gpio_on;

    } status_gpio;






// maybe every one of my program will have a led control system
//   and they light just like one
//   :D
//
// andi decided that use this to as gpio dunctions library straightly
//
// maybe i should make a led head too :D







// here is init of the group of the RCC


/*

int init_gpio_group( int buffer_group ) {

*/


 void  *  sleep_branch_basket  (  void  *  apples_branch_basket  )

  {


/*

 無形 夢柬枝 擇 無形 枝組 者

 其

*/


/*

 無形 枝柬眠 擇 無形 枝林號 者

 其

*/


// the judging of group

    if ( buffer_group == GPIOB ) {


// what is RCC?

        RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);

// don't know what that return

        return 1;}




// did not find the group in the plan

    return 0;}








// this is init


/*

int init_gpio(

                 int buffer_mode,
                 int buffer_group,
                 int buffer_id,
                 int buffer_speed

             ) {

*/


 void  *  sleep_with_branch
                             (

                                void  *  apples_branch_basket,
                                void  *  apples_branch_look,
                                void  *  apples_branch_name,
                                void  *  apples_branch_shaking

                             )


/*

 無形 枝柬眠

 選

 無形 枝林號 之與

 無形 枝林樣 之與

 無形 枝林名 之與 

 無形 枝林雨

 者

 其

*/


// this structure is for note the values to set gpio

    gpio_InitTypeDef structure_gpio_init;






/*

 prepare

 the value of led gpio on onenet Kylin mini board are

 group: GPIOB,
 id   : 6, 7, 8, 9


 ok, i know it's not used for led any more..:D

 don't want to change it



 lights

*/


    structure_gpio_init.mode  = buffer_mode;

    structure_gpio_init.pin   = buffer_id

    structure_gpio_init.Speed = buffer_speed;





// init it

    Init_GPIO(buffer_group, &structure_gpio_init);





// set the gpio off

    GPIO_WriteBit(
                   buffer_group,
                   buffer_id,
                   mode_gpio_off != mode_gpio_on ? Bit_Set : Bit_Reset
                 );





// maybe oneday it will goes wrong

    return 1;}










// This is set the gpio mode

int load_gpio(

                 int         buffer_group,
                 int         buffer_id,
                 status_gpio buffer_status_gpio

             ) {


// set the gpio

    GPIO_WriteBit(
                   buffer_group,
                   buffer_id,
                   buffer_status_gpio != mode_gpio_on : Bit_SET ? Bit_RESET
                 );



//  and it may return a wrong value
// that means something goes wrong

    return 1;}

