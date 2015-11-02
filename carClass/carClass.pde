Car myCar;

void setup()
{
  size(200, 200);
  
  myCar = new Car();
}

void draw()
{
  background(0);
  
  myCar.move();
  myCar.display();
}

