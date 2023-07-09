void button_behavior(int a)
{
  final int behavior=a;
  switch(behavior)
  {
    case -1: print("NO BUTTON BEHAVIOR");
    break;
    case 0:
    break;
    case 1: init_loadTextScreen();
            activeScreen=1;
    break;
    case 11: dataImport();
    break; 
    case 2: activeScreen=0;
    break;
    case 3: activeScreen=1;
    break;
    case 4: dataExport(gameData[0]);
    break;
    case 5: game_pong_init();
    break;
    case 6: activeScreen=5;
            init_importImageScreen();
    break;
    case 61: imageImport();
    break;
    case 62: spriteToData(ImageToConvert);
    break;
    case 7: init_paintScreen();
            activeScreen=7;
    break;
    case 8: init_Typetti();
            activeScreen=8;
    break;
    case 81:typettoGenerato=true;
            typetto=randomHex();
    break;
    case 82:saveTypetti();
    break;
    case 83:loadTypetto();
    break;
  }
}

void change_Color(String toChange)
{
  toChange=gameData[0];
  String thisWidth=toChange.substring(0,2);
  toChange=toChange.substring(2,toChange.length());
  toChange=toChange.replaceAll("1","0");
  gameData[0]=thisWidth+toChange;
}
bigSprite ccsImage;
void color_change_screen()
{
  if(ccsImage==null)
  {
    ccsImage=new bigSprite(16,32,32,gameData[0]);
  }
  drawText("Choose color to change",16,16,3);
  ccsImage.draw_bigSprite();
}
