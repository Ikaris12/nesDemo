nPixel[][] allPixels;
String Pixels;
public class nPixel
{
   int nColorIndex;
   int xPos;
   int yPos;
   
   public nPixel(int nColorIndex, int xPos,int yPos)
   { 
     this.nColorIndex=nColorIndex;
     this.xPos=xPos;
     this.yPos=yPos;
   }
   void drawPixel()
   {
      check_colorIndex();
      push();
      nesFill(nesColors[nColorIndex]);
      rect(xPos,yPos,zoom,zoom);
      pop();
   }
   void check_colorIndex()  //Evita errori di inserimento colore
   {
      if(nColorIndex<0)
        nColorIndex=0;
      if(nColorIndex>53)
        nColorIndex=53;
   }
}

void initPixels()
{
  allPixels = new nPixel[256][240];
  for(int i=0; i<256; i++)
  {
     for(int j=0; j<240; j++)
     {
        allPixels[i][j]=new nPixel(bg_backgroundColor, i*zoom,j*zoom);
     }
  }
}

void drawScreen()  //Disegna TUTTI i pixel
{
  for(int i=0;i<256;i++)
  {
     for(int j=0; j<240; j++)
     { 
       //Ottimizzare
       allPixels[i][j].drawPixel();
     }
  } 
}

void nesFill(String colorToFill) //Converte una stringa da 6 caratteri in tre colori
{
    fill(unhex(colorToFill.substring(0,2)),unhex(colorToFill.substring(2,4)),unhex(colorToFill.substring(4,6)));
}

void screenRefresh()
{
    for(int i=0;i<256;i++)
  {
     for(int j=0; j<240; j++)
     { 
       
       allPixels[i][j].nColorIndex=spritePalette[0][0];
     }
  } 
}
