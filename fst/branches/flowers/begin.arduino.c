

void setup() {}



void loop()

{

























pinMode ( LED_BUILTIN, OUTPUT );

digitalWrite ( LED_BUILTIN, LOW );









SoftwareSerial that_serial ( 11, 12 );
















digitalWrite ( LED_BUILTIN, LOW );









digitalWrite ( LED_BUILTIN, HIGH );

delay ( 100 );

digitalWrite ( LED_BUILTIN, LOW );

delay ( 100 );

digitalWrite ( LED_BUILTIN, HIGH );

delay ( 100 );

digitalWrite ( LED_BUILTIN, LOW );

delay ( 100 );

digitalWrite ( LED_BUILTIN, HIGH );

delay ( 100 );

digitalWrite ( LED_BUILTIN, LOW );
















Serial . begin ( 9600 );

that_serial . begin ( 9600 );
















digitalWrite ( LED_BUILTIN, HIGH );

























while ( 1 )

{

























digitalWrite ( LED_BUILTIN, LOW );









if ( that_serial.available() > 0 )

{

Serial . println ( that_serial.readString() );

}









if ( Serial.available() > 0 )

{

that_serial . println ( Serial.readString() );

}









digitalWrite ( LED_BUILTIN, HIGH );

























delay ( 10 );









//while ( 1 ) {}









}

























//digitalWrite ( 9, LOW );

Serial . end ();

that_serial . end ();









digitalWrite ( LED_BUILTIN, LOW );

























}
