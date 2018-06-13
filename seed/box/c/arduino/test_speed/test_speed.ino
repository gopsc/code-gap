
    long number_time  = 0;



void setup() {

  // put your setup code here, to run once:
  
    analogReference ( INTERNAL );

    Serial.begin ( 9600 );}



void loop() {
    
  // put your main code here, to run repeatedly:

  number_time  = millis();

  
  for ( int i=1; i<8000; i++ ) {

      analogRead ( A0 );}

  Serial.println( millis() - number_time );
}
