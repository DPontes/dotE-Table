  void screenSaverMode()
  {
    static int screenSaverCycles = 200;
    uint32_t black = 0;
    prevSituation = 0;
    
    screenSaverCycle++;
    
    if(screenSaverCycle % (screenSaverCycles / 2) == 0)
      if(screenSaverCycle == screenSaverCycles)
        screenSaverCycle = newRandomLEDs(0, black);
        else
          newRandomLEDs(1, black);
    
    for(int j = 0; j < sizeof(initLEDs) / 4; j++)
      strip.setPixelColor(initLEDs[j], getColorValVector[screenSaverCycle]);
      
    for(int j = sizeof(initLEDs) / 4; j < sizeof(initLEDs) / 2; j++)
    {
      if(screenSaverCycle < (screenSaverCycles / 2))
        strip.setPixelColor(initLEDs[j], getColorValVector[screenSaverCycle + (screenSaverCycles / 2)]);
        else
          strip.setPixelColor(initLEDs[j], getColorValVector[screenSaverCycle - (screenSaverCycles / 2)]);
    }

    strip.show();
    tPrev = micros();
  }
