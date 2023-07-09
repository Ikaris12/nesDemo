PImage ImageToConvert;

void imageImport()
{
  selectInput("Select a file to process:", "imageSelected");
}



void imageSelected(File selection) 
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  } 
  else
  {
    String path=selection.getPath();
    if(path.endsWith(".jpg") || path.endsWith(".jpeg") || path.endsWith(".png") ||path.endsWith(".JPG") ||path.endsWith(".JPEG")||path.endsWith(".PNG"))
    {
      ImageToConvert=loadImage(selection.getAbsolutePath());
      ImageToConvert.loadPixels();
      if(ImageToConvert.pixels.length>64*64)
      {
        ImageToConvert.resize(64,64);
      }
      imageConverted=spriteTodataPreview(ImageToConvert);
    }
    else
    {
      print("Il file selezionato non è compatibile");
    }
  }
}

void viewImage()
{
  image(ImageToConvert,56,56);
}

nesButton importImage;
bigSprite imageConverted;
nesButton saveConvertedImage;

void importImageScreen()
{
  fill_Background(0,8,256,48,3,1);
  drawText("Qui puoi caricare immagini", 16, 32,((frameCount+20)%80)/40);
  drawText("E convertirle in un file!",17+int(cos(frameCount/5)*2),48+int(sin(frameCount/5)*2),(frameCount%80)/40);
  fill_Background(0,240-72,256,64,3,1);
  importImage.drawButton();
  if(imageConverted!=null)
  {
    imageConverted.draw_bigSprite(32,96);
    saveConvertedImage.drawButton();
  }
}

void init_importImageScreen()
{
  fillColor=0;
  fillPalette=0;
  importImage= new nesButton("Importa",32,64,61);
  saveConvertedImage= new nesButton("Salva",128+32,64,62);
}
