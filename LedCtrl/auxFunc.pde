  // Create a 24 bits color value out of a 0-255 int value
  uint32_t getColor(int val)
  {
    static uint32_t newColor;
    
    for(int i = 0; i < 3; i++)
    {
      newColor <<= 8;
      newColor |= h2r.h2RGB(i, val);
    }
    return newColor;
  }
  
  uint32_t getColor(int val, float sat, float lite)
  {
    static uint32_t newColor;
    
    for(int i = 0; i < 3; i++)
    {
      newColor <<= 8;
      newColor |= h2r.h2RGB(i, val, sat, lite);
    }
    return newColor;
  }
  
  // Cleans the Array
  void clearArray()
  {
    uint32_t newColor = 0;
    for(int x = 0 ; x <= STRIP_LENGTH ; x++)
      strip.setPixelColor(x, 0);
  }
  
  void clearArray2()
  {
    uint32_t newColor = 0;
    for(int x = 0 ; x <= STRIP2_LENGTH ; x++)
      strip2.setPixelColor(x, 0);
  }
  
  void clearArrayWhite()
  {
    uint32_t newColor = 0;
    for(int x = 0 ; x <= STRIP_LENGTH ; x++)
      strip.setPixelColor(x, 255,255,255);
  }
  
//  void clearArray2()
//  {
//    static uint32_t newColor = 0;
//    for(int x = 0 ; x <= STRIP_LENGTH ; x++)
//      strip2.setPixelColor(x, newColor);
//  }
  
  // If it is an even number (0, 2, 4...) it returns 0
  // If it is an odd number (1, 3, 5...) it returns 1
  int oddOReven(int i)
  {
    if(int(i%2 == 0))
      return 0;
      else
        return 1;
  }
  
  int newRandomLEDs(int side, uint32_t color)
  { 
    
    for(int i = sizeof(initLEDs)/4 * side; i < sizeof(initLEDs)/4 * (side + 1); i++)
    {
      strip.setPixelColor(initLEDs[i], color);
      int done = 0;
      
      do{
          done = 0;
          int newLED  = random(0, STRIP_LENGTH);
          
          if(checkDots(newLED))
            continue;
            
          initLEDs[i] = newLED;

          done = 1;
      
        }while(done != 1);
    }
    
    if(side == 0)
        return 0;
        
  }
  
  int newRandomActiveLEDs(int side, uint32_t color)
  { 
    
    for(int i = sizeof(initActiveLEDs)/4 * side; i < sizeof(initActiveLEDs)/4 * (side + 1); i++)
    {
      strip.setPixelColor(initActiveLEDs[i], color);
      int done = 0;
      
      do{
          done = 0;
          int newLED  = random(0, STRIP_LENGTH);
          
          if(checkActiveDots(newLED))
            continue;
            
          initActiveLEDs[i] = newLED;
          
          done = 1;
      
        }while(done != 1);
    }
    
    if(side == 0)
        return 0;
        
  }
  
  int checkDots(int newLED)
  {
    for(int i = 0; i < sizeof(initLEDs)/2; i++)
      if(newLED == initLEDs[i])
        return 1;
    
    return 0;
  }

  int checkActiveDots(int newLED)
  {
    for(int i = 0; i < sizeof(initActiveLEDs)/2; i++)
      if(newLED == initLEDs[i])
        return 1;
    
    return 0;
  }
