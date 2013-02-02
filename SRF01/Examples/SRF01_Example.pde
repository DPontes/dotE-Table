#include <SoftwareSerial.h>
#include <SRF01.h>

const byte srfAddress[] = {0x02, 0x03};

#define txrxPin 5

SRF01 srf1(txrxPin, 1, srfAddress[0]);
SRF01 srf2(txrxPin, 2, srfAddress[1]);

void setup()
{
  
  Serial.begin(9600);
  srf1.begin();
  srf2.begin();
  
}

void loop()
{
    if(srf1.getDist(srfAddress[0]) < srf1.threshold - 10)
    {
      Serial.print("Detected Sensor ");
      Serial.println(1);
    }
    delay(200);
    if(srf2.getDist(srfAddress[1]) < srf2.threshold - 10)
    {
      Serial.print("Detected Sensor ");
      Serial.println(2);
    }
    delay(200);
}
