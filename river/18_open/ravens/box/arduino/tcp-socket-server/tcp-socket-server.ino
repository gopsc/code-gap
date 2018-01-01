#include <SPI.h>  
#include <WiFi.h>  
#include "C:\Program Files (x86)\Arduino\libraries\WiFi\extras\wifiHD\src\SOFTWARE_FRAMEWORK\SERVICES\LWIP\lwip-1.3.2\src\include\lwip\sockets.h"
   
// Enter a MAC address, IP address and Portnumber for your Server below.  
// The IP address will be dependent on your local network:  
byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };  
IPAddress serverIP(192,168,195,214);  
int serverPort=8888;  
   
// Initialize the Ethernet server library  
// with the IP address and port you want to use  
WiFiServer server(serverPort);  
   
void setup()  
{  
  // start the serial for debugging  
  Serial.begin(9600);  
  // start the Ethernet connection and the server:  
  WiFi.begin(mac, serverIP);  
  server.begin();  
  Serial.println("Server started");//log  
}  
   
void loop()  
{  
  // listen for incoming clients  
  WiFiClient client = server.available();  
  if (client) {  
    String clientMsg ="";  
    while (client.connected()) {  
      if (client.available()) {  
        char c = client.read();  
        //Serial.print(c);  
        clientMsg+=c;//store the recieved chracters in a string  
        //if the character is an "end of line" the whole message is recieved  
        if (c == '\n') {  
          Serial.println("Message from Client:"+clientMsg);//print it to the serial  
          client.println("You said:"+clientMsg);//modify the string and send it back  
          clientMsg="";  
        }  
      }  
    }  
    // give the Client time to receive the data  
    delay(1);  
    // close the connection:  
    client.stop();  
  }
  }
