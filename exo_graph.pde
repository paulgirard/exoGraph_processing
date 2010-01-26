import processing.opengl.*;

// draw two circles and a line between them
// add colors : black background, turquoise circle with opacity, yellow line
// change circles color randomly
// move circles
// create a circle object with position, sizes, velocities, color a move and a draw methods
// make edges transportation : a circle which gets out of the canvas reappear one opposite border 

//global vars
int nb_circles=10;
int proche=80;
int maxSizeCircle=50;
int minSizeCircle=10;
float maxVelocity=1.5;
int mouseProche=10;
boolean mouseFlag=false;
Circle[] circles = new Circle[nb_circles]; 

class Circle
{
  float x=0;
  float y=0;
  int s=10;
  float x_velocity=0;
  float y_velocity=0;
  int r=200;
  int g=200;
  int b=200;
  int al=50;
  boolean dragged=false;
  
  public Circle(int x, int y , int s, float x_velocity, float y_velocity,int r, int g, int b, int al)
  {
     //position
     this.x=x;this.y=y;
     //size
     this.s=s;
     //velocities
     this.x_velocity=x_velocity;
     this.y_velocity=y_velocity;
     //color
     this.r=r;this.g=g;this.b=b;this.al=this.al;
  }
  
  void move()
  {
    this.x+=this.x_velocity;
    this.y+=this.y_velocity;
    if(mouseFlag&&dist(this.x,this.y,mouseX,mouseY)<this.s)
    {
      this.x=mouseX;
      this.y=mouseY;
      this.dragged=true;
    }
    else
     this.dragged=false;
  }
  
  void draw()
  {
   
    if(!dragged)
      fill(this.r,this.g,this.b,this.al);
    else
      fill(255-this.r,255-this.g,255-this.b,this.al);
    noStroke();
    ellipse(this.x,this.y,this.s,this.s);
    
     float rayon=this.s/2;
    if(this.x>width+rayon)
     this.x=-rayon;
    if(this.x<-rayon)
     this.x=width+rayon;
    if(this.y>height+rayon)
     this.y=-rayon;
    if(this.y<-rayon)
     this.y=height+rayon;
  }
  
  boolean isClose(Circle c1)
  {
      return (sqrt(pow(abs(this.x-c1.x),2)+pow(abs(this.y-c1.y),2))<proche); 
  }
}

void setup()
{
  size(400,400,OPENGL);
  frameRate(15);
  for(int i=0;i<nb_circles;i++)
  {
    circles[i]=new Circle(randomInt(0,400),randomInt(0,400),randomInt(minSizeCircle,maxSizeCircle),random(-maxVelocity,maxVelocity),random(-maxVelocity,maxVelocity),0,randomInt(150,220),randomInt(150,220),50);
  }
}

void draw()
{
  background(10);
  for(int i=0;i<circles.length;i++)
  {
    circles[i].move();
    circles[i].draw();
  }
  stroke(205,206,0);
  for(int i=0;i<circles.length;i++)
  {
    for(int j=i+1;j<circles.length;j++)
    {
      if(circles[i].isClose(circles[j]))
      {
        line(circles[i].x,circles[i].y,circles[j].x,circles[j].y); 
      }
    } 
  }
  
}

void mousePressed()
{
  mouseFlag=true;
}
void mouseDragged()
{
  mouseFlag=true;
}

void mouseReleased()
{
  mouseFlag=false;
}


int randomInt(int min, int max)
{
  return (int)random(min,max);
}
