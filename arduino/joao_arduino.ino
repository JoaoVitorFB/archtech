#include <Adafruit_Sensor.h>


#define TRC5000 7


void setup() {
  pinMode(TRC5000, INPUT);
  Serial.begin(9600);
}
int pessoa = 0;
int tempo = 0;
void loop() {

  for (int i = 0; i < 5000; i = i + 1000) {
    int chave = digitalRead(7);
    if (chave == 0) {
      pessoa++;
    }
    delay(1000);
  }

Serial.println(pessoa);
pessoa = 0;

}