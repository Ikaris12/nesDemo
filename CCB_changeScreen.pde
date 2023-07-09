void changeScreen()
{
  int a=activeScreen;
  if(a!=0)
  {
    home_btn.drawButton();
  }
  switch(a)
  {
    case 0: defaultScreen();
    break;
    case 1: loadTextScreen();
    break;
    case 2: game_pong_screen();
    break;
    case 3: viewImage();
    break;
    case 4:
    break;
    case 5: importImageScreen();
    break;
    case 7: paintScreen();
    break;
    case 8: typettiScreen();
    break;
    default: defaultScreen();
  }
}

nesText welcomeScreen;
void defaultScreen()
{
    
    fillColor=1;
    fillPalette=2;
    drawText("TinyKari", 10, 80,"CENTER");
    
    logo.draw_bigSprite();
    Load_image.drawButton();
    loadTextScreen_btn.drawButton();
    Pong.drawButton();
    paintScreenOpen.drawButton();
    typettiScreenOpen.drawButton();
}
