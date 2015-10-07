void setup()
{
  size(500, 500);
  cx = width/2.0f;
  cy = height/2.0f;
  r = 10;
  toggle = true;
  arms = 8;
  smallR = 10;
  theta = 0.0f;
}

float cx, cy;
float r;
float smallR;
boolean toggle;
int arms;
float theta;

void draw()
{
  //background(0);
  if(toggle)
  {
    stroke(255);
    fill(255);
    toggle = !toggle;
  }
  else
  {
    stroke(0);
    fill(0);
    toggle = !toggle;
  }
  float x, y;

  x = cx + sin(theta) * r;
  y = cy - cos(theta) * r;
  
  ellipse(x, y, smallR * 2, smallR * 2);
  
  theta += 0.2;
  r += 0.1;
  
}
