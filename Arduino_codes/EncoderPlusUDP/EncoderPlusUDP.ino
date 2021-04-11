/* Encoder Library - TwoKnobs Example
 * http://www.pjrc.com/teensy/td_libs_Encoder.html
 *
 * This example code is in the public domain.
 */

#include <Encoder.h>

#include <Ethernet.h>
#include <EthernetUdp.h>


 // Change these pin numbers to the pins connected to your encoder.
 //   Best Performance: both pins have interrupt capability
 //   Good Performance: only the first pin has interrupt capability
 //   Low Performance:  neither pin has interrupt capability



// Entend Encoder class

class SW_Encoder: public Encoder
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
    long getPositionNew(){ return this->positionNew; }
    void setPositionNew(long pos) { this->positionNew = pos; }
private:
    long positionCahce;
    long positionNew;

};



SW_Encoder knob0(2 , 5 , 7 ,0);
SW_Encoder knob1(3 , 6 , 8 ,1);
SW_Encoder knob2(18, 22, 26,2);
SW_Encoder knob3(19, 23, 27,3);
SW_Encoder knob4(20, 24, 28,4);
SW_Encoder knob5(21, 25, 29,5);
//   avoid using pins with LEDs attached

// UDP related

byte mac[] = {0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED};
IPAddress subnet(255, 255, 255, 0);
IPAddress ip(192, 168, 178, 100);
IPAddress txIP(192, 168, 178, 22); // Recipient IP from IPCONFIG
unsigned int rxPort = 24606;
unsigned int txPort = 24545;

// buffers for receiving and sending data
char packetBuffer[UDP_TX_PACKET_MAX_SIZE]; //buffer to hold incoming packet
char ReplyBuffer[] = "acknowledged"; // a string to send back

EthernetUDP Udp;
byte txbuff[28];// 1
byte rxbuff[1];

long dat0, dat1, dat2, dat3, dat4, dat5 ;

// global variables

boolean Mode = false;
byte command1[] = { 1,2,3,4 };
byte command2[] = { 9,8,7,6 };
byte data1[4];

void setup() {

    //Start Communication
    Ethernet.begin(mac, ip, subnet);
    Udp.begin(rxPort);

    //Serial f¨¹r Debugging
    Serial.begin(9600);
    Serial.println("SixKnobs Encoder Test:");
}


void loop() {

    ScanEncoderInput();
    if (AtLeastOneKnobChanged()) {
        Serial_DisplayEncoderStatus();
        UpdatePositionCaches();

        memcpy(txbuff, Mode ? command1 : command2, sizeof(Mode ? command1 : command2));
        
        dat0 = knob0.getPositionNew();
        dat1 = knob1.getPositionNew();
        dat2 = knob2.getPositionNew();
        dat3 = knob3.getPositionNew();
        dat4 = knob4.getPositionNew();
        dat5 = knob5.getPositionNew();


        memcpy(txbuff+4, &dat0, sizeof(long));
        memcpy(txbuff + 8, &dat1, sizeof(long));
        memcpy(txbuff + 12, &dat2, sizeof(long));
        memcpy(txbuff + 16, &dat3, sizeof(long));
        memcpy(txbuff + 20, &dat4, sizeof(long));
        memcpy(txbuff + 24, &dat5, sizeof(long));
        Udp.beginPacket(txIP, txPort); // praparing package to send to certain IP and Port
        Udp.write(txbuff, 28); // gathering data from buff and make one message to send
        Udp.endPacket();
        

        
    }
    // if button is pressed ,reset correspondent encoder to zero
    ScanButton();

    // Change Working mode by Serial monitor
    if (Serial.available()) {
        Serial.readString();
        FlipMode();
        Serial.print("Command Mode changed to ");
        Serial.println(Mode ? "Forward" : "Inverse");
    }


}



boolean AtLeastOneKnobChanged() {
    return  knob0.getPositionCache() != knob0.getPositionNew() ||
        knob1.getPositionCache() != knob1.getPositionNew() ||
        knob2.getPositionCache() != knob2.getPositionNew() ||
        knob3.getPositionCache() != knob3.getPositionNew() ||
        knob4.getPositionCache() != knob4.getPositionNew() ||
        knob5.getPositionCache() != knob5.getPositionNew();
}

void ScanEncoderInput() {
    knob0.setPositionNew(knob0.read());
    knob1.setPositionNew(knob1.read());
    knob2.setPositionNew(knob2.read());
    knob3.setPositionNew(knob3.read());
    knob4.setPositionNew(knob4.read());
    knob5.setPositionNew(knob5.read());
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
    Serial.print(",");
    Serial.print("knob3 = ");
    Serial.print(knob3.getPositionNew());
    Serial.print(",");
    Serial.print("knob4 = ");
    Serial.print(knob4.getPositionNew());
    Serial.print(",");
    Serial.print("knob5 = ");
    Serial.print(knob5.getPositionNew());
    Serial.println();
}


void UpdatePositionCaches() {
    knob0.setPositionCache(knob0.getPositionNew());
    knob1.setPositionCache(knob1.getPositionNew());
    knob2.setPositionCache(knob2.getPositionNew());
    knob3.setPositionCache(knob3.getPositionNew());
    knob4.setPositionCache(knob4.getPositionNew());
    knob5.setPositionCache(knob5.getPositionNew());
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
    if (digitalRead(knob2.pinSW))knob2.counterSW = 0;

    if (!digitalRead(knob3.pinSW) && knob3.counterSW < 1) {
        knob3.write(0);
        Serial.print("knob");
        Serial.print(knob3.id);
        Serial.println(" has reset to zero");
        knob3.counterSW++;
    }
    if (digitalRead(knob3.pinSW))knob3.counterSW = 0;

    if (!digitalRead(knob4.pinSW) && knob4.counterSW < 1) {
        knob4.write(0);
        Serial.print("knob");
        Serial.print(knob4.id);
        Serial.println(" has reset to zero");
        knob4.counterSW++;
    }
    if (digitalRead(knob4.pinSW))knob4.counterSW = 0;

    if (!digitalRead(knob5.pinSW) && knob5.counterSW < 1) {
        knob5.write(0);
        Serial.print("knob");
        Serial.print(knob5.id);
        Serial.println(" has reset to zero");
        knob5.counterSW++;
    }
    if (digitalRead(knob5.pinSW))knob5.counterSW = 0;
}


void FlipMode() {
    Mode = !Mode;
}