#include <Adafruit_Sensor.h>


#define TRC5000 7


void setup() {
  pinMode(TRC5000, INPUT);
  Serial.begin(9600);
}
int pessoa = 0;
int tempo = 0;
int detect = 0;
void loop() {

  for (int i = 0; i < 10000; i = i + 500) {
    int chave = digitalRead(7);
    if (chave == 0 && detect == 0) {
      detect++;
      pessoa++;
    } else if (chave == 1 && detect != 0){
      detect = 0;
    }
    delay(500);
  }

Serial.println(pessoa);
pessoa = 0;
detect = 0;

}