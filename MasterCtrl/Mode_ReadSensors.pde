  void readSensors()
  {
    int count = 0;
    
    for(int i = 0; i < 3; i++)
      if(srf1.getDist(srfAddress[1]) < 100)
        count++;
        
      if(count == 3)
      {
        state = 1;
        
        if(state != prevState)
          sendState(1);
        
        prevState = state;
        tStateZero = millis();
      }
  }
  
  //  void readSensors()
  //  {
  //    int dist;
  //    
  //    dist = srf0.getDist(srfAddress[0]);
  //    
  //    if(dist < srf0.threshold - 10)
  //      detected(0);
  //    
  //    if(flagUp[0])
  //    {
  //      sensorAvg[0] += dist;
  //      sensorCount[0]++;
  //    }
  //    
  //    
  //    if(multiSensors == 1)
  //    {
  //      dist = srf1.getDist(srfAddress[1]);
  //      
  //      if(dist < srf1.threshold - 10)
  //        detected(1);
  //      
  //      if(flagUp[1])
  //      {
  //        sensorAvg[1] += dist;
  //        sensorCount[1]++;
  //      }
  //      
  //      dist = srf2.getDist(srfAddress[2]);
  //      
  //      if(dist < srf2.threshold - 10)
  //        detected(2);
  //      
  //      if(flagUp[2])
  //      {
  //        sensorAvg[2] += dist;
  //        sensorCount[2]++;
  //      }
  //    }
  //  }
  //  
  //  void detected(int side)
  //  {
  //    if(!flagUp[side])
  //    {
  //      flagUp[side] = 1;
  //      if(!timerFlag)
  //      {
  //        initTimer();
  //      }
  //      if(!checkFlags(side))
  //      {
  //        flagUp[side] = 2;
  //        state = 1;
  //        sensorDetected = side;
  //        int state = 10 + sensorDetected;
  //        sendState(state);
  //      }
  //    }
  //  }
  //  
  //  int checkFlags(int side)
  //  {
  //    for(int i = 0; i < 3; i++)
  //    {
  //      if(i == side - 1)
  //        continue;
  //      else
  //        if(flagUp[i] == 1)
  //          return 1;
  //    }
  //    return 0;
  //  }
