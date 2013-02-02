//  void reactionMode(int sensor)
//  {
//    static int colEnd;
//    static int lineEnd;
//    static int colStart;
//    static int dir;
//    static int reactionCycle = 0;
//    int oOrE = oddOReven(sensor);
//    
//    if(reactionCycle == 0)
//    {
//      colEnd    = abs(oOrE - 1) * LEDS_PER_STRIP * abs(sensor - 2) / 2;
//      lineEnd   = oOrE * LEDS_PER_STRIP + abs(oOrE - 1) * NSTRIPS;
//      colStart  = oOrE * (NSTRIPS - 1)  + abs(oOrE - 1) * (sensor * (LEDS_PER_STRIP - 1)/2);
//    
//      if(sensor == 0)
//        dir = 1;
//        else
//          dir = -1;
//    }
//    
//    if(reactionCycle < abs(colStart - colEnd))
//    {
//      int col = map(reactionCycle, 0, abs(colStart - colEnd), colStart, colEnd);
//      
//      for(int line = 0; line < lineEnd; line++)
//      {
//        int c = oOrE * line + abs(oOrE - 1) * col;
//        int l = oOrE * col  + abs(oOrE - 1) * line;
//        
//        if(checkDots(matrix[c][l]))
//          continue;
//          
//        strip.setPixelColor(matrix[c][l], getColorValVectorWhite[100]);
//      }
//      
//      strip.show();
//      reactionCycle++;
//    }
//    
//    else
//    {
//      reactionCycle = 0;
//      situation = 0;
//      sensorDetected = -1;
//    }
//  }
