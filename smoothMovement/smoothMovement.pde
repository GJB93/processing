void setup()
{
  size(500,500);
  fill(255,0,0);
  noStroke();
}

float step = 10.0;
float diameter = 10.0;
float X = 10.0;
float Y = 490.0;
boolean flagUp = false;
boolean flagDown = false;
boolean flagRight = false;
boolean flagLeft = false;

void draw()
{
  clear();
  background(255);
  ellipse(X,Y,diameter,diameter);
  move(flagUp,flagDown,flagLeft,flagRight);
}

void keyPressed()
{
  if(key == CODED)
  {
    if (keyCode == UP)
    {
      flagUp = true;
    }
    
    if (keyCode == DOWN)
    {
      flagDown = true;
    }
    
    if (keyCode == LEFT)
    {
      flagLeft = true;
    }
    
    if (keyCode == RIGHT)
    {
      flagRight = true;
    }
  }
      
}

void keyReleased()
{
  if(key == CODED)
  {
    if (keyCode == UP)
    {
      flagUp = false;
    }
    
    if (keyCode == DOWN)
    {
      flagDown = false;
    }
    
    if (keyCode == LEFT)
    {
      flagLeft = false;
    }
    
    if (keyCode == RIGHT)
    {
      flagRight = false;
    }
  }
      
}

void move(boolean f1, boolean f2, boolean f3, boolean f4)
{
  if (f1)
    {
      if((Y-step)>0)
        Y-=step;
      else
        Y+=step;
    }
    
    if (f2)
    {
      if((Y+step)<height)
        Y+=step;
      else
        Y-=step;
    }
    
    if (f3)
    {
      if((X-step)>0)
        X-=step;
      else
        X+=step;
    }
    
    if (f4)
    {
      if((X+step)<width)
        X+=step;
      else
        X-=step;
    }
}
