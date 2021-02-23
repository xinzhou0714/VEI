//Declaring


long int YAxis = A0; //Declaring where the X axis and Y axis of the joystick pins are wired
long int XAxis = A1; //Of course analog inputs

long int X;
long int Y;



void setup() {
  // put your setup code here, to run once:
	Serial.begin(9600); //Setting the Serial monitor baude rate and launching
	pinMode(XAxis, INPUT); //Declaring the pin modes 
	pinMode(YAxis, INPUT);

}

void loop() {
  // put your main code here, to run repeatedly:
	long int X0 = analogRead(XAxis); //Reading from the X axis potentiometer
	long int X1 = map(X0, 0, 1023, 0, 4000);
	X = X1 - 2000;
	Serial.println(X);


	long int Y0 = analogRead(YAxis);//Reading from the Y axis potentiometer
	long int Y1 = map(Y0, 0, 1023, 0, 2000);
	Y = Y1 - 1000;
	Serial.println(Y);
	delay(1000);

}
