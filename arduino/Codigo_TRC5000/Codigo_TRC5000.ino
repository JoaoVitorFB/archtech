
#include <Adafruit_Sensor.h>

 
#define TRC5000 7
 

void setup()
{
  pinMode(TRC5000, INPUT);
  Serial.begin(9600);
}
 
void loop() 
{
  int chave = digitalRead(7);
  if (chave == 0)  
  {  
    Serial.print(chave);  
  }  
  else  
  {  
    Serial.print(chave);  
  }
  delay (350);
  Serial.println();
}