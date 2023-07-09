String encodeFile(String fileToConvert)
{
  
  String hex="";
  int fileLength = fileToConvert.length();
  for(int i=0;i<fileLength;i=i+4)
    {
       hex=hex+quat2hex(fileToConvert.substring(i,i+4));
    }
  return hex;
}
bigSprite decodeBigSprite(String fileToConvert)
{
  bigSprite toReturn;
  String quat="";
  int toReturnW=int(fileToConvert.substring(0,2)); //Non converte da hex ma non serve
  fileToConvert=fileToConvert.substring(2,fileToConvert.length());
   int fileLength = fileToConvert.length();
   if(fileLength%2==0)
   {
     for(int i=0;i<fileLength;i=i+2)
     {
        quat=quat+hex2quat(fileToConvert.substring(i,i+2));
     }
   }
   toReturn = new bigSprite(toReturnW,quat);
   return toReturn;
}

String decodeFile(String fileToConvert)
{
   String quat="";
   int fileLength = fileToConvert.length();
   if(fileLength%2==0)
   {
     for(int i=0;i<fileLength;i=i+2)
     {
        quat=quat+hex2quat(fileToConvert.substring(i,i+2));
     }
   }
   return quat;
}

String quat2hex(String quat) //Converte 4 cifre quaternarie in 2 hex 
{
   String hex_value;
   int conversionCounter=0;
   for(int i=0;i<4;i++)
   {
     int digitToConvert = int(quat.charAt(3-i)-48);
     conversionCounter =conversionCounter + int(digitToConvert*pow(4,i));     
   }
   hex_value = hex(conversionCounter,2);
   return hex_value;
}

String hex2quat(String hex_value)
{
   String quat_value="";
   int conversionCounter=0;
   conversionCounter = unhex(hex_value);
   String quatAccumulate="";
   while(conversionCounter>0)
   {
       quatAccumulate+=conversionCounter%4;
       conversionCounter=conversionCounter/4;
   }
   for(int i=0; i<quatAccumulate.length();i++)
   {
       quat_value+=quatAccumulate.charAt(quatAccumulate.length()-i-1);
   }
   return nf(int(quat_value),4);
}

int quat2dec(String quat_value)
{
  int dec=0;
  for(int i=0; i<quat_value.length();i++)
  {
    dec+=int((quat_value.charAt(i)-48)*pow(4,(quat_value.length()-i)-1));
  }
  return dec;
}
