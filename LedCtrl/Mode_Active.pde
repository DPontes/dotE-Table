  void activeMode()
  {
    static int activeCycles = 200;
    uint32_t black = 0;
    prevSituation = 1;
    
    activeCycle++;
    activeSide = round(float(activeCycle)/float(activeCycles));
    
    if(activeCycle % (activeCycles / 2) == 0)
      if(activeCycle == activeCycles)
        activeCycle = newRandomActiveLEDs(0, black);
        else
          newRandomActiveLEDs(1, black);
    
    for(int j = 0; j < sizeof(initActiveLEDs) / 4; j++)
      strip.setPixelColor(initActiveLEDs[j], getColorValVectorWhite[activeCycle]);
      
    for(int j = sizeof(initActiveLEDs) / 4; j < sizeof(initActiveLEDs) / 2; j++)
    {
      if(activeCycle < (activeCycles / 2))
        strip.setPixelColor(initActiveLEDs[j], getColorValVectorWhite[activeCycle + (activeCycles / 2)]);
        else
          strip.setPixelColor(initActiveLEDs[j], getColorValVectorWhite[activeCycle - (activeCycles / 2)]);
    }

    strip.show();
    tPrev = micros();
  }
