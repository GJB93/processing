void setup()
{
  size(w, h);
  sqS = width/sqNo;
}

int sqNo = 20;
int h = 1000;
int w = 1000;
boolean[][] leds = new boolean[sqNo][sqNo];
int sqS;

void draw()
{
  int c = 0;
  int d = 0;
  for(int y=0; y<=height-sqS; y+=sqS)
  {
    c = 0;
    for(int x=0; x<=width-sqS; x+=sqS)
    {
      if(leds[d][c])
      {
        fill(0);
        stroke(255);
        rect(x, y, sqS, sqS);
      }
      else
      {
        fill(255);
        stroke(0);
        rect(x, y, sqS, sqS);
      }
      c++;
    }
    d++;
  }
}

void mouseDragged()
{
  int c = 0;
  int d = 0;
  
  //For each square
  for(int y=0; y<=height-sqS; y+=sqS)
  {
    c = 0;
    for(int x=0; x<=width-sqS; x+=sqS)
    {
      //If the mouse is within the boundary of a specific square, toggle the relative bit
      if(mouseX > x && mouseX < x+sqS && mouseY > y && mouseY < y + sqS)
      {
        leds[d][c] = true;
      }//end if
      //Increment the counter
      c++;
    }
    d++;
  }//end for
   
}//end mousePressed

void mousePressed()
{
  int c = 0;
  int d = 0;
  
  //For each square
  for(int y=0; y<=height-sqS; y+=sqS)
  {
    c = 0;
    for(int x=0; x<=width-sqS; x+=sqS)
    {
      //If the mouse is within the boundary of a specific square, toggle the relative bit
      if(mouseX > x && mouseX < x+sqS && mouseY > y && mouseY < y + sqS)
      {
        leds[d][c] = false;
      }//end if
      //Increment the counter
      c++;
    }
    d++;
  }//end for
   
}//end mousePressed
