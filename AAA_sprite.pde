class Sprite
{
   int palette;
   String spritePixels;
   int xPos;
   int yPos;
   int colorOffset;
   public Sprite(String spritePixels, int palette, int xPos, int yPos) //Fare altre funzioni con parametri diversi, anche senza xy
   {
       this.spritePixels=spritePixels;
       this.palette=palette;
       this.xPos=xPos;
       this.yPos=yPos;
       if(palette<0)
         this.palette=0;
       if(palette>3)
         this.palette=3;
       colorOffset=0;
   }
   void drawSprite() //Disegna tramite matrice, la palette è già scelta ma i colori sono nella matrice. "-48" per convertire da Ascii a numeri veri
   {
       for(int i=0; i<64;i++)
       {
           int newX=(i%8+xPos);
           int newY=((i/8)+yPos);
           if(!(newX>=256 || newY>=240))
           {
              if(spritePixels.charAt(i)!='0') //Trasparenza con 0
              {
                allPixels[newX][newY].nColorIndex=spritePalette[(colorOffset+(int(spritePixels.charAt(i))-48))%4][palette];
              }
           }
       }
   }
   void drawSprite(int colorOffset) //Disegna tramite matrice, la palette è già scelta ma i colori sono nella matrice. "-48" per convertire da Ascii a numeri veri
   {
       for(int i=0; i<64;i++)
       {
           int newX=(i%8+xPos);
           int newY=((i/8)+yPos);
           if(!(newX>=256 || newY>=240))
           {
              if(spritePixels.charAt(i)!='0') //Trasparenza con 0
              {
                allPixels[newX][newY].nColorIndex=spritePalette[(colorOffset+(int(spritePixels.charAt(i))-48))%4][palette];
              }
           }
       }
   }
   
   void drawSprite(int xPos,int yPos) //Disegna tramite matrice, la palette è già scelta ma i colori sono nella matrice. "-48" per convertire da Ascii a numeri veri
   {
       for(int i=0; i<64;i++)
       {
           int newX=(i%8+xPos);
           int newY=((i/8)+yPos);
           if(!(newX>=256 || newY>=240))
           {
              if(spritePixels.charAt(i)!='0') //Trasparenza con 0
              {
                allPixels[newX][newY].nColorIndex=spritePalette[(int(spritePixels.charAt(i))-48)][palette];
              }
           }
       }
   }
}

void drawSprite(int x, int y, int palette, String data)
{
  for(int i=0; i<64;i++)
       {
           int newX=(i%8+x);
           int newY=((i/8)+y);
           if(!(newX>=256 || newY>=240))
           {
              if(data.charAt(i)!='0') //Trasparenza con 0
              {
                allPixels[newX][newY].nColorIndex=spritePalette[int(data.charAt(i))-48][palette];
              }
           }
       }
}


class bigSprite
{
  int x;
  int y;
  int w;
  int h;
  int palette=0;
  int colorOffset=0;
  String sprites;
  
