import processing.serial.*; 
Serial myPort;
int x1;
int y1;
int x2;
int y2;
String val;
String portName;
void setup() {
  size(750, 800);
  background(0, 0, 0);
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n'); 
  circles();
  net1(125, 175);
  net3(625, 675);
  fill(120, 156, 178);
  textSize(30);
  text("BALLS LEFT-", 500, 35);  
  text("10", 680, 35);
  fill(220, 200, 42);
  text("PLAYER_1- ", 10, 35);
  text("0", 180, 35);
  fill(176, 15, 67);
  text("PLAYER_2- ", 260, 35);
  text("0 ", 430, 35);
}
int[] xco={125, 375, 625};
int[] yco={175, 425, 675};
int x=0;
int y=8;
int k1, k2;
float rad1=20, rad2=20;
int flag1=0, flag2=0;
int randx1;
int randy1;
int randx2;
int randy2;
int a;
float p=0;
int score1=0, score2=0;
int balls_left=10;
int b1=0;
int b2=0;
int game=1;
void draw()
{ 
  if (game==1)
  {
    if (flag1==0||flag2==0)
    {
      if (flag1==0)
      {
        randx1=xco[randomx()];
        randy1=yco[randomy()];
        k1=returnk(randx1, randy1);
      } 
      if (flag2==0)
      { 
        randx2=xco[randomx()];
        randy2=yco[randomy()];
        if ((randx1!=randx2)&&(randy1!=randy2))
        { 
          k2=returnk(randx2, randy2);
        }
      }
    }


    if (rad1<170||rad2<170)
    { 
      if (rad1<170)
      {
        flag1=1;
        ball(randx1, randy1, rad1);
        rad1=rad1+0.5+p;
      }
      if (rad2<170)
      {
        flag2=1;
        ball(randx2, randy2, rad2);
        rad2=rad2+0.8+p;
      }
    }

    if (x==k1||x==k2||y==k1||y==k2)
    {
      if (x==k1||y==k1)
      {
        fill(67, 45, 56);
        ellipse(randx1, randy1, 170, 170);
        rad1=20;
        flag1=0;
        p=p+0.05;
        if (x==k1)
        { 
          fill(0, 0, 0);
          rect(170, 0, 80, 40);
          score1=score1+10;
          fill(220, 200, 42);
          textSize(30);
          text(score1, 180, 35);
        } else
        {
          fill(0, 0, 0);
          rect(420, 0, 80, 40);
          fill(176, 15, 67);
          score2=score2+10;
          textSize(30);
          text(score2, 430, 35);
        }
      }
      if (x==k2||y==k2)
      {
        fill(67, 45, 56);
        ellipse(randx2, randy2, 170, 170);
        rad2=20;
        flag2=0;
        p=p+0.01;
        if (x==k2)
        {
          fill(0, 0, 0);
          rect(170, 0, 80, 40);
          score1=score1+10;
          fill(220, 200, 42);
          textSize(30);
          text(score1, 180, 35);
        } else
        {
          fill(0, 0, 0);
          rect(420, 0, 80, 40);
          fill(176, 15, 67);
          score2=score2+10;
          textSize(30);
          text(score2, 430, 35);
        }
      }
    }
    if (rad1>=170||rad2>=170)
    {
      if (rad1>=170)
      {
        fill(67, 45, 56);
        ellipse(randx1, randy1, 170, 170);
        rad1=20;
        flag1=0;
        p=p+0.01;
        if (x==k1||y==k1)

        {
          if (x==k1)
          {
            fill(0, 0, 0);
            rect(170, 0, 80, 40);
            score1=score1+10;
            fill(220, 200, 42);
            textSize(30);
            text(score1, 180, 35);
          } else
          {
            fill(0, 0, 0);
            rect(420, 0, 80, 40);
            fill(176, 15, 67);
            score2=score2+10;
            textSize(30);
            text(score2, 430, 35);
          }
        }

        if ((x!=k1)&&(y!=k2))
        {
          fill(0, 0, 0);
          rect(680, 0, 70, 40);
          fill(120, 156, 178);
          balls_left--;
          textSize(30);
          text(balls_left, 680, 35);
        }
      }
      if (rad2>=170)
      {
        fill(67, 45, 56);
        ellipse(randx2, randy2, 170, 170);
        rad2=20;
        flag2=0;
        p=p+0.01;
        if (x==k2||y==k2)

        {
          if (x==k2)
          {
            fill(0, 0, 0);
            rect(170, 0, 80, 40);
            score1=score1+10;
            fill(220, 200, 42);
            textSize(30);
            text(score1, 180, 35);
          } else
          {
            fill(0, 0, 0);
            rect(420, 0, 80, 40);
            fill(176, 15, 67);
            score2=score2+10;
            textSize(30);
            text(score2, 430, 35);
          }
        }

        if (x!=k2&&y!=k2)
        {
          fill(0, 0, 0);
          rect(680, 0, 70, 40);
          fill(120, 156, 178);
          balls_left--;
          textSize(30);
          text(balls_left, 680, 35);
        }
      }
      if (balls_left==0)
      {
        game=0;
      }
    }
    int time=millis();
    while (millis()<(time+25))
    {
    }
  }
  if (game==0)
  {
    background(0, 0, 0);
    fill(200, 72, 37);
    textSize(100);
    text("GAME OVER", 80, 100);
    fill(220, 200, 42);
    textSize(70);
    text("PLAYER 1-", 120, 200);
    text(score1, 500, 200);
    fill(176, 15, 67);
    text("PLAYER 2-", 120, 300);
    text(score2, 500, 300);
    
    
   if(score1>score2)
    {
      fill(200, 75, 57);
    textSize(100);
    text("PLAYER 1 WINS", 30, 500);
    }
    else if(score1<score2)
    {
      fill(200, 75, 57);
    textSize(100);
    text("PLAYER 2 WINS", 30, 500);
    }
    else
    {
       fill(200, 75, 57);
    textSize(100);
    text("DRAW", 180, 500);
    }
  }
}
int returnk(int randx, int randy)
{ 
  if (randx==125)
  {
    if (randy==175) {
      a=0;
    }
    else if (randy==425) {
      a=3;
    }
    else if (randy==675) {
      a=6;
    }
  }
  else if (randx==375)
  {
    if (randy==175) {
      a=1;
    }
    else if (randy==425) {
      a=4;
    }
    else if (randy==675) {
      a=7;
    }
  }
  else if (randx==625)
  {
    if (randy==175) {
      a=2;
    }
    else if (randy==425) {
      a=5;
    }
    else if (randy==675) {
      a=8;
    }
  }
  return(a);
}
void ball(int xco, int yco, float x)
{
  fill(122, 132, 133);
  noStroke();
  ellipse(xco, yco, x, x);
}

