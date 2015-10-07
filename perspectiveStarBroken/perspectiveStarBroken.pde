/*    Loops

For Loops:
  1) Repeating stuff
  2) Iterating arrays
  3) Generating a sequence of numbers
  
While loop:

*/
float cx, cy;
float y;
int numLines = 25;

void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  
  float gap = width/numLines;
  
  cx = width/2;
  cy = height/2;
  
  for(int i=0; i<= width; i+=gap)
  {
    line(i, height, cx, cy);
  }//end for
  
  float segments = 10;
  float thetaInc = TWO_PI/segments;
  float smallR = 5;
  float radius = 200;
  boolean inner = true;
  float lastX = cx, lastY = cy - smallR;
  
  for(int point=1;point<=segments*2;point++)
  {
    float theta = point * thetaInc;
    float r;
    if(point%2 == 0)
    {
      r = radius;
    }
    else
    {
      r = radius/2;
    }
    
    float x = cx - sin(theta) * r;
    float y = cy + cos(theta) * r;
    
    line(lastX, lastY, x, y);
    lastX = x;
    lastY = y;
    
    inner = !inner;
  }
  
}//end setup

void draw()
{
  
  /*for(int i=1;i<height/2;i++)
  {
    //y += sq(i);
    line(0, y, width, y);
    y += i;
  }*/
}//end draw
  
  
