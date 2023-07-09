String[] gameData;

void dataImport()
{
  selectInput("Select a file to process:", "fileSelected");
}

void dataExport(String data) //Esporta immagine
{
    String[] dataArray= new String[1];
    dataArray[0]=encodeFile(data);
    saveStrings("saveData/"+hour()+"_"+minute()+"_"+second()+".txt",dataArray);
}

void fileSelected(File selection) 
{
  if (selection == null) 
  {
    println("Window was closed or the user hit cancel.");
  } 
  else 
  {
    String path=selection.getPath();
    if(path.endsWith(".txt")||path.endsWith(".TXT"))
    {
      gameData=loadStrings(selection.getAbsolutePath());
      int w=unhex(gameData[0].substring(0,2));
      gameData[0]=decodeFile(gameData[0]);
      loadedTextImage=new bigSprite(48,96,w,gameData[0].substring(4,gameData[0].length()),2);
    }
    else
    {
      print("Il file selezionato non è del formato richiesto");
    }
  }
}

nesButton loadText_btn;
bigSprite loadedTextImage;
void loadTextScreen() //DA COMPLETARE
{
  fill_Background(0,32,256,64,2,3);
  drawText("Qui puoi caricare",3,48,"CENTER");
  drawText("un file di testo",48,60,"CENTER");
  loadText_btn.drawButton();
  if(loadedTextImage!=null)
  {
    loadedTextImage.draw_bigSprite();
  }
}

void init_loadTextScreen()
{
  loadText_btn= new nesButton("Carica file", 76,76,11);
}
