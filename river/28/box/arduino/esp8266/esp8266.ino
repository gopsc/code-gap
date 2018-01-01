bool   ok  = 0;
string that;

void setup() {
  
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);

  delay(1000);
  Serial.println("AT+RST");
  delay(1000);
    
  
  Serial.flush();
  Serial.println("AT+CWMODE=1");
  digitalWrite(LED_BUILTIN, HIGH);
  delay(1000);
  digitalWrite(LED_BUILTIN, LOW);


  Serial.flush();
  Serial.println("AT+CWJAP=\"gopi\",\"raspberry\"");
  delay(5000);}
  
  
  
  
//      if ( Serial.find("OK") ==  true ) {

  
  
  
  
void loop() {
    
    Serial.flush();
    Serial.println("AT+CIPSTART=\"TCP\",\"10.10.10.1\",520");
    delay(1000);
    
    Serial.println("AT+CIPSEND=3");
    delay(100);
    Serial.flush();
    Serial.println(that);
    delay(500);
    
    Serial.println("AT+CIPCLOSE");
    delay(500);}
