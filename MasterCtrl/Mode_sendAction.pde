void sendState(int state)
{
  Wire.beginTransmission(4); // transmit to device #4
  Wire.send(state);              // sends one byte
  Wire.endTransmission();    // stop transmitting
}
