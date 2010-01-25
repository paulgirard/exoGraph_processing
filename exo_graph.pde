// draw two circles and a line between them
// add colors : black background, turquoise circle with opacity, yellow line
// change circles color randomly
// move circles
// create a circle object with position, sizes, velocities, color a move and a draw methods
 

//global vars
int nb_circles=10;
Circle[] circles = new Circle[nb_circles]; 

class Circle
{
  int x=0;
  int y=0;
  int s=10;
  int x_velocity=0;
  int y_velocity=0;
  int r=200;
  int g=200;
  int b=200;
  int al=50;
  
  public Circle(int x, int y , int s, int x_velocity, int y_velocity,int r, int g, int b, int al)
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
}

void setup()
{
  size(400,400);
  frameRate(25);
  for(int i=0;i<nb_circles;i++)
  {
    circles[i]=new Circle(randomInt(0,400),randomInt(0,400),randomInt(0,50),randomInt(-5,5),randomInt(-5,5),0,randomInt(150,220),randomInt(150,220),50);
  }
}

void draw()
{
  background(10);
  for(int i=0;i<circles.length;i++)
  {
    circles[i].move();
    circles[i].draw();
    if(i>0)
    {
      stroke(205,206,0);
      line(circles[i-1].x,circles[i-1].y,circles[i].x,circles[i].y); 
    } 
  }
  
}

int randomInt(int min, int max)
{
  return (int)random(min,max);
}
