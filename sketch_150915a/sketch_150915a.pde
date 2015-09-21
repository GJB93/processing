void setup()
{
  background(255);
  size(500,500);
  stroke(255,255,0);
  fill(255);
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
  ellipse(80,65,50,50);*/
  
  // Face
  float diameterMain = 50;
  float halfRadius = 12.5;
  float diameterSmall = 5;
  int flag = 0;
  
  
  
  
  for(int i=25;i<=height;i+=50)
  {
    for(int j=25;j<=width;j+=50)
    {
      ellipse(j,i,diameterMain,diameterMain); //main circle
      ellipse(j-halfRadius,i-halfRadius,diameterSmall,diameterSmall); //right eye
      ellipse(j+halfRadius,i-halfRadius,diameterSmall,diameterSmall); //left eye
      ellipse(j,i,diameterSmall,diameterSmall); //nose
      
      line(j-10,i+halfRadius,j+10,i+halfRadius); //main mouth
      
      if(flag==0)
      {
        //smile
        line(j-10,i+halfRadius,j-halfRadius,i+(halfRadius-2.5)); //right mouth cleft
        line(j+10,i+halfRadius,j+halfRadius,i+(halfRadius-2.5)); //left mouth cleft
        stroke(0,255,255);
        flag = 1;
      }
      else
      {
        //frown
        line(j-10,i+halfRadius,j-halfRadius,i+(halfRadius+2.5)); //right mouth cleft
        line(j+10,i+halfRadius,j+halfRadius,i+(halfRadius+2.5)); //left mouth cleft
        stroke(255,0,0);
        flag=0;
      }
      
    }
  }
  
}
  
