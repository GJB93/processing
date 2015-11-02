boolean[] dChoice = new boolean[3];
char[] doors = new char[3];
int correct = int(random(0,3));
float xInc;
float dH;
float yPos;
int choice = -1;
int turn = 0;

void setup()
{
  size(500, 500);
  textAlign(CENTER);
  background(255);
  xInc = width/ (float)dChoice.length;
  dH = height/2;
  yPos = height/4;
  for(int i=0; i<doors.length; i++)
  {
    if(i == correct)
    {
      doors[i] = 'Y';
    }
    else
    {
      doors[i] = 'N';
    }
  }
  drawDoors();
}

void draw()
{
  if(turn == 1)
    drawOpenDoor(correct, choice);
  
  if(turn > 1)
  {  
    if(choice == correct)
    {
      fill(0);
      text("Correct", width/2, height-(height/5));
    }
    else if(choice != correct && choice != -1 && turn == 2)
    {
      fill(0);
      text("Wrong", width/2, height-(height/5));
    }
  }
}

void drawDoors()
{
  int colFillR = 255/dChoice.length;
  int colStrR = 127/dChoice.length;
  for(int i=0; i<dChoice.length; i++)
  {
    int colF = colFillR * i;
    int colS = colStrR * i;
    fill(colF, 0, random(256));
    stroke(colS, 0, random(256));
    rect(xInc*i, yPos, xInc, dH);
  }
}

void drawOpenDoor(int a, int c)
{
  if(a != c)
  {
    for(int i=0; i<dChoice.length; i++)
    {
      if(i != c && doors[i] == 'N')
      {
        stroke(0);
        fill(255);
        rect(xInc*i, yPos, xInc, dH);
      }
    }
  }
  else
  {
    if (a == 0)
    {
      int r = (random(0,1) > 0.5) ? 1 : 2;
      stroke(0);
      fill(255);
      rect(xInc*(a+r), yPos, xInc, dH);
    }
    
    if(a == 1)
    {
      int r = (random(0,1) > 0.5) ? 1 : -1;
      stroke(0);
      fill(255);
      rect(xInc*(a+r), yPos, xInc, dH);
    }
    
    if(a == 2)
    {
      int r = (random(0,1) > 0.5) ? -1 : -2;
      stroke(0);
      fill(255);
      rect(xInc*(a+r), yPos, xInc, dH);
    }
  }
  
}

void mousePressed()
{
  if(mouseX > 0 && mouseX < width && mouseY > yPos && mouseY < yPos + dH)
  {
    int door = int(mouseX/xInc);
    dChoice[door] = !dChoice[door];
    choice = door;
    turn++;
  }
}
