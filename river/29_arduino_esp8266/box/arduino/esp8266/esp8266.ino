String recv;
int    count;

void setup() {
  
  Serial.begin(115200);
  pinMode(LED_BUILTIN, OUTPUT);


  Serial.println("AT+RST");
  while ( !Serial.find("OK") ) {
      delay(100);}
    
  Serial.println("AT+CWMODE=1");
  while ( !Serial.find("OK") ) {
      delay(100);}





  digitalWrite(LED_BUILTIN, HIGH);
  
  Serial.println("AT+CWJAP=\"gopi\",\"raspberry\"");
  
  count = 0;
  while ( !Serial.find("CONNECTED") or !Serial.find("WIFI GOT IP") ) {
    delay(100);
    count++;
    if ( count == 10 ) {
        Serial.println("AT+CWJAP=\"gopi\",\"raspberry\"");
        count = 0;}}
  
  digitalWrite(LED_BUILTIN, LOW);}
  
  
  
  

  
  
String message;
int    length;
String command;

void loop() {
  
  
           message  = "This is gop station.";
           message += "\n------------------------------\n";
           message += "esp8266,Arduino\n\n";
           message += recv;
           message += "\n------------------------------\n";
           message += "Message.";
           
           length   = message.length();
    
           command  = "AT+CIPSEND=";
           command += length;
    
    
    Serial.println("AT+CIPSTART=\"TCP\",\"10.10.10.1\",520");
    
    while ( !Serial.find("CONNECT") ) {
      
        digitalWrite(LED_BUILTIN, HIGH);
        delay(100);
        digitalWrite(LED_BUILTIN, LOW);
        
        count++;
        if ( count == 10 ) {
            Serial.println("AT+CIPSTART=\"TCP\",\"10.10.10.1\",520");
            count = 0;}}
    
    
    
    Serial.println(command);
    delay(100);
    Serial.println(message);
    delay(100);
   
    recv = Serial.readString();
    
    Serial.println("AT+CIPCLOSE");
    delay(100);}
