class nesButton
{
  int x;
  int y;
  int palette;
  String text;
  int behavior=-1;
  String bgData="";
  public nesButton(String text, int x,int y,int behavior)
  {
     this.text=text;
     this.x=x;
     this.y=y;
     this.palette=1;
     this.behavior=behavior;
     for(int i=0;i<text.length();i++)
     {
       bgData+=solidSquare[1];
     }
  }
  public nesButton(String text, int x,int y)
  {
     this.text=text;
     this.x=x;
     this.y=y;
     this.palette=1;
     for(int i=0;i<text.length();i++)
     {
       bgData+=solidSquare[1];
     }
  }
  void drawButton()
  {

    bigSprite bg=new bigSprite(x,y,text.length(),bgData,palette);
    bg.draw_bigSprite();
    drawText(text,x,y,palette);
    button_click();
  }
  void button_click()
  {
    int buttonW=text.length()*8*zoom;
    int buttonH=8*zoom;
    if(mouseX>x*zoom && mouseX<(x*zoom)+buttonW && mouseY<buttonH+(y*zoom) && mouseY>y*zoom)
    {
      palette=1;
      if(mouseButtons[0]==1)
        button_behavior(this.behavior);
    }
    else
    {
      palette=0;
    }
  }
}



class dropDown
{
  int x;
  int y;
  int w;
  int h;
  nesButton[] buttons;
  int palette=0;
  boolean open=false;
  public dropDown(int x, int y, nesButton[] buttons)
  {
    this.x=x;
    this.y=y;
    this.buttons=buttons;
    this.w=buttons[0].text.length();
    for(int i=1; i<buttons.length;i++)
    {
      buttons[i].x=x;
      buttons[i].y=y+(i*8);
    }
  }
  void draw_dropDown()
  {
    buttons[0].drawButton();
    if(open)
    {
      for(int i=1; i<buttons.length;i++)
      {
        buttons[i].drawButton();
      }
    }
    open_dropDown();
  }
  void open_dropDown()
  {
    int buttonW=buttons[0].text.length()*8*zoom;
    int buttonH=8*zoom;
    if(mouseX>x*zoom && mouseX<(x*zoom)+buttonW && mouseY<buttonH && mouseY>y)
    {
      palette=1;
      if(mouseButtons[0]==1)
        open=!open;
    }
    else
    {
      if(mouseButtons[0]==1)
        open=false;
    }
  }
}
