// draw two circles and a line between them
// add colors : black background, turquoise circle with opacity, yellow line
// change circles color randomly



void setup()
{
  size(400,400);
  frameRate(5);
 
}

void draw()
{
  background(10);
  fill(0,random(100,240),random(150,210),50);
  noStroke();
  ellipse(200,200,50,50);
  fill(0,random(100,240),random(150,210),50);
  ellipse(80,80,20,20);
 
  stroke(random(50,225),random(50,225),0);
  line(200,200,80,80); 
}
