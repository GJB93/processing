void setup()
{
  size(500,500,P3D);
  fill(255);
  stroke(0,255,0);
}

float step = 10.0;
float X = 0;
float Y = 0;
float Z=0;
float r = random(256);
float g = random(256);
float b = random(256);
float xStart = 250;
float yStart = 250;
float zStart = 0.0;
float xMove = 0;
float yMove = 0;
float zMove = 0;
boolean flagUp = false;
boolean flagDown = false;
boolean flagRight = false;
boolean flagLeft = false;
boolean flagIn = false;
boolean flagOut = false;

void draw()
{
  clear();
  
  r = random(256);
  g = random(256);
  b = random(256);
  
  

  background(127);
  directionalLight(r,g,b, 500,500,500);
  camera(X,Y,Z,250.0,250.0,0.0,0.0,1.0,0.0);
  if(xStart<500)
    xStart+=random(11);
  translate(xStart, yStart,0);
  sphere(100);
  /*
  //x
  stroke(255,0,0);
  line(-70,0,0,70,0,0);
  //y
  stroke(0,255,0);
  line(0,-70,0,0,70,0);
  //z
  stroke(0,0,255);
  line(0,0,-70,0,0,70);*/
  
  stroke(0);
  
  move(flagUp,flagDown,flagLeft,flagRight, flagIn, flagOut);
  
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
  
  if (key == 'w')
  {
    flagIn = true;
  }
  
  if (key == 's')
  {
    flagOut = true;
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
  
  if (key == 'w')
  {
    flagIn = false;
  }
  
  if (key == 's')
  {
    flagOut = false;
  }
      
}

void move(boolean f1, boolean f2, boolean f3, boolean f4, boolean f5, boolean f6)
{
  if (f1)
    {
      if((Y-step)>0)
        Y-=step;
      else
        Y=0;
    }
    
    if (f2)
    {
      if((Y+step)<height)
        Y+=step;
      else
        Y=height;
    }
   
    if (f3)
    {
      if((X-step)>0)
        X-=step;
      else
        X=0;
    }
    
    if (f4)
    {
      if((X+step)<width)
        X+=step;
      else
        X=width;
    }
    
    if (f5)
    {
      if((Z+step)<500.0)
        Z+=step;
      else
        Z=500;
    }
    
    if (f6)
    {
      if((Z-step)>-500.0)
        Z-=step;
      else
        Z = -500;
    }
}
