float theta;
float triA, triO, triH;
float originX, originY;
float y;

void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  
  triO = height/2;
  originX = width/2;
  originY = height/2;
  y = height/2;
}

void draw()
{
  for(int i=0; i <= width;i+=20)
  {
    triA = originX - i;
    triH = sq(triA)+sq(triO);
    line(i, height, i + triA, triO);
  }
  
  for(int i=1;i<height/2;i++)
  {
    y += sq(i);
    line(0, y, width, y);
    //y += i;
  }
}
