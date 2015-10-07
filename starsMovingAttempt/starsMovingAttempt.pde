float starPoints;
int starCount;
int count;
float x1, y1, x2, y2;
float triO, triA;
float originX, originY;
float starRadius = 50;
float theta = 0;

void setup()
{
  size(700, 700);
  x1 = 0;
  y1 = 0;
  x2 = 0;
  y2 = 0;
  count = 0;
  noFill();
  background(0);
  /*for(int i = 0;i<=starNumber;i++)
  {
    stroke(random(256), random(256), random(256));
    count = 0;
    originX = random(starRadius, width-starRadius);
    originY = random(starRadius, height-starRadius);
    drawStar(random(10, 76), (int) random(4, 10));
  }*/
}

void draw()
{
    stroke(random(256), random(256), random(256));
    count = 0;
    originX = random(starRadius, width-starRadius);
    originY = random(starRadius, height-starRadius);
    if(starCount < 20)
    {
      drawStar(random(10, 76), (int) random(4, 10));
      starCount++;
    }
  
}

void drawStar(float r, float p)
{
  triA = sin(-(TWO_PI/(p*2f))) * (r);
  triO = cos(-(TWO_PI/(p*2f))) * (r);
      
  x1 = originX + triA;
  y1 = originY + triO;
  for(theta = 0; theta <= TWO_PI; theta += TWO_PI/(p*2f))
  {
    if(count%2!=0)
    {
      triA = sin(theta) * r;
      triO = cos(theta) * r;
      
      x1 = originX + triA;
      y1 = originY + triO;
    }
    else
    {
      triA = sin(theta) * (r/2);
      triO = cos(theta) * (r/2);
      
      x2 = originX + triA;
      y2 = originY + triO;
    }
    
    if((x1 !=0 && y1!=0) || (x2 !=0 && y2 != 0))
    {
      line(x1, y1, x2, y2);
    }
    
    count++;
      
  }
}
