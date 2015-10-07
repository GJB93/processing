void setup()
{
  size(500, 500);
  frameRate(144);
  cx = width/2.0f;
  cy = height/2.0f;
  toggle = true;
  arms = 6;
}

float cx, cy;
float r;
float smallR;
boolean toggle;
float arms;
float frameOffset = 0;

void draw()
{
  background(0);
  stroke(255);
  fill(255);
  float thetaInc = TWO_PI / arms;
  float offset = 0.1f;
  r = 10;
  smallR = 20;
  for(int cCount = 0; cCount < 800; cCount++)
  {
    for(float theta = 0; theta < TWO_PI; theta += thetaInc)
    {
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
    
      x = cx + sin(theta + offset + frameOffset) * r;
      y = cy - cos(theta + offset + frameOffset) * r;
      
      ellipse(x, y, smallR * 2, smallR * 2);
      
      //theta += 0.2;
      //r += 0.1;
      
    }
    r +=0.5f;
    offset += 1f;
    
  }
  
  frameOffset -= 0.5f;
  
}
