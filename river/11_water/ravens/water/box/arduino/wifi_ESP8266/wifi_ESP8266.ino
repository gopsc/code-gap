
int    led = 13;
bool   flag = false;
String result = "";




void setup() {
  
  
  
  delay(1000);
  pinMode(led, OUTPUT);  
  Serial.begin(9600);
  delay(1000);
  
  while (Serial.available() > 0){
    Serial.read();}
  
  Serial.print( "AT+CWMODE=1" );
  delay(1000);
  while (Serial.available() > 0){
    result += char(Serial.read());
    delay(10);}
  
  if (result == "done") {
    digitalWrite(led, HIGH);
    delay(1000);
    digitalWrite(led, LOW);
    result = "";
    
    flag = true;}}






void loop() {
  delay(100);
  if (flag != true) {
    setup();}}


