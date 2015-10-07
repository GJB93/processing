void setup()
{
  String entry = "Hello World";
  //println(fact(5));
  printCharsOnLine(entry);
  println(binaryToDecimal("10011"));
}

int n = 5;
int result;

void draw()
{
  
}

float binaryToDecimal(String binary)
{
  float sum = 0;
  
  for(int i = binary.length()-1; i >= 0; i--)
  {
    int pos = (binary.length() - i) - 1;
    
    if(binary.charAt(i) == '1')
    {
      sum += pow(2, pos);
    }
  }
  return sum;
}

String decimalToBinary(int value)
{
  int counter = 0;
  while(value>1)
  {
    if(value%2 == 0)
    {
      
  }
    
}

void printCharsOnLine(String s)
{
  for(int i=s.length()-1; i >= 0; i--)
  {
    char c = s.charAt(i);
    println(c);
  }
}

/*int fact(int x)
{
  int sum = 1;
  
  for(int i=2; i<=x; i++)
  {
    sum *= i;
  }
  return sum;
}*/
