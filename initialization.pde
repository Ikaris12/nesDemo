void init()
{
   init_colors(); //Genera i 56 colori utilizzati
   initPalette(); //Genera delle palette di default
   initPixels();  //Genera i pixel a schermo
   init_controls();
   
   fillColor=1;
   fillPalette=2;
   
   solidSquare= new String[4];
   solidSquare[0]=decodeFile(loadStrings("textData/square.txt")[0].substring(0,32)); //<>//
   solidSquare[1]=decodeFile(loadStrings("textData/square.txt")[0].substring(32,64)); //<>//
   solidSquare[2]=decodeFile(loadStrings("textData/square.txt")[0].substring(64,96)); //<>//
   solidSquare[3]=decodeFile(loadStrings("textData/square.txt")[0].substring(96,128)); //<>//
   
   checkersSquare=decodeFile(loadStrings("textData/checkers.txt")[0].substring(2,34));
   String logodata=loadStrings("textData/Logo.txt")[0];
   String logow=logodata.substring(0,2);
   logodata=decodeFile(logodata.substring(2,logodata.length()));
   logo=new bigSprite(96,16,int(logow),logodata,2);
   
   font=loadStrings("textData/font.txt")[0];
   font=decodeFile(font.substring(2,font.length()));
   
   //Inizializza i bottoni
   home_btn=new nesButton("Torna indetro",0,0,2);
   loadTextScreen_btn=new nesButton("Carica un file di testo",24,112,1);
   Load_image = new nesButton("Carica immagine",24,96,6);
   paintScreenOpen= new nesButton("Modifica i colori", 24,144,7);
   typettiScreenOpen= new nesButton("Genera dei Typetti", 24, 160, 8);
   Pong=new nesButton("Gioca a PONG",24,128,5);
   activeScreen=0; //La schermata di base
   noStroke();
   frameRate(30);
}
