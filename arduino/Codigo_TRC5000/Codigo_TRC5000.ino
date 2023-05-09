
#include <Adafruit_Sensor.h>


#define TRC5000 7


void setup() {
  pinMode(TRC5000, INPUT);
  Serial.begin(9600);
}

int contHora = 0;
int contador = 0;
void loop() {
  int chave = digitalRead(7);


  while (contHora < 5000) {
    if (chave == 0) {
      contador++;
      contHora = contHora + 1000;
      delay(1000);
    } else{
      contHora = contHora + 1000;
      delay(1000);
    }
  }

  Serial.println(contador);
  contHora = 0;
  contador = 0;



  // if (contHora == 10000){
  // Serial.println(contador);
  // contHora = 0;
  // contador = 0;
  // }

  // if (chave == 0)
  // {
  //   contador++ ;

  // }
}
