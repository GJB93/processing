float x1;
float y1;
float x2;
float y2;

void setup()
{
  size(500,500);
}

void draw()
{
  line(x1, y1, x2, y2);
}

void mousePressed()
{
  x1 = pmouseX;
  y1 = pmouseY;
}

void mouseReleased()
{
  x2 = mouseX;
  y2 = mouseY;
}
