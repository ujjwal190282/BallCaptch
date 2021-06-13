import processing.serial.*; 
Serial myPort;
int x1;
int y1;
String val;
String portName;

void setup() {

  size(750, 800);
  background(0, 0, 0);
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n'); 

  circles();
  net1(375, 425);
  fill(100, 200, 150);
  textSize(30);
  text("SCORE--", 20, 35);
  text("0", 180, 35);
  text("BALLS LEFT--", 420, 35);
  text("10", 640, 35);
}
int[] xco={125, 375, 625};
int[] yco={175, 425, 675};
int x=4;
int k;
float rad=20;
int flag=0;
int randx;
int randy;
int a;
float p=0;
int score=0;
int balls_left=10;
int game=1;
void draw()
{  if(game==1)
{
  if (flag==0)
  {
    randx=xco[randomx()];
    randy=yco[randomy()];
    k=returnk(randx, randy);
  }


  if (rad<170)
  { 

    flag=1;
    ball(randx, randy, rad);
    rad=rad+1+p;
  }
  if (x==k)
  {
    fill(67, 45, 56);
    ellipse(randx, randy, 170, 170);
    rad=20;
    flag=0;
    p=p+0.05;
    fill(0, 0, 0);
    rect(170, 0, 80, 40);
    score=score+10;
    fill(100, 200, 150);
    textSize(30);
    text(score, 180, 35);
  }
  if (rad>=170)
  {
    fill(67, 45, 56);
    ellipse(randx, randy, 170, 170);
    rad=20;
    flag=0;
    p=p+0.05;
    if (x==k)

    {
      fill(0, 0, 0);
      rect(170, 0, 80, 40);
      score=score+10;
      fill(100, 200, 150);
      textSize(30);
      text(score, 180, 35);
    }
    if (x!=k)
    {
      fill(0, 0, 0);
      rect(630, 0, 80, 40);
      balls_left--;
      fill(100, 200, 150);
      textSize(30);
      text(balls_left, 640, 35);
    }
    if (balls_left==0)
    {
      game=0;
    }
  }
  int time=millis();
  while (millis()<(time+20))
  {
  }
}
if(game==0)
{
  background(0,0,0);
  fill(220,172,137);
  textSize(100);
  text("GAME OVER",100,300);
   fill(140,32,57);
   text("SCORE", 150, 600);
    text(score, 550, 600);
  
}
}
int returnk(int randx, int randy)
{ 
  if (randx==125)
  {
    if (randy==175) {
      a=0;
    } else if (randy==425) {
      a=3;
    } else  if (randy==675) {
      a=6;
    }
  } else if (randx==375)
  {
    if (randy==175) {
      a=1;
    } else if (randy==425) {
      a=4;
    } else if (randy==675) {
      a=7;
    }
  } else if (randx==625)
  {
    if (randy==175) {
      a=2;
    } else if (randy==425) {
      a=5;
    } else if (randy==675) {
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
}
void main_component3()
{
  if (x!=4)
  {
    net2(375, 425);
  }  if (x!=0)
  {
    net2(125, 175);
  }  if (x!=1)
  {
    net2(375, 175);
  }  if (x!=2)
  {
    net2(625, 175);
  }  if (x!=3)
  {
    net2(125, 425);
  }  if (x!=5)
  {
    net2(625, 425);
  }  if (x!=6)
  {
    net2(125, 675);
  }  if (x!=7)
  {
    net2(375, 675);
  } if (x!=8)
  {
    net2(625, 675);
  }
}
/*/void keyPressed() {
 if (key == 'w'|| key=='W')
 {
 if (x>2)
 {
 main_component2();
 x=x-3;
 main_component1();
 }
 } else if (key == 's'|| key=='S')
 { 
 if (x<6)
 {
 main_component2();
 x=x+3;
 main_component1();
 }
 } else  if (key == 'a'|| key=='A')
 {
 if ((x!=0)&&(x!=3)&&(x!=6))
 {
 main_component2();
 x=x-1;
 main_component1();
 }
 } else if (key == 'd'|| key=='D')
 {
 if ((x!=2)&&(x!=5)&&(x!=8))
 {
 main_component2();
 x=x+1;
 main_component1();
 }
 }
 }/*/
void serialEvent(Serial myPort) 
{ main_component1();
  main_component3();
  val = myPort.readStringUntil('\n');

  if (val != null)
  {
    val = trim(val);
    int[] vals = int(splitTokens(val, ","));

    x1 = int(vals[0]);
    y1 = int(vals[1]);
    int p=x1+y1-1023;
    int q=x1-y1;
    
    if ((p<0)&&(q<0)&&(x1-450<0))
    {
      if (x>2)
      {
        main_component2();
        x=x-3;
        main_component1();
      }
    } else  if ((p>0)&&(q>0)&&(x1-600>0))
    { 
      if (x<6)
      {
        main_component2();
        x=x+3;
        main_component1();
      }
    } else if ((p>0)&&(q<0)&&(y1-600>0))
    {
      if ((x!=0)&&(x!=3)&&(x!=6))
      {
        main_component2();
        x=x-1;
        main_component1();
      }
    } else if ((p<0)&&(q>0)&&(y1-450<0))
    {
      if ((x!=2)&&(x!=5)&&(x!=8))
      {
        main_component2();
        x=x+1;
        main_component1();
      }
    }

  }
}
