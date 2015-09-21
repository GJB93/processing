void setup()
{
  size(500, 500);
  
  stroke(255);
  fill(0);
  
  x = width/2;
  y = height/2;
}

float x, y;
int speed = -5;
int xSpeed = speed;
int ySpeed = 0;
int radius = 50;
float bigRadius = 25;
float theta = 0;

void draw()
{
  //background(0);
  fill(random(256), random(256), random(256));
  
  x = width/2 + sin(theta) * bigRadius;
  y = height/2 + cos(theta) * bigRadius;
  
  theta += 0.1f;
  bigRadius += 0.5;
  
  ellipse(x, y, radius*2, radius*2);
  ellipse(x-((radius*2)/5), y-((radius*2)/5), radius/5, radius/5);
  ellipse(x+((radius*2)/5), y-((radius*2)/5), radius/5, radius/5);
  ellipse(x, y, radius/5, radius/5);
  line(x-((radius*2)/5), y+((radius*2)/5), x+((radius*2)/5), y+((radius*2)/5));
  
  /*
  if (x > width - radius)
  {
    xSpeed = 0;
    ySpeed = -speed;
    x = width - radius;
  }
  
  if (y < radius)
  {
    ySpeed = 0;
    xSpeed = -speed;
    y = radius;
  }
  
  if (x < radius)
  {
    xSpeed = 0;
    ySpeed = speed;
    x = radius;
  }
  
  if (y > height - radius)
  {
    ySpeed = 0;
    xSpeed = speed;
    y = height - radius;
  }
  
  x += xSpeed;
  y += ySpeed;
  */
  /*
  if(x <= width && flag == false)
  {
    x += xSpeed;
  }
  else
  {
    flag = true;
  }
  
  if(x >= 0 && flag == true)
  {
    x -= xSpeed;
  }
  else
  {
    flag = false;
  }*/
}
