  void yellowBeam()
  {
    static int pulseCycle = 0;
    static int stripLength = STRIP2_LENGTH;
    
//    clearArray2();
//    for(int led = 0; led < 3; led++)
//    {
//      strip2.setPixelColor((stripLength / 2) - (led + pulseCycle),getColorValVector[(led + 1) * 25]);
//      strip2.setPixelColor((stripLength / 2) + (led + pulseCycle),getColorValVector[(led + 1) * 25]);
//    }
//    
//    strip2.show();
    
    pulseCycle++;
    if(pulseCycle == 15)
      pulseCycle = 0;
  }
