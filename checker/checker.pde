void setup()
{
  //The best line of code you ever write is the line you didn't have to write
  background(255);
  size(600,400);
  fill(255);
  rectMode(CENTER);
}

void draw()
{
  /*Spaceship
  int topLineY = 50;
  int bottomLineY = 80;
  int middleX = 35;
  int middleY = 65;
  
  line(20,topLineY,50,topLineY); //top line 
  line(20,bottomLineY,50,bottomLineY); //bottom line
  line(middleX,middleY,70,50); //Diagonal going up to circle
  line(middleX,middleY,70,80); //Diagonal going down to circle
  line(middleX,50,45,60);
  line(middleX,80,45,70);
  rect(80,65,50,50);*/
  
  // Face
  float diameterMain = 100;
  int radius = 50;
  float halfRadius = 12.5;
  float diameterSmall = 5;
  boolean flag = true;
  
  
  
  
  for(int i=radius;i<=height;i+=diameterMain)
  {
    for(int j=radius;j<=width;j+=diameterMain)
    {
      
      if(flag)
      {
        //smile
        fill(0,127,255);
        stroke(0,127,255);
      }
      else
      {
        //frown
        fill(0,0,127);
        stroke(0,0,127);
      }
      flag = !flag;
      
      rect(j, i, diameterMain, diameterMain); //main circle
    }
    
    flag = !flag;

  }
  
}
  
