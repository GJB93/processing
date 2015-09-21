void setup()
{
  size(500,500);
  fill(255,0,0);
  noStroke();
}

float step = 10.0;
float X = 10.0;
float Y = 490.0;
float flagUp = 0;
float flagDown = 0;
float flagRight = 0;
float flagLeft = 0;
float chance = 0;

void draw()
{
  clear();
  background(255);
  ellipse(X,Y,5.0,5.0);
  chance = random(101);
  if (chance < 10.0)
  {
    flagUp = random(2);
    flagDown = random(2);
    flagLeft = random(2);
    flagRight = random(2);
  }
  move(flagUp,flagDown,flagLeft,flagRight);
}

void keyPressed()
{
  if(key == CODED)
  {
    if (keyCode == UP)
    {
      flagUp = 1;
    }
    
    if (keyCode == DOWN)
    {
      flagDown = 1;
    }
    
    if (keyCode == LEFT)
    {
      flagLeft = 1;
    }
    
    if (keyCode == RIGHT)
    {
      flagRight = 1;
    }
  }
      
}

void keyReleased()
{
  if(key == CODED)
  {
    if (keyCode == UP)
    {
      flagUp = 0;
    }
    
    if (keyCode == DOWN)
    {
      flagDown = 0;
    }
    
    if (keyCode == LEFT)
    {
      flagLeft = 0;
    }
    
    if (keyCode == RIGHT)
    {
      flagRight = 0;
    }
  }
      
}

void move(float f1, float f2, float f3, float f4)
{
  if (flagUp>=0.5)
    {
      if((Y-step)>0)
        Y-=step;
      else
        Y=height-10;
    }
    
    if (flagDown>=0.5)
    {
      if((Y+step)<height)
        Y+=step;
      else
        Y=10;
    }
    
    if (flagLeft>=0.5)
    {
      if((X-step)>0)
        X-=step;
      else
        X=width-10;
    }
    
    if (flagRight>=0.5)
    {
      if((X+step)<width)
        X+=step;
      else
        X=10;
    }
}
