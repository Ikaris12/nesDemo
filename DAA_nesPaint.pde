nesButton paintScreenOpen;
Sprite[][] activeColors;
nesButton subtractColorIndex;
nesButton addColorIndex;
int colorViewCanvas_x;
int colorViewCanvas_y;
int squareSpacing;

int selectedColorIndex;
int temporaryColor;
int selectedPaletteIndex;
int substituteColor;

int cursorX;
int cursorY;
boolean colorSelected;
void paintScreen()
{
  fill_Background(0,colorViewCanvas_y-40,256,32,3,3);
  cursorX=colorViewCanvas_x+(squareSpacing*(selectedColorIndex-1));
  cursorY=colorViewCanvas_y+(squareSpacing*(selectedPaletteIndex));
  if(colorSelected==false)
  {
      viewAllColors();
  }
  else
  {
     changeColorScreen();   
  }
  
  fill_Background(colorViewCanvas_x+144,colorViewCanvas_y,16,16,selectedPaletteIndex,selectedColorIndex);
  drawText("Palette "+selectedPaletteIndex, colorViewCanvas_x,156);
  drawText("Colore "+selectedColorIndex, colorViewCanvas_x, 172);
  
  if(keySinglePress("a") && !colorSelected)
  {
    if(selectedColorIndex== 1 && selectedPaletteIndex== 1)
    {
       temporaryColor=spritePalette[2][1];
    }
    else
    {
       temporaryColor=spritePalette[1][1];
    }
    colorSelected=true;
  }
}

void init_paintScreen()
{
  fillColor=0;
  fillPalette=0;
  colorViewCanvas_x=16;
  colorViewCanvas_y=64;
  squareSpacing=16;
  selectedColorIndex=1;
  selectedPaletteIndex=0;
  colorSelected=false;
  substituteColor=0;
  temporaryColor=0;
  activeColors= new Sprite[4][4];
  for(int i=0;i<4;i++)
  {
    for(int j=0;j<4;j++)
    {
      activeColors[i][j]= new Sprite(solidSquare[j],i,1,1);
    }
  }
}

void changeColorScreen()
{
    drawText("Nuovo colore:",32,188);
    drawText(str(substituteColor),128+24, 188);
    if(selectedColorIndex== 1 && selectedPaletteIndex== 1)
    {
      spritePalette[1][2]=substituteColor;
      fill_Background(16+colorViewCanvas_x+144,colorViewCanvas_y,16,16,2,1);    
    }
    else
    {
      spritePalette[1][1]= substituteColor;
      fill_Background(16+colorViewCanvas_x+144,colorViewCanvas_y,16,16,1,1);
    }
    if(keySinglePress("LEFT") && substituteColor>0)
    {
       substituteColor--;
    }
    if(keySinglePress("RIGHT") && substituteColor<55)
    {
      substituteColor++;
    }
    if(keySinglePress("UP"))
    {
      substituteColor+=10;
      if(substituteColor>55)
      {
        substituteColor=55;
      }
    }
    if(keySinglePress("DOWN"))
    {
      substituteColor-=10;
      if(substituteColor<0)
      {
        substituteColor=0;
      }
    }
  if(keySinglePress("a"))
  {
    
    spritePalette[selectedColorIndex][selectedPaletteIndex]=substituteColor;
    colorSelected=false;
    {
      if(selectedColorIndex== 1 && selectedPaletteIndex== 1)
      {
        spritePalette[1][2]=temporaryColor;
      }
      else
      {
        spritePalette[1][1]=temporaryColor;
      }
      colorSelected=false;
    }
  }
  if(keySinglePress("s"))
    {
      if(selectedColorIndex== 1 && selectedPaletteIndex== 1)
      {
        spritePalette[1][2]=temporaryColor;
      }
      else
      {
        spritePalette[1][1]=temporaryColor;
      }
      colorSelected=false;
    }
}

void viewAllColors()
{

  for(int i=0; i<4; i++)
      {
        for(int j=1; j<4;j++)
        {
          activeColors[i][j].drawSprite(colorViewCanvas_x+(squareSpacing*(j-1)), colorViewCanvas_y+(squareSpacing*i));
        }
      }
      
      drawText("Qui puoi modificare i colori",32,32,"CENTER");
      drawSprite(cursorX,cursorY,0,checkersSquare);
      drawText(">",-8+cursorX,cursorY);
      drawText("<",8+cursorX,cursorY);
      drawText("Frecce: Muovi il cursore",16,188);
      drawText("  A: Seleziona colore/Salva",16,196);
      drawText("  S: Cancella selezione",16,204);
      if(keySinglePress("LEFT") && selectedColorIndex>1)
      {
        selectedColorIndex--;
      }
      if(keySinglePress("RIGHT") && selectedColorIndex<3)
      {
        selectedColorIndex++;
      }
      if(keySinglePress("DOWN") && selectedPaletteIndex<3)
      {
        selectedPaletteIndex++;
      }
      if(keySinglePress("UP") && selectedPaletteIndex>0)
      {
        selectedPaletteIndex--;
      }

}
