//Esempio di gioco: PONG
paddle paddleLEFT;
paddle paddleRIGHT;
bigSprite ball;
int ScorePong_1;
int ScorePong_2;
int ball_angle;
int ball_x;
int ball_y;

float ballSpeed;
float ball_xSpeed;
float ball_ySpeed;
int paddleSpeed;
int paddleLEFT_x;
int paddleLEFT_y;
int paddleRIGHT_x;
int paddleRIGHT_y;
int pongCanvas_x;
int pongCanvas_y;
int pongCanvas_width;
int pongCanvas_height;
boolean pongCollision;
bigSprite pongBG;
void game_pong_init()
{
  fillColor=3;
  fillPalette=2;
  activeScreen=2;
  paddleLEFT_x=0;
  paddleLEFT_y=96;
  paddleRIGHT_x=248;
  paddleRIGHT_y=96;
  paddleSpeed=5;
  
  pongCanvas_width=256;
  pongCanvas_x=0;
  pongCanvas_height=168;
  pongCanvas_y=48;
  
  ScorePong_1=0;
  ScorePong_2=0;
  ball_x=124;
  ball_y=108;
  ball_angle=(int(random(0,360)));
  ball_xSpeed=2;
  ball_ySpeed=2;
  
  int[] controlsLEFT={0,2};
  int[] controlsRIGHT ={4,5};
  
  pongCollision=false;
  ballSpeed=0.05;
  ball= new bigSprite(ball_x,ball_y,1,3,solidSquare[1]);
  paddleRIGHT = new paddle(paddleRIGHT_x,paddleRIGHT_y,1,4,controlsRIGHT);
  paddleLEFT = new paddle(paddleLEFT_x,paddleLEFT_y,1,4,controlsLEFT);
}

void game_pong_screen()
{
  fill_Background(pongCanvas_x,pongCanvas_y,pongCanvas_width,pongCanvas_height,2,2);
  fill_Background(0,16,256,24,3,3);
  drawText(str(ScorePong_1),60,24);
  drawText(str(ScorePong_2),180,24);
  ball.draw_bigSprite(ball_x,ball_y);
  paddleLEFT.paddleDraw();
  paddleRIGHT.paddleDraw();
  ball_movement_pong();
}
void pongBallMove()
{
  //TEST
  if(pongCollision==false)
  {
  if(keyPressed)
  {
  // ball_angle=(int(random(0,360)));
  }
  //
    if(ball_y+ball_ySpeed+8>216)
  {
    if(ball_xSpeed>0)
    ball_angle+=90;
    else
    ball_angle-=90;
  }
  else if(ball_y+ball_ySpeed<48)
  {
    if(ball_xSpeed>0)
    ball_angle+=90;
    else
    ball_angle-=90;
  }

  ball_angle=ball_angle%360;
  if(ball_angle>0 && ball_angle<=90)
  {
  ball_xSpeed=ballSpeed*ball_angle;
  ball_ySpeed=ballSpeed*(ball_angle-90);
  }
  else if(ball_angle>90 && ball_angle<=180)
  {
    ball_xSpeed=ballSpeed*(90-(ball_angle%90));
    ball_ySpeed=ballSpeed*(ball_angle-90);
  }
  else if(ball_angle>180 && ball_angle<=270)
  {
    ball_xSpeed=ballSpeed*((ball_angle%90)*(-1));
    ball_ySpeed=ballSpeed*(90-(ball_angle%90));
  }
  else if(ball_angle>270 || ball_angle<=0)
  {
    ball_xSpeed=ballSpeed*((ball_angle%90)*(-1));
    ball_ySpeed=ballSpeed*(90-(ball_angle%90));
  }
  ball_x+=ball_xSpeed;
  ball_y+=ball_ySpeed;
  }
}
class paddle
{
  int x;
  int y;
  int w;
  int h;
  int[] controls;
  bigSprite paddleSprite;
  public paddle(int x, int y, int w, int h, int[] controls)
  {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.controls=controls;
    paddleSprite=new bigSprite(x,y,w,h,solidSquare[1].repeat(w*h));
  }
  void paddleDraw()
  {
    movePaddle();
    paddleSprite.draw_bigSprite(x,y);
    collision();
  }
  void movePaddle()
  {
    if(controls.length==2)
    {
      if(keyboardButtons[controls[0]]>0 && y-paddleSpeed >48) //da rifinire
      {
         y -= paddleSpeed;
      }
      if(keyboardButtons[controls[1]]>0 && y+paddleSpeed <48+168-(4*8))
      {
         y += paddleSpeed; 
      }
    }
  }
  void collision()
  {
    if((ball_x+8>x && ball_x<x+(w*8) && ball_y+8 > y && ball_y<y+(h*8))) //Da continuare hitbox
    {
    ball_xSpeed=-ball_xSpeed;
    pongCollision=true;
    }
  }
  
}

void ball_movement_pong()
{

  if(ball_y+ball_ySpeed +8>216 || ball_y+ball_ySpeed < 48)
  {
   ball_ySpeed=-ball_ySpeed;
  }
  ball_x+=ball_xSpeed;
  ball_y+=ball_ySpeed;
  if(ball_x<4)
  {
    ScorePong_2++;
    ball_x=124;
    ball_y=108;
  }
  if(ball_x+8 >256)
  {
    ScorePong_1++;
    ball_x=124;
    ball_y=108;
  }
}
