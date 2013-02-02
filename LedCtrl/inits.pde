    void initColorVector(int val)
  {
    float sat;
    float lite;
    float satW;
    float liteW;
    float satWave;
    float liteWave;
    static int cycles = 200;
    
    for(int i = 0; i < cycles / 2; i++)
      {
        sat = float(map(i, 0, cycles / 2, 0, 100))/100.0;
        lite = float(map(i, 0, cycles / 2, 0, 50))/100.0;
        getColorValVector[i] = getColor(val, sat, lite);
        
        satW = float(map(i, 0, cycles / 2, 0, 0))/100.0;
        liteW = float(map(i, 0, cycles / 2, 0, 100))/100.0;
        getColorValVectorWhite[i] = getColor(val, satW, liteW);
        
//        satWave = float(map(i, 0, cycles / 2, 0, 50))/100.0;
//        liteWave = float(map(i, 0, cycles / 2, 0, 100))/100.0;
//        getColorValVectorWave[i] = getColor(val, satWave, liteWave);
      }
      
      
      for(int i = cycles / 2; i < cycles; i++)
      {
        sat = float(map(i, cycles / 2, cycles, 100, 0))/100.0;
        lite = float(map(i, cycles / 2, cycles, 50, 0))/100.0;
        getColorValVector[i] = getColor(val, sat, lite);
        
        satW = float(map(i, cycles / 2, cycles, 0, 0))/100.0;
        liteW = float(map(i, cycles / 2, cycles, 100, 0))/100.0;
        getColorValVectorWhite[i] = getColor(val, satW, liteW);
        
//        satWave = float(map(i, cycles / 2, cycles, 50, 0))/100.0;
//        liteWave = float(map(i, cycles / 2, cycles, 100, 0))/100.0;
//        getColorValVectorWave[i] = getColor(val, satWave, liteWave);
      }
  }
  
  void createMatrixes()
  {
    int i = -1;
    
    for(int l = 0; l < NSTRIPS; l++)
    {
      for(int c = 0; c < LEDS_PER_STRIP; c++)
      {
        i++;
        matrix[c][l] = i;
      }
      
      if(oddOReven(l))
        invert(l);
    }
  }
  
  void invert(int l)
  {
    int auxM[LEDS_PER_STRIP];
    for(int i = 0; i < LEDS_PER_STRIP; i++)
      auxM[i] = matrix[LEDS_PER_STRIP - 1 - i][l];
      
    for(int i = 0; i < LEDS_PER_STRIP; i++)
      matrix[i][l] = auxM[i];
  }
