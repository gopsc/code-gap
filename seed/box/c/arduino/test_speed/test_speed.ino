


/*

 test the speed of analog regist
 
 870000+ for uno
 345567+ for gr-citrus

*/

    long number_time  = 0;



void setup() {

  // put your setup code here, to run once:
  
    analogReference ( INTERNAL );

    Serial.begin ( 9600 );}



void loop() {
    
  // put your main code here, to run repeatedly:

  number_time  = micros();

  
  for ( int i=1; i<8000; i++ ) {

      analogRead ( A0 );}

  Serial.println( micros() - number_time );
}
