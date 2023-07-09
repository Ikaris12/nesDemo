nesButton typettiScreenOpen;
nesButton generaTypetti;
nesButton saveTypetto;
nesButton loadTypetto;
boolean typettoGenerato;
String typetto;

int partX;
int partY;
int[] typettoColors;
int[] typettoPalette;

bigSprite[] typetti_body;
bigSprite[] typetti_arms;
bigSprite[] typetti_legs;
bigSprite[] typetti_face;
bigSprite[] typetti_detail;
int torso;
int face;
int arms;
int legs;
int details;
void init_Typetti()
{
  if(typetti_body==null)
  {
    partX=48;
    partY=80;
    typettoColors=new int[5];
    typettoPalette=new int[5];
    generaTypetti=new nesButton("Genera un Typetto",32,56,81);
    saveTypetto=new nesButton("Salva il Typetto generato",32,156,82);
    loadTypetto=new nesButton("Carica un Typetto salvato",32,140,83);
    
    typetti_body=new bigSprite[4];
    typetti_body[0]=decodeBigSprite(loadStrings("textData/typetti/cano.txt")[0]);
    typetti_body[1]=decodeBigSprite(loadStrings("textData/typetti/slimo.txt")[0]);
    typetti_body[2]=decodeBigSprite(loadStrings("textData/typetti/draco.txt")[0]);
    typetti_body[3]=decodeBigSprite(loadStrings("textData/typetti/pesci.txt")[0]);
    
    typetti_arms=new bigSprite[4];
    typetti_arms[0]=new bigSprite();
    typetti_arms[1]=decodeBigSprite(loadStrings("textData/typetti/sup_trivelle.txt")[0]);
    typetti_arms[2]=decodeBigSprite(loadStrings("textData/typetti/sup_trex.txt")[0]);
    typetti_arms[3]=decodeBigSprite(loadStrings("textData/typetti/sup_tentacoli.txt")[0]);
    
    typetti_legs=new bigSprite[4];
    typetti_legs[0]=decodeBigSprite(loadStrings("textData/typetti/inf_coda.txt")[0]);
    typetti_legs[1]=decodeBigSprite(loadStrings("textData/typetti/inf_gambe.txt")[0]);
    typetti_legs[2]=decodeBigSprite(loadStrings("textData/typetti/inf_particelle.txt")[0]);
    typetti_legs[3]=decodeBigSprite(loadStrings("textData/typetti/inf_tentacoli.txt")[0]);
    
    typetti_face=new bigSprite[4];
    typetti_face[0]=decodeBigSprite(loadStrings("textData/typetti/exp_angry.txt")[0]);
    typetti_face[1]=decodeBigSprite(loadStrings("textData/typetti/exp_sad.txt")[0]);
    typetti_face[2]=decodeBigSprite(loadStrings("textData/typetti/exp_cute.txt")[0]);
    typetti_face[3]=decodeBigSprite(loadStrings("textData/typetti/exp_monster.txt")[0]);
    
    typetti_detail=new bigSprite[4];
    typetti_detail[0]=decodeBigSprite(loadStrings("textData/typetti/det_crown.txt")[0]);
    typetti_detail[1]=decodeBigSprite(loadStrings("textData/typetti/det_hair.txt")[0]);
    typetti_detail[2]=decodeBigSprite(loadStrings("textData/typetti/det_horns.txt")[0]);
    typetti_detail[3]=decodeBigSprite(loadStrings("textData/typetti/det_scar.txt")[0]);
  }
  typettoGenerato=false;
  typetto=randomHex();
}

void typettiScreen()
{
  drawText("Qui puoi generare dei Typetti",32,32,"CENTER");
  saveTypetto.drawButton();
  generaTypetti.drawButton();
  loadTypetto.drawButton();
  if(typettoGenerato)
  {
    fill_Background(32,64,48,48,0,1);
    generate_typetti(typetto);
    drawTypetto();
  }
  
}

void generate_typetti(String input)
{
  //In una stringa i primi 3 valori sono le sagome e features, il resto sono colori
  face=int(hex2quat(str(input.charAt(0))))%10; //F Diventa 33 e prende il primo 3
  torso=int(hex2quat(str(input.charAt(0))))/10;  //Qui prende il secondo
  arms=int(hex2quat(str(input.charAt(1))))%10;
  legs=int(hex2quat(str(input.charAt(1))))/10;
  details=int(unhex(str(input.charAt(2))))%4;
  for(int i=0; i<5;i++)
  {
    typettoColors[i]=(int(hex2quat(str(input.charAt(i+3))))/10);
    typettoPalette[i]=(int(hex2quat(str(input.charAt(i+3))))%10);
  }
  if(typettoColors[1]==typettoColors[2]) //Braccia diverse dal corpo
  {
    typettoColors[2]=(typettoColors[2]+1)%4;
    typettoPalette[2]=(typettoPalette[2]+1)%4;
  }
  if(typettoColors[1]==typettoColors[0]) //occhi diversi dal corpo
  {
    typettoColors[0]=(typettoColors[0]+2)%4;
    typettoPalette[0]=(typettoPalette[0]+1)%4;
  }
  if((typettoColors[1]==1 && typettoPalette[1]==0) || typettoColors[1]==0)
  {
    typettoColors[1]=(typettoColors[1]+1)%4;
  }
  //Da scorporare in un bottone^
  //Corpo possono essere uguali gambe
  //braccia, dettagli, gambe e occhi possono essere uguali
  //Corpo!=braccia! && corpo!=dettagli e corpo!=occhi

}
 
void drawTypetto()
{
  typetti_body[torso].draw_bigSprite(partX,partY,typettoPalette[1],typettoColors[1]);
  typetti_legs[legs].draw_bigSprite(partX,partY,typettoPalette[3],typettoColors[3]);
  typetti_arms[arms].draw_bigSprite(partX,partY,typettoPalette[2],typettoColors[2]);
  typetti_detail[details].draw_bigSprite(partX,partY,typettoPalette[4],typettoColors[4]);
  typetti_face[face].draw_bigSprite(partX,partY,typettoPalette[0],typettoColors[0]); 
}
  
void saveTypetti()
{
  String[] a ={typetto};
  saveStrings("textData/typettiSalvati/Typetto "+hour()+"_"+minute()+"_"+second()+".txt",a);
}

void loadTypetto()
{
  selectInput("Select a file to process:", "typettoSelected");
}

void typettoSelected(File selection)
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
      String a=loadStrings(selection.getAbsolutePath())[0];
      typetto=a;
    }
    else
    {
      print("Il file selezionato non è del formato richiesto");
    }
  }
}

String randomHex()
{
  String toReturn="";
  for(int i=0; i<8;i++)
  {
    int a=int(random(0,16));
    toReturn+=hex(a).substring(7,8);
  }
  return toReturn;
}
