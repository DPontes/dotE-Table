  #include "SoftwareSerial.h"
  #include "SRF01.h"
  #include "Time.h"
  #include "Wire.h"
  #include "SPI.h"
  
  #define txrxPin 2
  #define buttonSensorState 3
  #define pinLED 4
  #define timeToDetect 50
  #define timeForStateZero 30000
  
  //int sensorCount[3];
  //int sensorDetected;
  //int flagUp[3];
  //int timerFlag = 0;
  int state = 0;
  int prevState = 0;
  //int multiSensors = 1;
  //uint32_t sensorAvg[3];
  time_t tPrev;
  time_t tStateZero;
  
  const byte srfAddress[] = {0x01, 0x02, 0x03};
  
  //SRF01 srf0(txrxPin, 0, srfAddress[0]);
  SRF01 srf1(txrxPin, 1, srfAddress[1]);
  //SRF01 srf2(txrxPin, 2, srfAddress[2]);
  
  void setup()
  {
    Serial.begin(9700);
    Serial.begin(9600);
    Wire.begin();
 
    initSensors();
 
    tPrev = millis();
    tStateZero = millis();
  }
  
  void loop()
  {
     if((millis() - tPrev) > timeToDetect)
     {
       readSensors();
       tPrev = millis();
     }
     
     if((millis() - tStateZero) > timeForStateZero)
     {
       //Serial.println("State 0");
       state = 0;
       
       if(state != prevState)
         sendState(0);
         
       prevState = state;
     }
  }
