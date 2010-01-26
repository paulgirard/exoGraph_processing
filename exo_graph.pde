import processing.opengl.*;

// draw two circles and a line between them
// add colors : black background, turquoise circle with opacity, yellow line
// change circles color randomly
// move circles
// create a circle object with position, sizes, velocities, color a move and a draw methods
 

//global vars
int nb_circles=30;
int proche=80;
int maxSizeCircle=50;
int minSizeCircle=10;
float maxVelocity=1.5;
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
  }
  
  void draw()
  {
    fill(this.r,this.g,this.b,this.al);
    noStroke();
    ellipse(this.x,this.y,this.s,this.s);
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

int randomInt(int min, int max)
{
  return (int)random(min,max);
}
