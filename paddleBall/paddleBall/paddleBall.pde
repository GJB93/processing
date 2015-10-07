float ballRadius = 5;
float startX;
float startY;
float ballX;
float ballY;
float paddleWidth = 50;
float paddleHeight = 5;
float paddleX;
float paddleY;
float paddleCentre;
float paddleHit;
float reverse;
int frames = 60;
boolean flagLeft = false;
boolean flagRight = false;

float xSpeed = 3;
int ySpeed = 3;
int paddleSpeed = 5;
float gravity = 0.1;

void setup()
{
  size(200,200);
  frameRate(frames);
  
  //Default start for paddle X and Y
  paddleY = height - 10;
  paddleX = 75;
  
  //Debug X, 40 to 50 isn't working, 55 to 65 is choppy, 70 is a default middle paddle hit
  //paddleX = 50;
  
  //Default start X and Y for ball
  startX = width/2;
  startY = height/2;
  
  //Start X and Y for ball to test bug
  //startX = 127;
  //startY = 165;
  
  
  ballX = startX;
  ballY = startY;
  
  //length of the paddle edges that reverse the direction
  reverse = 10;
}

void draw()
{
  background(255);
  
  //Setting the fill and dimensions for the ball
  fill(255,0,0);
  noStroke();
  ellipse(ballX,ballY,ballRadius*2,ballRadius*2);
  
  //Setting fill and dimensions for the paddle
  fill(0,0,255);
  rect(paddleX, paddleY, paddleWidth, paddleHeight);
  
  //Colour and dimensions for the edges of the paddle that reverse the direction of the ball
  //fill(0,255,0);
  //rect(paddleX, paddleY, reverse, paddleHeight);
  //rect(paddleX+(paddleWidth-reverse), paddleY, reverse, paddleHeight);
  
  //Calling the movement function
  move(flagLeft,flagRight);
  
  //If the ball hits the top edge of the screen, invert ySpeed
  if(ballY < ballRadius)
  {
    ballY = ballRadius;
    ySpeed = -ySpeed;
  }
  
  //If the ball hits the left edge of the screen, invert xSpeed
  if(ballX < ballRadius)
  {
    ballX = ballRadius;
    xSpeed = -xSpeed;
  }
  
  //If the ball hits the right edge of the screen, invert xSpeed
  if(ballX > width-ballRadius)
  {
    ballX = ballX-ballRadius;
    xSpeed = -xSpeed;
  }
  
  //If the ball hits the left edge of the paddle, and the ball is travelling right, invert both the xSpeed and the ySpeed
  if(ballY > (paddleY-ballRadius) && ballY < (paddleY+paddleHeight+ballRadius) && xSpeed > 0)
  {
    if(ballX > paddleX-ballRadius && ballX < paddleX+ballRadius+reverse)
    {
      ballX = ballX - ballRadius;
      ballY = ballY - ballRadius;
      xSpeed = -xSpeed;
      ySpeed = -ySpeed;
    }
  }
  
  //If the ball hits the right edge of the paddle, and the ball is travelling left, invert both the xSpeed and the ySpeed
  if(ballY > (paddleY-ballRadius) && ballY < (paddleY+paddleHeight+ballRadius) && xSpeed < 0)
  {
    if(ballX > paddleX+paddleWidth-reverse-ballRadius && ballX < paddleX+paddleWidth+ballRadius)
    {
      ballX = ballX + ballRadius;
      ballY = ballY - ballRadius;
      xSpeed = -xSpeed;
      ySpeed = -ySpeed;
    }
  }
  
  //If the ball hits the paddle, invert the ySpeed
  if(ballY > (paddleY-ballRadius) && ballY < (paddleY+paddleHeight+ballRadius))
  {
    if(ballX > paddleX-ballRadius && ballX < paddleX+paddleWidth+ballRadius)
    {
      ySpeed = -ySpeed;
    }
  }
  
  //If the ball goes off the bottom of the screen, respawn the ball at it's starting location
  if (ballY > height+ballRadius)
  {
    ballX = startX;
    ballY = startY;
    xSpeed = 3;
    ySpeed = 3;
  }
  
  //Increasing X and Y according to their relative speed
  ballX += xSpeed;
  ballY += ySpeed;
  
  println("Paddle: (" + paddleX +", " + paddleY + ")" + "    Ball: (" + ballX +", " + ballY + ")");
}

void keyPressed()
{
  if(key == CODED)
  {
    //If left arrow is pressed, set flag
    if(keyCode == LEFT)
    {
      flagLeft = true;
    }
    
    //If right arrow is pressed, set flag
    if(keyCode == RIGHT)
    {
      flagRight = true;
    }
  }
}

void keyReleased()
{
  if(key == CODED)
  {
    //If left arrow is released, unset flag
    if(keyCode == LEFT)
    {
      flagLeft = false;
    }
    
    //If right arrow is released, unset flag
    if(keyCode == RIGHT)
    {
      flagRight = false;
    }
  }
}

void move(boolean f1, boolean f2)
{
  //If flagLeft is set, move the paddle left as long as it isn't going off screen
  if (f1)
    {
      if((paddleX-paddleSpeed)>-paddleSpeed)
        paddleX-=paddleSpeed;
    }
  
  //If flagRight is set, move the paddle right as long as it isn't going off screen  
  if (f2)
  {
    if(((paddleX+paddleWidth)+paddleSpeed)<width+paddleSpeed)
      paddleX+=paddleSpeed;
  }
}
    
