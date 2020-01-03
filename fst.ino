/* GR-CITRUS Sketch Template V2.20 */




#include <Arduino.h>

#include <SPI.h>









/*

        -----------------
        | 。            |
        |               |
  CS ---| 1           5 |--- VCC
        |               |
  DO ---| 2           6 |--- HOLD
        |               |
  WP ---| 3           7 |--- CLK
        |               |
 GND ---| 4           8 |--- DI
        |               |
        -----------------
*/


#define READ_JEDEC_ID  0x9F

#define READ_STATUS_1  0x05

#define READ_DATA      0x03

#define WRITE_ENABLE   0x06

#define PAGE_PROGRAM   0x02

#define CHIP_ERASE     0xC7







byte pageBuffer[256];

char str[] = "An apple a day keeps the doctor away."; //short than 256






void CheckBusy()

{
	
    digitalWrite(SS, HIGH);
    
    digitalWrite(SS, LOW);

    
    SPI.transfer(READ_STATUS_1);
    
    while(SPI.transfer(0) & 0x01);

    
    digitalWrite(SS, HIGH);

}



void ReadID()

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


    CheckBusy();
    
}



void EraseChip()

{
	
    digitalWrite(SS, HIGH);
    
    digitalWrite(SS, LOW);  
    
    
    SPI.transfer(WRITE_ENABLE);
    
    
    digitalWrite(SS, HIGH);
    
    digitalWrite(SS, LOW);  
    
    
    SPI.transfer(CHIP_ERASE);
    
    
    digitalWrite(SS, HIGH);
    
    
    CheckBusy();
    
}



void ReadPage(word pageNumber, byte pageBuffer[], int length) 

{
	
    // pageNumber: 16-bit data
    
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
    
    
    CheckBusy();
    
}



void WritePage(word pageNumber, char pageBuffer[], int length) 

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
    
    
    CheckBusy();
    
}



/*

void dft(int site) {


    double mo;
    double t;
    double w;
    double n;

    for ( w=1; w<=N/2; w++ ) {

        double num  = 0;
        double numi = 0;

        for ( n=1; n<=N; n++ ) {

            t = n/N;
            num  += (result_sound[site][(int)n]*cos(2*M_PI*w*t));
            numi -= (result_sound[site][(int)n]*sin(2*M_PI*w*t));}

        mo = sqrt(num*num+numi*numi)/(N/2);

        if (mo > 1){

            output_print( "double", (char*)&w    );
            output_print( "string",        ":"   );
            output_print( "double", (char*)&mo   );
            output_print( "string",        "\n"  );}

        result_ft[site][(int)w] = mo;}}






void fft(int site) {



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


        result_ft[site][(int)w] = mo;}

    if ( information_flag.sound_show ) {

        ft_show(site);}}


*/


void setup()

{
	
    SPI.begin();

    SPI.setDataMode(SPI_MODE0);
    
    SPI.setBitOrder(MSBFIRST);
    
    
    Serial.begin(9600);


    ReadID();
    
    
    EraseChip();
    
    
    WritePage(0x1234, str, sizeof(str));
    
}



void loop()

{
	
    ReadPage(0x1234, pageBuffer, sizeof(str));
    

    for(int i = 0; i < sizeof(str); i++)
    
    {
        Serial.print(char(pageBuffer[i]));
    }
    
    
    Serial.println();
    

    delay(2000);
    
}


