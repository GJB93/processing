void setup()
{
  size(600,600);
  px = 100;
  py = height - 100;
  
}

float px;
float py;
float triO;
float triA;
float triH;
float theta;

void draw()
{
  background(0);
  stroke(255);
  
  if(mouseY < py && mouseX > px)
  {
    triO = mouseY;
    triA = mouseX;
    triH = sqrt((mouseX*mouseX) + (mouseY*mouseY));
    line(px, py, triA, py);
    line(triA, py, triA, triO);
    line(px, py, triA, triO);
  }
  
  text(("A: " + (triA - 100) + "m"), width-100, 20);
  text(("O: " + (py - triO) + "m"), width-100, 30);
  text(("H: " + triH + "m"), width-100, 40);
  
}
