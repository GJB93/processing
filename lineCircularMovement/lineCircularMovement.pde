void setup()
{
  size(500, 500);
  startx = width/2;
  starty = height/2;
}

int startx, starty;
float x, y;
float theta;
int radius = 100;

void draw()
{
  x = width/2 + sin(theta) * radius;
  y = height/2 + cos(theta) * radius;
  
  theta += 0.1f;
  radius++;
  
  stroke(random(256), random(256), random(256));
  line(startx, starty, x, y);
}
