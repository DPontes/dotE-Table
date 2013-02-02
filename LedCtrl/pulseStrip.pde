  void pulseStrip()
  {
    for(int i = 0; i < 20; i++)
    {
      for(int j = 0; j < 2; j++)
      {
        strip2.setPixelColor(20 - j - i, getColorValVectorWhite[100]);
        strip2.setPixelColor(32 + j + i, getColorValVectorWhite[100]);
      }
      strip2.show();
      delayMicroseconds(5000);
      clearArray2();
    }
    tPrevPulse = millis();
    clearArray2();
    strip2.show();
  }
