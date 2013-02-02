  void fade(int dir)
  {
    int fadeCycles = 100;
    uint32_t black = 0;
    
    if(dir == 1)
    {
      for(int i = 0; i < sizeof(initLEDs)/2; i++)
        initActiveLEDs[i + 50] = initLEDs[i];
        
      newRandomActiveLEDs(0,black);
      
      for(int i = 0; i < fadeCycles; i++)
      {
        for(int j = 0; j < sizeof(initLEDs) / 2; j++)
          strip.setPixelColor(initLEDs[j], getColorValVector[fadeCycles - i]);
          
        strip.show();
        delayMicroseconds(400);
      }
      
      clearArray();
      
      for(int i = 0; i < fadeCycles; i++)
      {
        for(int j = sizeof(initActiveLEDs) / 4; j < sizeof(initActiveLEDs) / 2; j++)
          strip.setPixelColor(initActiveLEDs[j], getColorValVectorWhite[i]);
          
        strip.show();
        delayMicroseconds(500);
      }
      
      situation = 1;
      activeCycle = 0;
    }
    
    else if(dir == -1)
    {
      for(int i = 0; i < sizeof(initLEDs)/2; i++)
        initLEDs[i] = initActiveLEDs[i];
        
      newRandomLEDs(1,black);
      
      for(int i = 0; i < fadeCycles; i++)
      {
        for(int j = 0; j < sizeof(initActiveLEDs) / 2; j++)
          strip.setPixelColor(initActiveLEDs[j], getColorValVectorWhite[fadeCycles - i]);
          
        strip.show();
        delayMicroseconds(400);
      }
      
      clearArray();
      
      for(int i = 0; i < fadeCycles; i++)
      {
        for(int j = sizeof(initLEDs) / 4; j < sizeof(initLEDs) / 2; j++)
          strip.setPixelColor(initLEDs[j], getColorValVector[i]);
          
        strip.show();
        delayMicroseconds(500);
      }
      
      situation = 0;
      screenSaverCycle = 0;
    }
    
  }
