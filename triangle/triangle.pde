void setup()
{
  size(600,600);
  triA = 300;
  x1 = 100;
  y1 = height - 100;
  
}

float x1;
float y1;
float triO;
int triA;
float triH;
float triTheta;

void draw()
{
  background(0);
  triO = mouseY;
  triTheta = degrees(atan(triO/triA)); 
  
  triangle(x1, y1, x1+triA, triO, x1+triA, y1);
  text((triTheta + " degrees"), width-100, 10);
  text(("A: " + triA + "m"), width-100, 20);
  text(("O: " + (y1 - mouseY + 100) + "m"), width-100, 30);
}
