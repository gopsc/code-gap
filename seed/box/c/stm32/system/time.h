



// i can't understand these two lines
//
// ! this is used to judge is this head file included before
//
// i don need this because i always have a clearly plan
// is that good?

/*
#ifndef _DELAY_H
#define _DELAY_H

//...

#endif
*/




// char is meanned charactor in gcc
//
//  but it seems like number there

 unsigned short number_count_sleep









// prepare the system tick and the count number

int init_delay() {


// this is a specificate

    SysTick->CTRL &= (1 << 2);

// there's two lines of commands in the delay loop
//
// .. 72MHz / 8
//
//      103 - 9

    number_count_sleep = 9;}










// named it judt like on gcc
//
// maybe someday it can use the seed code straightly

int gop_sleep( unsigned short number_seconds ) {


// this is to save the result of 'SysTick->ctrl'

    unsigned int number_result_control;




// ??
// turn it?

    number_seconds &= 0x00FFFFFF;




// prepare

    SysTick->LOAD = number_seconds * number_count_sleep * 1000000;
    SysTick->VAL  = 0;
    SysTick->CTRL = 1;




// start the loop

    do {


// one command
// note this result

        number_result_control = SysTick->CTRL;

// one command
// judge the loop

      } while (

                (  number_result_control &   0x01      )

        &&      ( !number_result_control & ( 1 << 16 ) )

              )



// clear this system tick

    SysTick->CTRL = 0;
    SysTick->VAL  = 0;



// don't know what will happen when the system tick with a wrong

    return 1;}


