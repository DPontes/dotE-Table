#include <SoftwareSerial.h>
#include <SRF01.h>

#define txrxPin 5

const byte srfAddress = 0x01;
const byte srfNewAddress = 0x03;

SRF01 srf(txrxPin, 1, srfAddress);

void setup()
{
  Serial.begin(9600);
  srf.begin();
  Serial.println("Address Change Mode");
  srf.changeAddress(srfNewAddress);
  Serial.println("Done!");
}

void loop()
{



}
