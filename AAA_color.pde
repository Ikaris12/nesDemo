String[] nesColors;
int[][] spritePalette;
int[][] backgroundPalette;
int sprite_backgroundColor;
int bg_backgroundColor;

void init_colors()
{
    nesColors= new String[]
   {
      //0 0-3
      "545454",
      "989698",
      "eceeec",
      "eceeec",
      //1 4-7
      "001e74",
      "084cc4",
      "4c9aec",
      "a8ccec",
      //2 8-11
      "081090",
      "3032ec",
      "787cec",
      "bcbcec",
      //3 12-15
      "300088",
      "5c1ee4",
      "b062ec",
      "d4b2ec",
      //4 16-19
      "440064",
      "8814b0",
      "e454ec",
      "ecaeec",
      //5 20-23
      "5c0030",
      "a01464",
      "ec58b4",
      "ecaed4",
      //6 24-27
      "540400",
      "982220",
      "ec6a64",
      "ecb4b0",
      //7 28-31
      "3c1800",
      "783c00",
      "d48820",
      "e4c490",
      //8 32-35
      "202a00",
      "545a00",
      "a0aa00",
      "ccd278",
      //9 36-39
      "083a00",
      "287200",
      "74c400",
      "b4de78",
      //A 40-43
      "004000",
      "087c00",
      "4cd020",
      "a8e290",
      //B 44-47
      "003c00",
      "007628",
      "38cc6c",
      "98e2b4",
      //C 48-51
      "00323c",
      "006678",
      "38b4cc",
      "a0d6e4",
      //D-E 52-55
      "000000",
      "000000",
      "3c3c3c",
      "a0a2a0",
   };
}

void initPalette() //Inizializza le palette
{
    sprite_backgroundColor=52;
    spritePalette= new int[4][4];
    backgroundPalette= new int[4][4];
    bg_backgroundColor=52;
    //Colore di sfondo condiviso (tasparente)
    for(int i=0; i<4;i++)
    {
       spritePalette[0][i]=sprite_backgroundColor; 
    }
    //Sprite Palette 1
    spritePalette[1][0]=0;
    spritePalette[2][0]=2;
    spritePalette[3][0]=1;
    //Sprite Palette 2
    spritePalette[1][1]=8;
    spritePalette[2][1]=49;
    spritePalette[3][1]=15;
    //Sprite Palette 3
    spritePalette[1][2]=0;
    spritePalette[2][2]=6;
    spritePalette[3][2]=38;
    //Sprite Palette 4
    spritePalette[1][3]=25;
    spritePalette[2][3]=30;
    spritePalette[3][3]=48;
    //Background condiviso
    for(int i=0;i<4;i++)
    {
       backgroundPalette[0][i]=bg_backgroundColor;
    }
    backgroundPalette[1][0]=10;
    backgroundPalette[2][0]=11;
    backgroundPalette[3][0]=12;
    
    backgroundPalette[1][1]=13;
    backgroundPalette[2][1]=14;
    backgroundPalette[3][1]=15;
    
    backgroundPalette[1][2]=16;
    backgroundPalette[2][2]=17;
    backgroundPalette[3][2]=18;
    
    backgroundPalette[1][3]=19;
    backgroundPalette[2][3]=20;
    backgroundPalette[3][3]=21;
}

void editPalette(int palette, int[] colors)
{
  for(int i=0; i<4; i++)
  {
    spritePalette[i][palette]=colors[i];
  }
}
