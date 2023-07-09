void spriteToData(PImage img)  //Funzione che fa tutto il lavoro di conversione
{
  int ImgW=img.width;
  int ImgH=img.height; //Mi servono h e w per sommarle e capire quanti sprite fare
  String widthToSave=hex(ImgW/8,2);
  widthToSave=hex2quat(widthToSave);
  String spriteCode=""; //Contenitore di tutti i dati
  for(int j=0; j<ImgH/8; j++)
  {
    for(int i=0; i<ImgW/8; i++)
    {
      IntDict spriteColors=colorFrequency(img,0,0); //Prende i colori frequenti in tutta l'immagine
      spriteColors.sortValuesReverse();  //Sort in ordine decrescente
      String[] colorName=spriteColors.keyArray(); //Segna i valori dei colori presenti, scartando la loro quantità, trovando i principali
      color[] buffer= pixel_extrapolator(img,i*8,j*8);//funge da cursore per lo sprite
      spriteCode+=check_mainColors(buffer, colorName);//Paragona i valori dei colori presenti con quelli nel singolo sprite
    }
  }
  dataExport(widthToSave+spriteCode);
}

/*
bigSprite spriteTodataPreview(PImage img) //VERSIONE FUNZIONANTE
{
  bigSprite result;
  int ImgW=img.width;
  int ImgH=img.height; //Mi servono h e w per sommarle e capire quanti sprite fare
  String widthToSave=hex(ImgW/8,2);
  widthToSave=hex2quat(widthToSave);
  String spriteCode=""; //Contenitore di tutti i dati
  IntDict spriteColors=colorFrequency(img,0,0);
  spriteColors.sortValuesReverse();  //Sort in ordine decrescente
  String[] colorName=spriteColors.keyArray(); //Segna i valori dei colori presenti
  for(int h=0; h<colorName.length;h++)
      {
        print(colorName[h]+"\n");
      }
  for(int j=0; j<ImgH/8; j++)
  {
    for(int i=0; i<ImgW/8; i++)
    {    
      color[] buffer= pixel_extrapolator(img,i*8,j*8);//funge da cursore per lo sprite
      spriteCode+=check_mainColors(buffer, colorName);
    }
  }
  result=new bigSprite(0,0,ImgW/8,spriteCode);
 return result;
}
*/

bigSprite spriteTodataPreview(PImage img) //VERSIONE SPERIMENTALE DA COMPLETARE
{
  bigSprite result;
  int ImgW=img.width;
  int ImgH=img.height; //Mi servono h e w per sommarle e capire quanti sprite fare
  String widthToSave=hex(ImgW/8,2);
  widthToSave=hex2quat(widthToSave);
  String spriteCode=""; //Contenitore di tutti i dati
  String[] colorName;
  IntDict spriteColors= new IntDict();
  
  for(int j=0; j<ImgH/8; j++)
  {
    for(int i=0; i<ImgW/8; i++)
    { 
      spriteColors=mergeIntDicts(spriteColors,colorFrequency(img,0,0));
      spriteColors.sortValuesReverse();  //Sort in ordine decrescente
      colorName=spriteColors.keyArray();
      color[] buffer= pixel_extrapolator(img,i*8,j*8);//funge da cursore per lo sprite
      spriteCode+=check_mainColors(buffer, colorName);
    }
  }
  result=new bigSprite(0,0,ImgW/8,spriteCode);
 return result;
}

IntDict mergeIntDicts(IntDict dict1, IntDict dict2) {
  IntDict mergedDict = new IntDict();
  
  // Aggiunge tutte le coppie chiave-valore di dict1 a mergedDict
  for (int i = 0; i < dict1.size(); i++) {
    String key = dict1.key(i);
    int value = dict1.get(key);
    mergedDict.set(key, value);
  }
  
  // Aggiunge tutte le coppie chiave-valore di dict2 a mergedDict
  for (int i = 0; i < dict2.size(); i++) {
    String key = dict2.key(i);
    int value = dict2.get(key);
    mergedDict.set(key, value);
  }
  
  return mergedDict;
}

 //FUNZIONA 8x8
color[] pixel_extrapolator(PImage a,int x,int y)  //Crea un array da 8x8 pixel con tutti i colori
{
    PGraphics buffer;  //buffer in cui caricare l'immagine 8x8
    buffer=createGraphics(8,8);
    buffer.beginDraw();
    buffer.image(a,-x,-y); //Posizione dello sprite da convertire
    buffer.loadPixels();
    buffer.endDraw();
    return buffer.pixels;
}

IntDict colorFrequency(PImage a,int x, int y)
{
  IntDict frequentColor=new IntDict();  //IntDict in cui ci saranno i valori dei colori e le quantità ricorrenti
  String colorRecurrent="";
  color[] exPixel=pixel_extrapolator(a,x,y);
  for(int i=0;i<exPixel.length;i++)
  {
      colorRecurrent=hex(exPixel[i]).substring(2,8);
      if(!frequentColor.hasKey(colorRecurrent))
      {
        frequentColor.set(colorRecurrent,0);        //Crea un nuovo elemento nell'array se non c'è
      }
      else
      {
        frequentColor.increment(colorRecurrent);   //Incrementa l'elemento preesistente
      }
  }
  return frequentColor;
}
                    //Array di colori sprite    //Array con i valori più frequenti
String check_mainColors(color[] cmp, String[] array_to_cmp)
{
  int check_array_length=4;
  if(array_to_cmp.length<check_array_length) //Se l'array da paragonare non è da 4 elementi viene ridotto il ciclo
  {
    check_array_length=array_to_cmp.length;
  }
  String[] arrayCmp={"0","0","0","0"}; //Inizializza l'array in modo che abbia dei valori di base
  for(int i=0; i<check_array_length; i++)  //Ciclo che inserisce nell'array i valori più frequenti
  {
    arrayCmp[i]=array_to_cmp[i];
  }
  String pixelColor="";
  for(int j=0;j<cmp.length;j++)
  {
    String colorCompare=hex(cmp[j]).substring(2,8);
    if(hex(cmp[j]).substring(0,2).equals("00"))
    {
      pixelColor+="0"; 
    }
    else
    {
      if(colorCompare.equals(arrayCmp[0]))
      {
        pixelColor+="1";
      }
      else if(colorCompare.equals(arrayCmp[1]))
      {
        pixelColor+="2";
      }
      else if(colorCompare.equals(arrayCmp[2]))
      {
        pixelColor+="3";
      }
      else
      {
        pixelColor+="3";
      }
    }
  }
    return pixelColor;
    
}

String colorDistance(String colorToTest)  //Calcola il colore più simile a quelli disponibili //INUTILIZZATA
{
  float colorDist=0;
  int redQ=unhex(colorToTest.substring(0,2)); //Q=quantità
  int greenQ=unhex(colorToTest.substring(2,4));
  int blueQ=unhex(colorToTest.substring(4,6));
  String colorToUse="";
  float colorTreshold =1000;
  for(int i=0;i<nesColors.length;i++)
  {
    colorDist=dist(redQ,greenQ,blueQ,unhex(nesColors[i].substring(0,2)),unhex(nesColors[i].substring(2,4)),unhex(nesColors[i].substring(4,6)));
    if(colorDist<colorTreshold)
    {
       colorToUse=nesColors[i];
       colorTreshold=colorDist;
    }
  }
  return colorToUse;
}
