bool ok  = 0;


void setup() {
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);


  while ( ok == 0 ) {
      Serial.println("AT+RST");
      Serial.println("AT+CWMODE=1");
      
      if ( Serial.find("OK") ==  true ) {
        digitalWrite(LED_BUILTIN, HIGH);
        Serial.flush();

        ok = 1;}
      else {
        delay(1000);}}}


void loop() {
  Serial.println("AT+CWJAP=\"gopi\",\"44112233\"");
  //Serial.println("AT+CWJAP=\"gopi\",\"44112233\"");
  }
