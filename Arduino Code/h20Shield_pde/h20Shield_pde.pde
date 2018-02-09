// h20 Shield Board Testing Sketch
// Written By: Jay Collett
// Date: 5/2/2011
// This sketch will simply cycle through the three valve controllers turning them on, waiting 5 seconds and turning them off one at a time.

// declare our const values
const byte valveOneOpenPin = 2;
const byte valveOneClosePin = 3;
const byte valveTwoOpenPin = 4;
const byte valveTwoClosePin = 5;
const byte valveThreeOpenPin = 6;
const byte valveThreeClosePin = 7;
const byte voltageBoosterEnablePin = 9;
const byte valveOneOpenLED = A3;
const byte valveTwoOpenLED = A2;
const byte valveThreeOpenLED = A1;
const byte capChargeTimeMS = 1500;


// delcare global vars
byte valveOneOpen = 0;
byte valveTwoOpen = 0;
byte valveThreeOpen = 0;

void setup() {

  // first make sure 24V boost is disabled
  pinMode(voltageBoosterEnablePin, OUTPUT);
  digitalWrite(voltageBoosterEnablePin, HIGH); // high disables the chip, LOW/float enables it

  // set pinmodes for open/close valve pins
  pinMode(valveOneOpenPin, OUTPUT);
  pinMode(valveOneClosePin, OUTPUT);
  pinMode(valveTwoOpenPin, OUTPUT);
  pinMode(valveTwoClosePin, OUTPUT);
  pinMode(valveThreeOpenPin, OUTPUT);
  pinMode(valveThreeClosePin, OUTPUT);
  pinMode(valveOneOpenLED, OUTPUT);
  pinMode(valveTwoOpenLED, OUTPUT);
  pinMode(valveThreeOpenLED, OUTPUT);

  // turn off all trans/valve pins
  digitalWrite(valveOneOpenPin, LOW);
  digitalWrite(valveOneClosePin, LOW);
  digitalWrite(valveTwoOpenPin, LOW);
  digitalWrite(valveTwoClosePin, LOW);
  digitalWrite(valveThreeOpenPin, LOW);
  digitalWrite(valveThreeClosePin, LOW);
  digitalWrite(valveOneOpenLED, LOW);
  digitalWrite(valveTwoOpenLED, LOW);
  digitalWrite(valveThreeOpenLED, LOW); 

  // turn on the boost circuit
  digitalWrite(voltageBoosterEnablePin, LOW);
  
  Serial.begin(9600);
}

void loop() {

  openValveOne();
  delay(5000);
  closeValveOne();

  delay(5000);

  openValveTwo();
  delay(5000);
  closeValveTwo();

  delay(5000);

  openValveThree();
  delay(5000);
  closeValveThree();

  delay(5000);

}


// helper functions
void openValveOne() {
  delay(capChargeTimeMS); // needed to ensure cap is charged enough (still playing with this value to what the min needed is)
  digitalWrite(valveOneOpenPin, HIGH);
  delay(25); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveOneOpenPin, LOW);
  analogWrite(valveOneOpenLED, 255); // turn on valve status LED
  valveOneOpen = 1;
}

void closeValveOne() {
    
  // to replicate the factory orbit controller, we initiate an open valve then close it quickly
  digitalWrite(valveOneOpenPin, HIGH);
  delay(25); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveOneOpenPin, LOW);
  delay(150);
 
  digitalWrite(valveOneClosePin, HIGH);
  delay(75); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveOneClosePin, LOW);
  analogWrite(valveOneOpenLED, 0); // turn off valve status LED
  valveOneOpen = 0;
}

void openValveTwo() {
  delay(capChargeTimeMS); // needed to ensure cap is charged enough (still playing with this value to what the min needed is)
  digitalWrite(valveTwoOpenPin, HIGH);
  delay(25); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveTwoOpenPin, LOW);
  analogWrite(valveTwoOpenLED, 255); // turn on valve status LED
  valveTwoOpen = 1;
}

void closeValveTwo() {
  
  // to replicate the factory orbit controller, we initiate an open valve then close it quickly
  digitalWrite(valveTwoOpenPin, HIGH);
  delay(25); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveTwoOpenPin, LOW);
  delay(150);
  
  digitalWrite(valveTwoClosePin, HIGH);
  delay(75); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveTwoClosePin, LOW);
  analogWrite(valveTwoOpenLED, 0); // turn off valve status LED
  valveTwoOpen = 0;
}

void openValveThree() {
  delay(capChargeTimeMS); // needed to ensure cap is charged enough (still playing with this value to what the min needed is)
  digitalWrite(valveThreeOpenPin, HIGH);
  delay(25); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveThreeOpenPin, LOW);
  analogWrite(valveThreeOpenLED, 255); // turn on valve status LED
  valveThreeOpen = 1;
}

void closeValveThree() {
  
  // to replicate the factory orbit controller, we initiate an open valve then close it quickly
  digitalWrite(valveThreeOpenPin, HIGH);
  delay(25); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveThreeOpenPin, LOW);
  delay(150);

  digitalWrite(valveThreeClosePin, HIGH);
  delay(75); // only leave the current on long enough to trigger the relay, leave it on any longer at your own RISK
  digitalWrite(valveThreeClosePin, LOW);
  analogWrite(valveThreeOpenLED, 0); // turn off valve status LED
  valveThreeOpen = 0;
}

