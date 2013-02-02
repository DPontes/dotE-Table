//void changeSensorState()
//{
//  
//  if(state == 0)
//    state = 20;
//    else
//      state = 0;
//      
//  sendState(state);
//  
//  
//  
//  Serial.println("CHANGE");
//  multiSensors = abs(multiSensors - 1);
//  
//  switch(multiSensors)
//  {
//    case 0:  digitalWrite(pinLED, LOW);
//             delay(5);
//             digitalWrite(pinLED, HIGH);
//             delay(750);
//             digitalWrite(pinLED, LOW);
//             break;
//             
//    case 1:  digitalWrite(pinLED, LOW);
//             delay(5);
//             digitalWrite(pinLED, HIGH);
//             delay(750);
//             digitalWrite(pinLED, LOW);
//             delay(750);
//             digitalWrite(pinLED, HIGH);
//             delay(750);
//             digitalWrite(pinLED, LOW);
//             break;
//             
//    default: break;
//  }
//}
