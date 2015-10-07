boolean button;

float sqWidth;
float sqHeight;
float x;
float y;
float lowerlimit;
float upperlimit;
float topSpeed;
float percent;

float ballX = random(1,500);
float ballY = random(1,500);
float ballRadius;

float speedX;
float speedY;

void setup()
{
  size(500,500);
  frameRate(144);
  fill(127);
  noStroke();
  button = false;
  percent = 0.3;
  ballRadius = 5;
  ballX = random(1,500);
  ballY = random(1,500);
  sqWidth = width * percent;
  sqHeight = height * percent;
  x = (width - (width * percent))/2;
  y = (height - (height * percent))/2;
  lowerlimit = -1;
  upperlimit = -1;
  topSpeed = 5;
  speedX = topSpeed;
  speedY = topSpeed;
  
}

void draw()
{
  background(0);
  
  if((mouseX > x) && (mouseX < x+sqWidth) && (mouseY > y) && (mouseY < y+sqHeight))
  {
    fill(0,0,255);
    rect(x, y, sqWidth, sqHeight);
  }
  else
  {
    fill(175);
  }
  
  if(button)
  {
    fill(255,0,0);
  }
  
  rect(x, y, sqWidth, sqHeight);
  
  fill(random(256), random(256), random(256));
  ellipse(ballX, ballY, ballRadius*2, ballRadius*2);
  
  if(ballY < ballRadius)
  {
    ballY = ballRadius;
    speedY *= random(lowerlimit,upperlimit);
  }
  
  if(ballX < ballRadius)
  {
    ballX = ballRadius;
    speedX *= random(lowerlimit,upperlimit);
  }
  
  if(ballY > height-ballRadius)
  {
    ballY = ballY-ballRadius;
    speedY *= random(lowerlimit,upperlimit);
  }
  
  if(ballX > width-ballRadius)
  {
    ballX = ballX-ballRadius;
    speedX *= random(lowerlimit,upperlimit);
  }
  
  if(speedX > topSpeed || speedX < -topSpeed)
  {
    speedX /= 2;
  }
  
  if(speedY > topSpeed || speedY < -topSpeed)
  {
    speedY /= 2;
  }
  
  ballX += speedX;
  ballY += speedY;
  
    
}

void mousePressed()
{
  if(mouseX > x && mouseX < x+sqWidth && mouseY > y && mouseY < y+sqHeight)
  {
    button = !button;
  }
}
