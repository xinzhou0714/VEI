
#include <Encoder.h>

#include <Ethernet.h>
#include <EthernetUdp.h>
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
SW_Encoder knob1(3, 6, 8, 1);
SW_Encoder knob2(18, 22, 26, 2);

// UDP related

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
IPAddress subnet(255, 255, 255, 0);
IPAddress ip(192, 168, 178, 100);
IPAddress txIP(192, 168, 178, 22); // Recipient IP from IPCONFIG
unsigned int rxPort = 24606;
unsigned int txPort = 24545;


//global variable
EthernetUDP Udp;
byte txbuff[28];// 1
long dat0, dat1, dat2, dat3, dat4, dat5;
int Mode = 2;
long stuff = 0xaabbccdd;
byte command1[] = { 1,1,1,1 };    //joint angle mode  , data format :    dat0 , stuff ,stuff ,stuff ,stuff ,stuff ,
byte command2[] = { 2,2,2,2 };    //inverse kinematic mode  , data format : dat0 ,dat1 ,dat2 ,stuff ,stuff ,stuff, 
void setup() {
    //init UDP
    Ethernet.begin(mac, ip, subnet);
    Udp.begin(rxPort);
    //for debugging
    Serial.begin(9600);
    Serial.println("oneKnobs Encoder Test:");
}

void loop() {
  // put your main code here, to run repeatedly:
    ScanEncoderInput();     // scan input of encoder
    if (EncoderPositionChanged()) {
        Serial_DisplayEncoderStatus();
        UpdateEncoderPositionCache();
        SendingUDP();
        
    }
    delayMicroseconds(10);
    ScanButton();

}


boolean EncoderPositionChanged() {
    return  knob0.getPositionCache() != knob0.getPositionNew() || 
        knob1.getPositionCache() != knob1.getPositionNew() || 
        knob2.getPositionCache() != knob2.getPositionNew();
}

void UpdateEncoderPositionCache() {
    knob0.setPositionCache(knob0.getPositionNew());
    knob1.setPositionCache(knob1.getPositionNew());
    knob2.setPositionCache(knob2.getPositionNew());
}


void Serial_DisplayEncoderStatus() {
    Serial.print("knob0 = ");
    Serial.print(knob0.getPositionNew());
    Serial.print(",");
    Serial.print("knob1 = ");
    Serial.print(knob1.getPositionNew());
    Serial.print(",");
    Serial.print("knob2 = ");
    Serial.print(knob2.getPositionNew());
    Serial.println();
}


void SendingUDP() {
    switch (Mode)
    {
    case 1: {
        Serial.print("Mode:");
        Serial.println(1);
        memcpy(txbuff,  command1, sizeof(command1));
        dat0 = knob0.getPositionNew();
        memcpy(txbuff + 4, &dat0, sizeof(long));
        memcpy(txbuff + 8, &stuff, sizeof(long));
        memcpy(txbuff + 12, &stuff, sizeof(long));
        memcpy(txbuff + 16, &stuff, sizeof(long));
        memcpy(txbuff + 20, &stuff, sizeof(long));
        memcpy(txbuff + 24, &stuff, sizeof(long));
        Udp.beginPacket(txIP, txPort); // praparing package to send to certain IP and Port
        Udp.write(txbuff, 28); // gathering data from buff and make one message to send
        Udp.endPacket();
        break;
    }
    case 2: {
        Serial.print("Mode:");
        Serial.println(2);
        memcpy(txbuff, command2, sizeof(command2));
        dat0 = knob1.getPositionNew();
        dat1 = knob2.getPositionNew();
        dat2 = knob0.getPositionNew();
        memcpy(txbuff + 4, &dat0, sizeof(long));
        memcpy(txbuff + 8, &dat1, sizeof(long));
        memcpy(txbuff + 12, &dat2, sizeof(long));
        memcpy(txbuff + 16, &stuff, sizeof(long));
        memcpy(txbuff + 20, &stuff, sizeof(long));
        memcpy(txbuff + 24, &stuff, sizeof(long));
        Udp.beginPacket(txIP, txPort); // praparing package to send to certain IP and Port
        Udp.write(txbuff, 28); // gathering data from buff and make one message to send
        Udp.endPacket();
        break;
    }
    default: {
        break;
    }

    }
}

void ScanEncoderInput() {
    knob0.setPositionNew(knob0.read());
    knob1.setPositionNew(knob1.read());
    knob2.setPositionNew(knob2.read());
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
    if (!digitalRead(knob1.pinSW) && knob1.counterSW < 1) {
        knob1.write(0);
        Serial.print("knob");
        Serial.print(knob1.id);
        Serial.println(" has reset to zero");
        knob1.counterSW++;
    }
    if (digitalRead(knob1.pinSW))knob1.counterSW = 0;

    if (!digitalRead(knob2.pinSW) && knob2.counterSW < 1) {
        knob2.write(0);
        Serial.print("knob");
        Serial.print(knob2.id);
        Serial.println(" has reset to zero");
        knob2.counterSW++;
    }


}