  #include "Hue2RGB.h"
  #include "WS2801.h"
  #include "Wire.h"
  #include "Time.h"
  #include "SPI.h"
  
  #define NSTRIPS        12
  #define LEDS_PER_STRIP 14
  
  #define STRIP_LENGTH NSTRIPS * LEDS_PER_STRIP
  #define STRIP2_LENGTH  52
  
  int initLEDs[50];
  int initActiveLEDs[100];
  int matrix[LEDS_PER_STRIP][NSTRIPS];
  
  uint32_t getColorValVector[200];
  uint32_t getColorValVectorWhite[200];
  
  time_t tPrev;
  time_t tPrevPulse;
  long delayMatrixTime = 1000;    // in microseconds
  long delayPulseTime = 30000;    // in milliseconds
  int sensorDetected;
  int situation = 0;
  int prevSituation = 0;
  int dir;
  int screenSaverSide;
  int activeSide;
  int screenSaverCycle = 0;
  int activeCycle = 0;
  
  const int dataPin = 2;  //Red Wire (not the red 5V wire!)
  const int clockPin = 3; //Green Wire
  const int dataPin2 = 4;
  const int clockPin2 = 5;
  const int frontLEDS = 6;
  const int backLEDS = 7;
  
  const int hueColor = 39;
  
  WS2801 strip = WS2801(STRIP_LENGTH, dataPin, clockPin);
  WS2801 strip2 = WS2801(STRIP2_LENGTH, dataPin2, clockPin2);
  Hue2RGB h2r;
  
  void setup()
  {
    Serial.begin(9600);
    
    Wire.begin(4);
    Wire.onReceive(receiveEvent);  // register event
    
    initColorVector(hueColor);
    createMatrixes();
    
    strip.begin();
    strip2.begin();
    
    strip.show();
    strip2.show();
  
    tPrev = micros();
    tPrevPulse = millis();
  }
  
  void loop()
  {
  
    if(micros() - tPrev > delayMatrixTime)
    {
      switch(situation)
      {
        case 0:  
          screenSaverMode();
          break;
  
        case 1:  
          activeMode();
          break;
          
        case 2:
          fade(dir);
          break;
  
        default:  
          break;
      }
    }
    
    if(millis() - tPrevPulse > delayPulseTime)
    {
      pulseStrip();
    }
  }
  
  void receiveEvent(int howMany)
  {
    int state = Wire.receive();    // receive byte as an int
    int prevState = prevSituation;
    
    if(state != prevState)
    {
      dir = state - prevState;
      situation = 2;
    }
  } 

