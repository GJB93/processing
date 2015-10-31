float theta;
float triH;
float triO;
float triA;
float originX;
float originY;

void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  triO = height - (height/2);
  originY = height/2;
  originX = width/2;
  line(0, height/2, width, height/2);
  for(float i = 0; i<=originY/10;i+=1)
  {
    line(0, sq(i)+(height/2), width, sq(i)+(height/2));
  }
}

void draw()
{
  for(int i = 0;i <= width; i+=(width/50))
 {
   triA = originX - i;
   theta = atan(radians(triO/triA));
   triH = sqrt(sq(triO)+sq(triA));
   line(i, height, i + triA, height/2);
 } 
}
