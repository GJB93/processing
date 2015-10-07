int numOfBits = 16;
boolean[] bits = new boolean[numOfBits];
int centX, centY;
int number;
String binary;
int sqInc;
float r, g, b;


void setup()
{
  size(500, 500);
  centX = width / 2;
  centY = height / 2;
  
  //Setting the width/height of the squares depending on the number of bits
  sqInc = width/numOfBits;
}


void draw()
{
  //Setting colours
  r = random(256);
  g = random(256);
  b = random(256);
  //background(0, r, g);
  background(127);
  int c = 0;
  
  //Counting up for each edge
  for(int x=0; x<=width-sqInc; x+=sqInc)
  {
    //If the bit is toggled, set the rectangle to black, and the text to white
    if(bits[c])
    {
      //fill(0,b,g);
      fill(0);
      rect(x, centY, x+sqInc, sqInc);
      //fill(0,g,b);
      fill(255);
      text("1", x+(sqInc/2), centY+(sqInc/2));
    }//end if
    else //Else set the rectangle to white and the text to black
    {
      //fill(0,r,b);
      fill(255);
      rect(x, centY, x+sqInc, sqInc);
      //fill(0,b,r);
      fill(0);
      text("0", x+(sqInc/2), centY+(sqInc/2));
    }//end else
    c++;
  }//end for

  //Calling the binary to decimal converter using the bit array and setting an int variable
  number = binaryToDecimal(bits);
  
  //Calling the decimal to binary converter using the number found to return the value as a string
  binary = decimalToBinary(number);
  
  //Writing the decimal and binary values to the screen
  fill(255);
  text(number, centX, 100);
  text(number + " is " + binary + " in binary.", centX-50, 150);
  
}//end draw

//Function to convert a binary value to decimal
int binaryToDecimal(boolean[] bits)
{
  int ret = 0;

  //For each bit
  for(int i=0; i<numOfBits; i++)
  {
    //Reverse the position number
    int pos = (numOfBits - 1) - i;
    
    //If the bit is true, add the value of 2 to the power of the current position to our return value
    if (bits[i])
    {
      ret += pow(2, pos);
      
      //If the leftmost bit is set, make the value negative
      if(i == 0)
      {
        ret = -ret;
      }//end if
    }//end if   
  }//End for

  //Return the calculated value
  return ret;
}//End binaryToDecimal

//Function to convert a given integer value to a binary value
String decimalToBinary(int number)
{
  //Initialise the string and the local number variable
  String a = "";
  int value = number;
  
  if(value >= 0)
  {
    
    while(value>=1)
    {
      //If mod 2 of the value is 0, add a 0 to the left side of the string
      if(value%2==0)
      {
        a = "0" + a;
      }//end if
      else //Else add a 1 to the left side of the string
      {
        a = "1" + a;
      }//end else
      
      //Divide the value by two
      value = value/2;
    }//end while
  }//end if
  else
  {
    //Set the negative value to be the relative unsigned value
    value = 65536 + value;
    while(value>=1)
    {
      if(value%2==0)
      {
        a = "0" + a;
      }//end if
      else
      {
        a = "1" + a;
      }//end else
      value = value/2;
    }//end while
  }//end else
  return a;
}//end decimalToBinary

void mousePressed()
{
  int c = 0;
  
  //For each square
  for(int i=0; i<width-sqInc; i+= sqInc)
  {
    //If the mouse is within the boundary of a specific square, toggle the relative bit
    if(mouseX > i && mouseX < i+sqInc && mouseY > centY && mouseY < centY + sqInc)
    {
      bits[c] = !bits[c];
    }//end if
    //Increment the counter
    c++;
  }//end for
   
}//end mousePressed
