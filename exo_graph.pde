// draw two circles and a line between them
// add colors : black background, turquoise circle with opacity, yellow line
// change circles color randomly
// move circles
// create a circle object with position, sizes, velocities, color a move and a draw methods
 

//global vars
Circle[] circles = new Circle[2]; 

class Circle
{
  int x=0;
  int y=0;
  int w=10;
  int h=10;
  int x_velocity=0;
  int y_velocity=0;
  int r=200;
  int g=200;
  int b=200;
  int al=50;
  
  public Circle(int x, int y , int w, int h, int x_velocity, int y_velocity,int r, int g, int b, int al)
  {
     //position
     this.x=x;this.y=y;
     //size
     this.w=w;this.h=h;
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
    ellipse(this.x,this.y,this.w,this.h);
  }
}

void setup()
{
  size(400,400);
  frameRate(25);
 
  circles[0]=new Circle(200,200,50,50,-2,2,0,(int)random(150,220),(int)random(150,220),50);
  circles[1]=new Circle(80,80,20,20,2,1,0,(int)random(20,150),(int)random(10,150),50);
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
