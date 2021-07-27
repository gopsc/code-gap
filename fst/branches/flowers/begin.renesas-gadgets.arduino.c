

void setup() {}



void loop()

{

























pinMode ( PIN_LED0, OUTPUT );

digitalWrite ( PIN_LED0, LOW );









digitalWrite ( PIN_LED0, LOW );









digitalWrite ( PIN_LED0, HIGH );

delay ( 100 );

digitalWrite ( PIN_LED0, LOW );

delay ( 100 );

digitalWrite ( PIN_LED0, HIGH );

delay ( 100 );

digitalWrite ( PIN_LED0, LOW );

delay ( 100 );

digitalWrite ( PIN_LED0, HIGH );

delay ( 100 );

digitalWrite ( PIN_LED0, LOW );
















Serial1 . begin ( 9600 );

Serial3 . begin ( 115200 );




//pinMode ( 9, OUTPUT );

//digitalWrite ( 9, HIGH );
















digitalWrite ( PIN_LED0, HIGH );

























while ( 1 )

{

























digitalWrite ( PIN_LED0, LOW );









if ( Serial3.available() > 0 )

{

Serial1 . println ( Serial3.readString() );

}









if ( Serial1.available() > 0 )

{

Serial3 . println ( Serial1.readString() );

}









digitalWrite ( PIN_LED0, HIGH );

























delay ( 10 );









//while ( 1 ) {}









}

























//digitalWrite ( 9, LOW );

Serial1 . end ();

Serial3 . end ();









digitalWrite ( PIN_LED0, LOW );

























}

