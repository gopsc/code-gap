
,, renesas,gadget,citrus.gems


microcontroller :  rx631 ( r5f5631fddfp )

rom/ram :  2 mega bytes (*) / 256 kilo bytes

data flash :  32 kilo bytes

main clock :  96 mega hertz ( 12 mega hertz * 8 )

sub clock :  32.768 kilo hertz

input voltage :  5 volts ( usb )

operating voltage :  3.3 volts

( note :  960 kilo bytes is available in case of using usb msc firmware on gr-citrus )



                           serial ( usb )
          
                   ------------------------
                   |         |__|         |
                   |                      |
 int0, da1, rx1 ---| 0                 5v |---
                   |                      |
 int1, cl1, tx1 ---| 1                gnd |---
                   |                      |
     int18, da  ---| 18      ----   reset |---
                   |         |  |         |
     int19, cl  ---| 19      ----    3.3v |---
                   |        reset         |
          int2  ---| 2                 A3 |---
                   |                      |
          int3  ---| 3                 A2 |---
                   |                      |
                ---| 4                 A1 |---
                   |                      |
      da2, rx2  ---| 5                 A0 |---
                   |                      |
      cl2, tx2  ---| 6                 13 |---  clk
                   |                      |
int6, da3, rx3  ---| 7                 12 |---  mi, rx4, da4
                   |                      |
      cl3, tx3  ---| 8                 11 |---  mo, tx4, cl4
                   |                      |
     dac, int6  ---| 9                 10 |---  ss
                   |                      |
                   |                      |
                   |                      |
                   ------------------------



analog write & digital write/read ( 5 volts tolerant ) :  0, 1, 2, 3, 4, 7, 8, 18, 19

analog write & digital write/read ( 3.3 volts tolerant ) :  5, 6, 9, 10, 11, 12, 13


analog read & digital write/reads :  A0, A1, A2, A3



da :  data

cl :  clock


int :  interrupt

,