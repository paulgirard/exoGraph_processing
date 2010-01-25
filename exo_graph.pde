// draw two circles and a line between them
// add colors : black background, turquoise circle with opacity, yellow line
// move circles

//global vars
int[][] circles = new int[2][6]; 

//velocity
int x_velocity=1;
int y_velocity=2;

void setup()
{
  size(400,400);
 
  // x
  circles[0][0]=200;
  // y
  circles[0][1]=200;
  // width
  circles[0][2]=50;
  //height
  circles[0][3]=50;
  // x velocity
   circles[0][4]=-2;
  // y velocity
   circles[0][5]=2;
  // x
  circles[1][0]=80;
  // y
  circles[1][1]=80;
  // width
  circles[1][2]=20;
  //height
  circles[1][3]=20;
  // x velocity
   circles[1][4]=2;
  // y velocity
   circles[1][5]=1;
}

void draw()
{
  background(10);
  for(int i=0;i<circles.length;i++)
  {
    fill(0,180,200,50);
    noStroke();
  
    circles[i][0]+= circles[i][4];
    circles[i][1]+=  circles[i][5];
    ellipse(circles[i][0],circles[i][1],circles[i][2],circles[i][3]);
    
  }
  stroke(205,206,0);
  line(circles[0][0],circles[0][1],circles[1][0],circles[1][1]); 
}
