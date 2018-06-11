
    int  number_count = 0;
    int  number_limit = 100;
    long number_time  = 0;



void setup() {
  // put your setup code here, to run once:
  
    Serial.begin(9600);

    number_limit = 100;}



void loop() {
  // put your main code here, to run repeatedly:

  number_time  = millis();

  
  for ( int i=1; i<8000; i++ ) {

      analogRead ( A0 );
      
      if  (  0 > number_limit  ) {
        
        delay(0);}}

  Serial.println( millis() - number_time );
}
