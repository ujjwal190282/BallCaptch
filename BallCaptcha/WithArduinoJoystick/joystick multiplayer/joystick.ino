int xValue = 0 ; // read value of the X axis 1  
int yValue = 0 ; // read value of the Y axis  1
int xValue1 = 0 ; // read value of the X axis  2
int yValue1 = 0 ; // read value of the Y axis   2

void setup()  
{ 
  Serial.begin(9600) ; // Open the serial port 
} 

void loop() 
{ 
  // Read analog port values A0 and A1  
  xValue = analogRead(A0);  
  yValue = analogRead(A1);
 xValue1 = analogRead(A2);  
  yValue1 = analogRead(A3);
    

  // Read the logic value on pin 2  

  // We display our data separated by a comma 
  Serial.print(xValue,DEC);
  Serial.print(",");
  Serial.print(yValue,DEC);
  Serial.print(",");
 Serial.print(xValue1,DEC);
  Serial.print(",");
  Serial.print(yValue1,DEC);
  Serial.print(",");
  

  // We end with a newline character to facilitate subsequent analysis  
  Serial.print("\n");

  // Small delay before the next measurement  

delay(100);
    
}
