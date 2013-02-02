#include "SoftwareSerial.h"
#include "WProgram.h"
#include "SRF01.h"

#define getSoft		0x5D
#define getRange	0x54
#define SeqChangeAddr1n 0xA0
#define SeqChangeAddr2n 0xAA
#define SeqChangeAddr3n 0xA5

SRF01::SRF01(int txrxPin, int nSensor, byte _srfAddress) : mySerial(SoftwareSerial(txrxPin, txrxPin))
{
	_txrxPin = txrxPin;
	_nSensor = nSensor;
	srfAddress = _srfAddress;
	mySerial.begin(9700);
}

void SRF01::begin()
{	
	getThreshold();
	Serial.print("Version of Sensor ");
	Serial.print(_nSensor);
	Serial.print(": ");
	Serial.println(getVersion(srfAddress));
}

void SRF01::getThreshold()
{
  threshold = 0;
    
  Serial.print("Getting threshold for Sensor ");
  Serial.println(_nSensor);
    
  for(int i = 0; i < 5; i++)
  {
    delay(50);
    int dist = getDist(srfAddress);
    if(dist < threshold || dist > 0)
      threshold = dist;
  }
       
  Serial.print("Thresholding for sensor ");
  Serial.print(_nSensor);
  Serial.println(" done.");

}

int SRF01::getVersion(byte srfAddress)
{
  SRF01_Cmd(srfAddress, getSoft);
  int softVer = mySerial.read(); 
  return softVer;
}

int SRF01::getDist(byte srfAddress)
  {
    SRF01_Cmd(srfAddress, getRange);
    byte highByte = mySerial.read();
    byte lowByte = mySerial.read();
    int range = ((highByte<<8)+lowByte);
    return range;
  }

void SRF01::SRF01_Cmd(byte Address, byte cmd)
  {                     
    pinMode(_txrxPin, OUTPUT);
    digitalWrite(_txrxPin, LOW);                              
    delay(2);                                               
    digitalWrite(_txrxPin, HIGH);                            
    delay(1);                                                
    mySerial.print(Address, BYTE);
    mySerial.print(cmd, BYTE);    
    pinMode(_txrxPin, INPUT);   
  }

void SRF01::changeAddress(byte srfNewAddress)
{
  SRF01_Cmd(srfAddress, SeqChangeAddr1n);
  SRF01_Cmd(srfAddress, SeqChangeAddr2n);
  SRF01_Cmd(srfAddress, SeqChangeAddr3n);
  SRF01_Cmd(srfAddress, srfNewAddress);

}