float starPoints;
int starNumber;
int count;
float x1, y1, x2, y2;
float triO, triA;
float originX, originY;
float startX, startY;
float starRadius;
float theta;
float thetaInc;

void setup()
{
  size(500, 500);
  
  //Random number of stars
  starNumber = (int) random(1, 10);
  noFill();
  background(0);
  
  /*How to draw one star
  originX = width/2;
  originY = height/2;
  stroke(random(256), random(256), random(256));
  ellipse(originX, originY, 100, 100);
  ellipse(originX, originY, 100*2, 100*2);
  drawStar(100.0, 5.0);
  */
  
  //Drawing multiple stars
  for(int i = 0;i<=starNumber;i++)
  {
    //Reset points
    x1 = -1;
    x2 = -1;
    y1 = -1;
    y2 = -1;
    
    //Random colour
    stroke(random(256), random(256), random(256));
    
    //Reset count to 0
    count = 1;
    
    //Set a random star size and a random number of points
    starRadius = random(10, 76);
    starPoints = (int) random(4, 10);
    
    //Take the centre point of the circle
    originX = random(starRadius, width-starRadius);
    originY = random(starRadius, height-starRadius);
    
    //Draw the star
    drawStar(starRadius, starPoints);
  }
}

void draw()
{
  
}

void drawStar(float r, float p)
{
  
  //Finding the angle that the points increment at
  thetaInc = TWO_PI/(p*2f);
  /*
  //Find the length of the adjacent
  triA = sin(-thetaInc) * (r);
  
  //Find the length of the opposite
  triO = cos(thetaInc) * (r);
      
  //Find the x and y of the first point using the lengths of the opposite and adjacent
  x1 = originX + triA;
  y1 = originY + triO;
  
  //Increment count
  count++;
  */
  
  //Finding the points after each angle increment
  for(theta = 0; theta < TWO_PI; theta += thetaInc)
  {
    //If the current point divides evenly into 2, take the point going to the big circle (Pointy bit)
    if(count%2!=0)
    {
      triA = sin(theta) * r;
      triO = cos(theta) * r;
      
      x1 = originX + triA;
      y1 = originY + triO;
      
      if(count == 1)
      {
        startX = originX + triA;
        startY = originY + triO;
      }
      
      //Draw a line going from the origin of the star to the edge of the big circle
      line(originX, originY, x1, y1);
    }
    else  //Else, take the point going to the inner circle (trough)
    {
      triA = sin(theta) * (r/2);
      triO = cos(theta) * (r/2);
      
      x2 = originX + triA;
      y2 = originY + triO;
      
      //Draw a line going from the origin of the star to the edge of the small circle
      line(originX, originY, x2, y2);
    }
    
    //Draw the line as long as both points are set
    if((x1 > 0 && y1 > 0) && (x2 > 0 && y2 > 0))
    {
      line(x1, y1, x2, y2);
    }
    
    //Increment count
    count++;  
  }
  
  //If the count is odd upon leaving the loop, rejoin the last point back to the start point
  if(count%2!=0)
  {
    line(startX, startY, x2, y2);
  }
}
