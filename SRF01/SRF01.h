#ifndef __SRF01_h__
#define __SRF01_h__

#include "SoftwareSerial.h"
#include "WProgram.h"

class SRF01
{

	public:
		SRF01(int txrxPin, int nSensor, byte _srfAddress);
		void begin();
		int getVersion(byte srfAddress);
		int getDist(byte srfAddress);
		void changeAddress(byte srfNewAddress);
		int threshold;
		

	private:
		void getThreshold();
		void SRF01_Cmd(byte Address, byte cmd);

		SoftwareSerial mySerial;

		int _txrxPin;
		int _nSensor;
		
		byte srfAddress;

};

#endif