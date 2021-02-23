
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

void setup() {
  // put your setup code here, to run once:

}

void loop() {
  // put your main code here, to run repeatedly:

}
