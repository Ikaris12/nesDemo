
//unire tutte le img in un unico file
//Color editor



int zoom=4;
String font;
String[] solidSquare;
String checkersSquare;

int fillColor;
int fillPalette;

bigSprite logo;
nesButton home_btn;
nesButton loadTextScreen_btn;
nesButton Draw;
nesButton Load_image;
nesButton Pong;
nesButton Save;
int activeScreen;  //Che schermata c'è?
void setup()
{
  size(1024,960);
  init(); //Inizializza tutto
}

void draw()
{
   controls(); //Check input
   screenRefresh(); //Pulisce lo schermo
   elementi_permanenti();   
   changeScreen();

   drawScreen(); //Disegna elementi  //(30 fps)

}

void elementi_permanenti()
{
  drawText("Ikari 2022-2023",128, 232);
   fill_Background(0,8,256,224,fillColor,fillPalette);
}
