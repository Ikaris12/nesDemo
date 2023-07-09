class nesText
{
  int x;
  int y;
  int palette=0;
  String textToWrite;
  public nesText(String textToWrite,int x,int y,int palette)
  {
    this.x=x;
    this.y=y;
    this.palette=palette;
    this.textToWrite=textToWrite;
  }
    public nesText(String textToWrite,int x,int y)
  {
    this.x=x;
    this.y=y;
    this.textToWrite=textToWrite;
  }
  void drawString()
  {
    drawText(textToWrite,x,y,palette);
  }
}

void drawText(String textToWrite,int x,int y)
  {
    for(int i=0; i<textToWrite.length();i++)
    {
      char_to_text(textToWrite.charAt(i),x+(i*8),y);
    }
  }
  
void drawText(String textToWrite,int x,int y, int palette)
  {
    for(int i=0; i<textToWrite.length();i++)
    {
      char_to_text(textToWrite.charAt(i),x+(i*8),y,palette);
    }
  }

void drawText(String textToWrite, int x, int y, String alignment)
{
  if(alignment.equals("REVERSE"))
  {
    for(int i=0; i<textToWrite.length();i++)
    {
      char_to_text(textToWrite.charAt(i),128-(x+(i*8)-(textToWrite.length()*4)),y);
    }
  }
  else if(alignment.equals("CENTER"))
  {
    x=128-textToWrite.length()*4;
    for(int i=0; i<textToWrite.length();i++)
    {
      char_to_text(textToWrite.charAt(i),x+(i*8),y);
    }
  }
  
}