void net1(int x, int y)
{  
  strokeWeight(30);
  stroke(220, 200, 42);
  noFill();
  ellipse(x, y, 200, 200);
}
void net2(int x, int y)
{  
  strokeWeight(30);
  stroke(231, 175, 226);
  noFill();
  ellipse(x, y, 200, 200);
}
void net3(int x, int y)
{  
  strokeWeight(30);
  stroke(176, 15, 67);
  noFill();
  ellipse(x, y, 200, 200);
}

void circles()
{
  fill(67, 45, 56);
  strokeWeight(30);
  stroke(231, 175, 226);
  {
    ellipse(125, 175, 200, 200);
    ellipse(375, 175, 200, 200);
    ellipse(625, 175, 200, 200);
    ellipse(125, 425, 200, 200);
    ellipse(375, 425, 200, 200);
    ellipse(625, 425, 200, 200);
    ellipse(125, 675, 200, 200);
    ellipse(375, 675, 200, 200);
    ellipse(625, 675, 200, 200);
  }
}
int randomx()
{
  int x=int(random(0, 3));
  return(x);
}
int randomy()
{
  int y=int(random(0, 3));
  return(y);
}

void main_component1()
{
  if (x==4)
  {
    net1(375, 425);
  } else if (x==0)
  {
    net1(125, 175);
  } else if (x==1)
  {
    net1(375, 175);
  } else if (x==2)
  {
    net1(625, 175);
  } else if (x==3)
  {
    net1(125, 425);
  } else if (x==5)
  {
    net1(625, 425);
  } else if (x==6)
  {
    net1(125, 675);
  } else if (x==7)
  {
    net1(375, 675);
  } else if (x==8)
  {
    net1(625, 675);
  }
  if (y==4)
  {
    net3(375, 425);
  } else if (y==0)
  {
    net3(125, 175);
  } else if (y==1)
  {
    net3(375, 175);
  } else if (y==2)
  {
    net3(625, 175);
  } else if (y==3)
  {
    net3(125, 425);
  } else if (y==5)
  {
    net3(625, 425);
  } else if (y==6)
  {
    net3(125, 675);
  } else if (y==7)
  {
    net3(375, 675);
  } else if (y==8)
  {
    net3(625, 675);
  }
}
void main_component2()
{ 
  if (x==4)
  {
    net2(375, 425);
  } else if (x==0)
  {
    net2(125, 175);
  } else if (x==1)
  {
    net2(375, 175);
  } else if (x==2)
  {
    net2(625, 175);
  } else if (x==3)
  {
    net2(125, 425);
  } else if (x==5)
  {
    net2(625, 425);
  } else if (x==6)
  {
    net2(125, 675);
  } else if (x==7)
  {
    net2(375, 675);
  } else if (x==8)
  {
    net2(625, 675);
  }
  if (y==4)
  {
    net2(375, 425);
  } else if (y==0)
  {
    net2(125, 175);
  } else if (y==1)
  {
    net2(375, 175);
  } else if (y==2)
  {
    net2(625, 175);
  } else if (y==3)
  {
    net2(125, 425);
  } else if (y==5)
  {
    net2(625, 425);
  } else if (y==6)
  {
    net2(125, 675);
  } else if (y==7)
  {
    net2(375, 675);
  } else if (y==8)
  {
    net2(625, 675);
  }
}
void net_all()
{
  net2(125,175);
  net2(125,425);
  net2(125,675);
  net2(375,175);
  net2(375,425);
  net2(375,675);
  net2(625,175);
  net2(625,425);
  net2(625,675);
}
void main_component3()
{
 net_all();
 main_component1();
}
void serialEvent(Serial myPort) 
{  
  main_component3();
  val = myPort.readStringUntil('\n');

  if (val != null)
  {
    val = trim(val);
    int[] vals = int(splitTokens(val, ","));

    x1 = int(vals[0]);
    y1 = int(vals[1]);
    x2 = int(vals[2]);
    y2 = int(vals[3]);
    int p1=x1+y1-1023;
    int q1=x1-y1;
    int p2=x2+y2-1023;
    int q2=x2-y2;

    if ((p1<0)&&(q1<0)&&(x1-450<0))
    {  
      if (x>2)
      {
        if ((x-3)!=y)
        {
          main_component2();
          x=x-3;
          main_component1();
        }
      }
    } else if ((p1>0)&&(q1>0)&&(x1-600>0))
    {  
      if (x<6)
      {
        if ((x+3)!=y)
        {
          main_component2();
          x=x+3;
          main_component1();
        }
      }
    } else  if ((p1>0)&&(q1<0)&&(y1-600>0))
    { 
      if ((x!=0)&&(x!=3)&&(x!=6))
      {
        if ((x-1)!=y)
        {
          main_component2();
          x=x-1;
          main_component1();
        }
      }
    } else if ((p1<0)&&(q1>0)&&(y1-450<0))
    { 
      if ((x!=2)&&(x!=5)&&(x!=8))
      {
        if ((x+1)!=y)
        {
          main_component2();
          x=x+1;
          main_component1();
        }
      }
    }
    if ((p2<0)&&(q2<0)&&(x2-450<0))
    { 
      if (y>2)
      {
        if ((y-3)!=x)
        {
          main_component2();
          y=y-3;
          main_component1();
        }
      }
    } else if ((p2>0)&&(q2>0)&&(x2-600>0))
    { 
      if (y<6)
      {
        if ((y+3)!=x)
        {
          main_component2();
          y=y+3;
          main_component1();
        }
      }
    } else  if ((p2>0)&&(q2<0)&&(y2-600>0))
    { 
      if ((y!=0)&&(y!=3)&&(y!=6))
      {
        if ((y-1)!=x)
        {
          main_component2();
          y=y-1;
          main_component1();
        }
      }
    } else if ((p2<0)&&(q2>0)&&(y2-450<0))
    { 
      if ((y!=2)&&(y!=5)&&(y!=8))
      {
        if ((y+1)!=x)
        {
          main_component2();
          y=y+1;
          main_component1();
        }
      }
    }
  }
}
