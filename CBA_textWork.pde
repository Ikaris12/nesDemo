void char_to_text(char a,int x, int y)
{
  Sprite text=new Sprite(get_textSprite(a),0,x,y);
  text.drawSprite();
}

void char_to_text(char a,int x, int y, int palette)
{
  Sprite text=new Sprite(get_textSprite(a),palette,x,y);
  text.drawSprite();
}

String get_textSprite(char a)
{
  int pointer=char(a)-33;      //-48+16; //Lettere minuscole
  

  if(pointer>=0 && pointer<=126-33)
  {
    if(pointer>95-33)
    {
      pointer++;
    }
  }
  else
  {
    pointer=63;
  }
  //Convertire testo in lettere e mettere eccezioni
  return font.substring(64*pointer,(64*pointer)+64);
}
