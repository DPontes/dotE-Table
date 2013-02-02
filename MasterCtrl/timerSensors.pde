//  void timerSensors()
//  {
//    timerFlag = 0;
//    
//    if(state == 0)
//    {
//      for(int i = 0; i < 3; i++)
//      {
//        float avg = sensorAvg[i] / sensorCount[i];
//        
//        if(flagUp[i] == 2 && ( avg < srf0.threshold / 2))
//        {
//          state = 3;
//          sendState(30);
//        }
//    
//        flagUp[i] = 0;
//        sensorAvg[i] = 0;
//        sensorCount[i] = 0;
//        initTimer();
//      }
//    }
//    
//    else if(state == 3)
//    {
//      sendState(31);
//    }
//  }

