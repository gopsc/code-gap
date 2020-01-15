



/*

,, branches, prepare.arduino

*/

#include <Arduino.h>

/*

,

*/







/*

,, branches, prepare.c

*/

byte pageBuffer[256];

char str[] = "hi.";


void ***  that;

/*

,

*/










/*

,, things, renesas, gr-citrus


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
      cl2, tx2  ---| 6                 13 |---  ck
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

*/












/*

,, things, winbond, twenty-five-q

        -------------------
        | 。              |
        |                 |
  CS ---| 1             5 |--- VCC
        |                 |
  DO ---| 2             6 |--- HOLD
        |                 |
  WP ---| 3             7 |--- CLK
        |                 |
 GND ---| 4             8 |--- DI
        |                 |
        -------------------
        
,
        
*/



/*

,, things, winbond, twenty-five-q.c

*/

#define READ_JEDEC_ID  0x9F

#define READ_STATUS_1  0x05

#define READ_DATA      0x03

#define WRITE_ENABLE   0x06

#define PAGE_PROGRAM   0x02

#define CHIP_ERASE     0xC7

/*

,

*/






/*

,, things, winbond, twenty-five-q.arduino

*/


#include <SPI.h>





void *  thingsWinbondTwentyFiveQIdentificationRead ()

{
	
	
digitalWrite(SS, HIGH);
    
digitalWrite(SS, LOW);
    
    
SPI.transfer(READ_JEDEC_ID);
    
    
byte manuID = SPI.transfer(0);
    
byte memoType = SPI.transfer(0);
    
byte capa = SPI.transfer(0);
    
    
digitalWrite(SS, HIGH);


Serial.print("Manufacturer ID: "); Serial.println(manuID, HEX);
    
Serial.print("Memory Type: "); Serial.println(memoType, HEX);
    
Serial.print("Capacity : "); Serial.println(capa, HEX);




digitalWrite(SS, LOW);

    
SPI.transfer(READ_STATUS_1);
    
while(SPI.transfer(0) & 0x01);

    
digitalWrite(SS, HIGH);

    
}








void *  thingsWinbondTwentyFiveQChipErase ()

{
	

digitalWrite(SS, HIGH);
    
digitalWrite(SS, LOW);  
    
    
SPI.transfer(WRITE_ENABLE);
    
    
digitalWrite(SS, HIGH);
    
digitalWrite(SS, LOW);  
    
   
SPI.transfer(CHIP_ERASE);
    
    
digitalWrite(SS, HIGH);
    
    



digitalWrite(SS, LOW);

    
SPI.transfer(READ_STATUS_1);
    
while(SPI.transfer(0) & 0x01);

    
digitalWrite(SS, HIGH);


}








void *  thingsWinbondTwentyFiveQPageRead

( 
	
word pageNumber,

byte pageBuffer [],

int length

) 

{
	

// 16-bit data
    
digitalWrite(SS, HIGH);
    
digitalWrite(SS, LOW);
    
  
SPI.transfer(READ_DATA);
    
SPI.transfer((pageNumber >> 8) & 0xFF);
    
SPI.transfer(pageNumber & 0xFF);
    
SPI.transfer(0);
    
    
for(int i = 0; i < length; i++)
    
{

pageBuffer[i] = SPI.transfer(0);

}
    
    
digitalWrite(SS, HIGH);
    
    
    

digitalWrite(SS, LOW);

    
SPI.transfer(READ_STATUS_1);
    
while(SPI.transfer(0) & 0x01);

    
digitalWrite(SS, HIGH);


}







void *  thingsWinbondTwentyFiveQPageWrite

(

word pageNumber,

char pageBuffer [],

int length

) 

{
	

digitalWrite(SS, HIGH);
    
digitalWrite(SS, LOW);  
    
    
SPI.transfer(WRITE_ENABLE);
    
    
digitalWrite(SS, HIGH);
    
digitalWrite(SS, LOW);  
    
    
SPI.transfer(PAGE_PROGRAM);
    
SPI.transfer((pageNumber >>  8) & 0xFF);
    
SPI.transfer(pageNumber & 0xFF);
    
    
SPI.transfer(0);
    
    
for(int i = 0; i < length; i++)
    
{

SPI.transfer(byte(pageBuffer[i]));

}
    
    
digitalWrite(SS, HIGH);
    
    



digitalWrite(SS, LOW);

    
SPI.transfer(READ_STATUS_1);
    
while(SPI.transfer(0) & 0x01);

    
digitalWrite(SS, HIGH);


}

/*

,

*/











