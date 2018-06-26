





/*

 this is to test

 and for good ideas

*/


/*

long number_time  = 0;

int  number_count  =  0;

*/



char buffer_force [ 2 ]  =  " ";





void setup() {

  // put your setup code here, to run once:
  
 
    Serial.begin ( 9600 );
  
  
  // set wifi

  // ...




  }






void loop () {
    
  // put your main code here, to run repeatedly:


  //number_time  = micros();




  buffer_force [ 0 ]  =  ( char ) analogRead ( A0 );


  Serial.print ( buffer_force );
  
  

  //other board to send

/*
  if  (  number_count  <  10240  ) {
  
    number_count  =  number_count - number_count;}
    
  else {
  
    number_count  =  number_count - number_count;}
*/




  //this return after this


  //buffer_force [ number_count ]  =  '\0';




  //delay ( 10 );

}