  public bigSprite(int x,int y,int w,int h,String sprites)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.sprites=sprites;
  }
  public bigSprite()
  {
    this.x=0;
    this.y=0;
    this.w=0;
    this.h=0;
    this.sprites="";
  }
  public bigSprite(int w,String sprites)
  {
    this.x=0;
    this.y=0;
    this.w=w;
    this.h=sprites.length()/(64*w);
    this.sprites=sprites;
  }
  public bigSprite(int x,int y,int w,String sprites)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=sprites.length()/(64*w);
    this.sprites=sprites;
  }
    public bigSprite(int x,int y,int w,String sprites, int palette)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=sprites.length()/(64*w);
    this.sprites=sprites;
    this.palette=palette;
  }
    public bigSprite(int x,int y,int w,String sprites, int palette, int colorOffset)
    {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=sprites.length()/(64*w);
    this.sprites=sprites;
    this.palette=palette;
    this.colorOffset=colorOffset;
    }
    
      public bigSprite(int x,int y,int w,int h, String sprites, int palette)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.sprites=sprites;
    this.palette=palette;
  }
  void draw_bigSprite() //supponiamo di avere già i dati string
  {
      for(int i=0;i<h;i++)
      {
        for(int j=0; j<w; j++)
        {
          int spriteStart=(j+(i*w))*64;
          int spriteEnd=((j+(i*w))*64)+64;
          int xR=j*8; //X e Y Relative
          int yR=i*8;
          if(spriteEnd>sprites.length())
          {
            break;
          }
          String spritePiece=sprites.substring(spriteStart,spriteEnd);
          Sprite a=new Sprite(spritePiece,palette,x+xR,y+yR);
          a.drawSprite();
        }
      }
  }
  
  void draw_bigSprite(int x, int y) //supponiamo di avere già 00001010101010 tra i dati string
  {
      for(int i=0;i<h;i++)
      {
        for(int j=0; j<w; j++)
        {
          int spriteStart=(j+(i*w))*64;
          int spriteEnd=((j+(i*w))*64)+64;
          int xR=j*8; //X e Y Relative
          int yR=i*8;
          if(spriteEnd>sprites.length())
          {
            break;
          }
          String spritePiece=sprites.substring(spriteStart,spriteEnd);
          Sprite a=new Sprite(spritePiece,palette,x+xR,y+yR);
          a.drawSprite();
        }
      }
  }
  void draw_bigSprite(int x, int y, int palette) //Con palette
  {
      for(int i=0;i<h;i++)
      {
        for(int j=0; j<w; j++)
        {
          int spriteStart=(j+(i*w))*64;
          int spriteEnd=((j+(i*w))*64)+64;
          int xR=j*8; //X e Y Relative
          int yR=i*8;
          if(spriteEnd>sprites.length())
          {
            break;
          }
          String spritePiece=sprites.substring(spriteStart,spriteEnd);
          Sprite a=new Sprite(spritePiece,palette,x+xR,y+yR);
          a.drawSprite();
        }
      }
  }
  void draw_bigSprite(int x, int y, int palette, int colorOffset) //Con palette
  {
      for(int i=0;i<h;i++)
      {
        for(int j=0; j<w; j++)
        {
          int spriteStart=(j+(i*w))*64;
          int spriteEnd=((j+(i*w))*64)+64;
          int xR=j*8; //X e Y Relative
          int yR=i*8;
          if(spriteEnd>sprites.length())
          {
            break;
          }
          String spritePiece=sprites.substring(spriteStart,spriteEnd);
          Sprite a=new Sprite(spritePiece,palette,x+xR,y+yR);
          a.drawSprite(colorOffset);
        }
      }
  }
}
void drawImported() //Il valore max orizzontale è 32, e verticale 30 || 8 pixel di distanza * zoom (4)
{
  if(gameData!=null)
  {
    int w=quat2dec(gameData[0].substring(0,4));
    bigSprite bSprite=new bigSprite(16,16,w,gameData[0].substring(4,gameData[0].length()));
    bSprite.draw_bigSprite();
  }
}

class backgroundTile
{
  int x;
  int y;
  int w=8;
  int h=8;
  int palette;
  String colorData=solidSquare[1];
  public backgroundTile(int x, int y, int palette)
  {
    this.x=x;
    this.y=y;
    this.palette=palette;
  }
  public backgroundTile(int x, int y, int palette, String colorData)
  {
    this.x=x;
    this.y=y;
    this.palette=palette;
    this.colorData=colorData;
  }
  void drawBackground()
  {
      for(int i=0; i<h;i++)
      {
        for(int j=0; j<w; j++)
        {
          int spriteStart=(j+(i*w))*64;
          int spriteEnd=((j+(i*w))*64)+64;
          int xR=j*8; //X e Y Relative
          int yR=i*8;
          if(spriteEnd>colorData.length())
          {
            break;
          }
          String spritePiece=colorData.substring(spriteStart,spriteEnd);
          Sprite a=new Sprite(spritePiece,palette,x+xR,y+yR);
          a.drawSprite();
        }
      }
    }
   void drawBackground(int x, int y)
   {  
      for(int i=0; i<h;i++)
      {
        for(int j=0; j<w; j++)
        {
          int spriteStart=(j+(i*w))*64;
          int spriteEnd=((j+(i*w))*64)+64;
          int xR=j*8; //X e Y Relative
          int yR=i*8;
          if(spriteEnd>colorData.length())
          {
            break;
          }
          String spritePiece=colorData.substring(spriteStart,spriteEnd);
          Sprite a=new Sprite(spritePiece,palette,x+xR,y+yR);
          a.drawSprite();
        }
      }     
   }
}

void fill_Background(int x, int y, int w, int h, int palette, int colorData)
{
  backgroundTile fill=new backgroundTile(x,y,palette, solidSquare[colorData%4]);
  for(int i=0; i<w/8; i++)
  {
    for(int j=0; j<h/8;j++)
    {
      fill.drawBackground(x+(i*8),y+(j*8)); 
    }  
  }
}
