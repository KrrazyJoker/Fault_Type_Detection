int relayPin = 8; // Change this to the pin your relay is connected to
void setup() {
  pinMode(relayPin, OUTPUT);
  Serial.begin(9600); // Start serial communication at 9600 baud rate
}
void loop() {
  if (Serial.available() > 0) { 
    int state = Serial.read() - '0'; // Read the state from MATLAB
    if (state == 1) {
      digitalWrite(relayPin, HIGH); // Trip the relay  }
    else {
      digitalWrite(relayPin, LOW); // Reset the relay  }
    }
}