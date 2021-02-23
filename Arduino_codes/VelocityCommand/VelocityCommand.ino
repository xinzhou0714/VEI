
#include <Encoder.h>
// Entend Encoder class

class SW_Encoder : public Encoder
{
public:
    uint8_t pinSW;
    int id;
    int counterSW;
    SW_Encoder(uint8_t pin1, uint8_t pin2, uint8_t pin3, int id) : Encoder(pin1, pin2) {
        this->pinSW = pin3;
        this->id = id;
        pinMode(pin3, INPUT_PULLUP);
        this->positionCahce = -999;
    }
    int read_switch() { return digitalRead(this->pinSW); }
    long getPositionCache() { return this->positionCahce; }
    void setPositionCache(long pos) { this->positionCahce = pos; }
    long getPositionNew() { return this->positionNew; }
    void setPositionNew(long pos) { this->positionNew = pos; }
private:
    long positionCahce;
    long positionNew;

};

SW_Encoder knob0(2, 5, 7, 0);

void setup() {
  // put your setup code here, to run once:
    Serial.begin(9600);
    Serial.println("oneKnobs Encoder Test:");
}

void loop() {
  // put your main code here, to run repeatedly:
    knob0.setPositionNew(knob0.read());     // scan input of encoder
    if (EncoderPositionChanged()) {
        Serial.print("knob0 = ");
        Serial.println(knob0.getPositionNew());
        knob0.setPositionCache(knob0.getPositionNew());
    }
    delayMicroseconds(10);
    ScanButton();

}


boolean EncoderPositionChanged() {
    return  knob0.getPositionCache() != knob0.getPositionNew();
}

void ScanButton() {
    if (!digitalRead(knob0.pinSW) && knob0.counterSW < 1) {
        knob0.write(0);
        Serial.print("knob");
        Serial.print(knob0.id);
        Serial.println(" has reset to zero");
        knob0.counterSW++;
    }
    if (digitalRead(knob0.pinSW))knob0.counterSW = 0;
}