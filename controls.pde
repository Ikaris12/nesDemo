int[] mouseButtons;
int[] keyboardButtons;
void init_controls()
{
  mouseButtons=new int[]{0,0,0};
  keyboardButtons=new int[]{0,0,0,0,0,0,0,0};
                          //W,A,S,D,^,v,<,>
}

void controls()
{
  if(mousePressed)
  {
    mouseButtons[0]++;
  }
  else
  {
    mouseButtons[0]=0;
  }
}

void keyPressed()
{
  key=str(key).toLowerCase().charAt(0);
  if(key=='w')
    {
      keyboardButtons[0]++;
    }
    if(key=='a')
    {
      keyboardButtons[1]++;
    }
    if(key=='s')
    {
      keyboardButtons[2]++;
    }
    if(key=='d')
    {
      keyboardButtons[3]++;
    }
    if(keyCode==UP)
    {
      keyboardButtons[4]++;
    }
    if(keyCode==DOWN)
    {
      keyboardButtons[5]++;
    }
    if(keyCode==LEFT)
    {
      keyboardButtons[6]++;
    }
    if(keyCode==RIGHT)
    {
      keyboardButtons[7]++;
    }
}

void keyReleased()
{
  if(key=='w')
    {
      keyboardButtons[0]=0;
    }
    if(key=='a')

    {
      keyboardButtons[1]=0;
    }
    if(key=='s')
    {
      keyboardButtons[2]=0;
    }
    if(key=='d')
    {
      keyboardButtons[3]=0;
    }
    if(keyCode==UP)
    {
      keyboardButtons[4]=0;
    }  
    if(keyCode==DOWN)
    {
      keyboardButtons[5]=0;
    }  
    if(keyCode==LEFT)
    {
      keyboardButtons[6]=0;
    }
    if(keyCode==RIGHT)
    {
      keyboardButtons[7]=0;
    }  
}

boolean keyHold(String whatKey)
{
    boolean isPressed=false;
    switch(whatKey)
    {
      case "w": if(keyboardButtons[0]>0)
                isPressed=true;
      break;
      case "a": if(keyboardButtons[1]>0)
                isPressed=true;
      break;
      case "s": if(keyboardButtons[2]>0)
                isPressed=true;
      break;
      case "d": if(keyboardButtons[3]>0)
                isPressed=true;
      break;
      case "UP": if(keyboardButtons[4]>0)
                isPressed=true;
      break;
      case "DOWN": if(keyboardButtons[5]>0)
                isPressed=true;
      break;
      case "LEFT": if(keyboardButtons[6]>0)
                isPressed=true;
      break;
      case "RIGHT": if(keyboardButtons[7]>0)
                isPressed=true;
      break;
      default: isPressed=false;
    }
    return isPressed;
}

boolean keySinglePress(String whatKey)
{
    boolean isPressed=false;
    switch(whatKey)
    {
      case "w": if(keyboardButtons[0]==1)
                {
                  isPressed=true;
                  keyboardButtons[0]++;
                }
      break;
      case "a": if(keyboardButtons[1]==1)
                {
                  isPressed=true;
                  keyboardButtons[1]++;
                }
      break;
      case "s": if(keyboardButtons[2]==1)
                {
                  isPressed=true;
                  keyboardButtons[2]++;
                }
      break;
      case "d": if(keyboardButtons[3]==1)
                {
                  isPressed=true;
                  keyboardButtons[3]++;
                }
      break;
      case "UP": if(keyboardButtons[4]==1)
                {
                  isPressed=true;
                  keyboardButtons[4]++;
                }
      break;
      case "DOWN": if(keyboardButtons[5]==1)
                {
                  isPressed=true;
                  keyboardButtons[5]++;
                }
      break;
      case "LEFT": if(keyboardButtons[6]==1)
                {
                  isPressed=true;
                  keyboardButtons[6]++;
                }
      break;
      case "RIGHT": if(keyboardButtons[7]==1)
                {
                  isPressed=true;
                  keyboardButtons[7]++;
                }
      break;
      default: isPressed=false;
    }
    return isPressed;
}