/*

,, branches, snake, dft.c


void *  branchesSnakeDft

(

void * thatNumbersN,

void * thatNumbersFt,

void * thatNumbersResultFt

)

{


void *  mo;

void *  t;

void *  w;

void *  n;


void *  num;

void *  numi;








for

(

* ( int * ) w  = 1;
* ( int * ) w <= * ( int * ) thatNumbersN / 2;
* ( int * ) w  = * ( int * ) w + 1

)

{


* ( int * ) num  = 0;

* ( int * ) numi = 0;








for

(

* ( int * ) n  = 1;
* ( int * ) n <= * ( int * ) thatNumbersN;
* ( int * ) n  = * ( int * ) n + 1

) 
        
{

* ( int * ) t    =   * ( int * ) n  /  ( * ( int * ) thatNumbersN );
            
* ( int * ) num  = * ( int * ) num  +  ( that [ * ( int * ) thatNumbersFt ] [ 1 ] [ * ( int * )  n ] * cos ( 2 * M_PI * * ( int * ) w * * ( int * ) t ) );

* ( int * ) numi = * ( int * ) num  -  ( that [ * ( int * ) thatNumbersFt ] [ 1 ] [ * ( int * )  n ] * sin ( 2 * M_PI * * ( int * ) w * * ( int * ) t ) );
            
}






* ( int * ) mo = sqrt ( * ( int * ) num * * ( int * ) num  +  * ( int * ) numi * * ( int * ) numi )  /  ( * ( int * ) thatNumbersN / 2 );
        
that [ * ( int * ) thatNumbersResultFt ] [ 1 ] [ * ( int * ) w ]  =  * ( int * ) mo;
        
}








}


,

*/




/*

,, branches, snake, fft.c

void *  branchesSnakeFft ( int site ) {



    double mo;
    double t;

    double buffer_fft[33][17][3];




    double round;
    double w;
    double n;

    for ( round=1; round<=32; round++ ) {

        for ( w=1; w<=16; w++ ) {

            buffer_fft[(int)round][(int)w][1] = 0;
            buffer_fft[(int)round][(int)w][2] = 0;

            for ( n=round; n<=N; n=n+32 ) {

                t = (n-round)/N;
                buffer_fft[(int)round][(int)w][1] += (result_sound[site][(int)n]*cos(2*M_PI*(double)w*t));
                buffer_fft[(int)round][(int)w][2] -= (result_sound[site][(int)n]*sin(2*M_PI*(double)w*t));}}}






//          result_sound[site][(int)n] * cos(2*M_PI*w/N * (n-round+round))

//        = result_sound[site][(int)n] * cos(2*M_PI*w/N*(n-round)) * cos(2*M_PI*(double)w/N*round)
//        - result_sound[site][(int)n] * sin(2*M_PI*w/N*(n-round)) * sin(2*M_PI*(double)w/N*round)



    double bin_fft[257][3];

    for ( w=1; w<=N/2; w++ ) {

        bin_fft[(int)w][1] = 0;
        bin_fft[(int)w][2] = 0;

        for ( round=1; round<=32; round++ ){



            bin_fft[(int)w][1]

        += (buffer_fft[(int)round][(int)w%16][1] * cos(2*M_PI*w*round/N)
           +buffer_fft[(int)round][(int)w%16][2] * sin(2*M_PI*w*round/N));



            bin_fft[(int)w][2]

        -= (buffer_fft[(int)round][(int)w%16][2] * cos(2*M_PI*w*round/N)
           -buffer_fft[(int)round][(int)w%16][1] * sin(2*M_PI*w*round/N));}




        mo = sqrt(bin_fft[(int)w][1]*bin_fft[(int)w][1] + bin_fft[(int)w][2]*bin_fft[(int)w][2]);
        mo = mo/(N/2);


        result_ft[site][(int)w] = mo;}}

,

*/











/*

,, branch, seed.arduino

*/

void setup()

{
    

pinMode(PIN_LED0, OUTPUT);
    
    
SPI.begin();

SPI.setDataMode(SPI_MODE0);
    
SPI.setBitOrder(MSBFIRST);
    
    
Serial.begin(9600);

    
}



void loop()

{

	
digitalWrite(PIN_LED0, LOW);
    
    

/*

thingsWinbondTwentyFiveQIdentificationRead ();
    
thingsWinbondTwentyFiveQChipErase ();
    
thingsWinbondTwentyFiveQPageWrite (0x0000, str, sizeof(str));
    
thingsWinbondTwentyFiveQPageRead(0x0000, pageBuffer, sizeof(str));
    
    
    
Serial.print("'");

for(int i = 0; i < sizeof(str); i++)
    
{

Serial.print(char(pageBuffer[i]));

}
    
    
Serial.print("'");
    
Serial.println();
    
*/



Serial.println( 0x0001 );


digitalWrite(PIN_LED0, HIGH);

delay(2000);


}

/*

,

*/




/*

,, river, zero

hi

,


,, river, one

it is two thousands and ninteen, july, seventh, one, eight

they said, gop need protein seventy five million microgram daily

they said, gop need lipids fifty million microgram daily

they said, gop need carbohydrates fifty five percent to sixty five percent of all energy intake

they said, gop need vitamin a eight hundred thousand microgram re daily

they said, gop need vitamin d ten microgram daily

they said, gop need vitamin e fourteen
 thousand microgram daily

they said, gop need vitamin c one hundred thousand microgram daily

they said, gop need vitamin b1 one thousand and three hundred microgram to one thousand and four hundred microgram daily

they said, gop need vitamin b2 one thousand and three hundred microgram to one thousand and four hundred microgram daily

they said, gop need vitamin pp thirteen thousand microgram to fourteen thousand microgram daily

they said, gop need calcium eight hundred thousand microgram daily

they said, gop need magnesium three hundred and fifty thousand microgram daily

they said, gop need phosphorus seventy hundred thousand microgram daily

they said, gop need potassium two million daily

,

*/











































