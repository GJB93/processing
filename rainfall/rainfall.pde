void setup()
{
  size(700, 700);
  background(0, random(127, 255), random(127,255));
  stroke(255);
  
  color[] colours = new color[months.length];
  float ratio;
  float colourRat;
  
  ratio = height/ (float)rainfall[maximum(rainfall)];
  colourRat = 127/rainfall[maximum(rainfall)];
  xInc = width/ (float)rainfall.length;
  lastY = height-rainfall[0];
  
  for(int i=0;i<colours.length;i++)
  {
    colours[i] = color(0, 2*(rainfall[i]*colourRat), rainfall[i]*colourRat);
  }
  
  /*
  for(int i=1;i<rainfall.length; i++)
  {
    line(lastX, lastY, lastX+xInc, height-rainfall[i]);
    lastX += xInc;
    lastY = height-rainfall[i];
  }
  */
  
  for(int i=0;i<rainfall.length; i++)
  {
    fill(colours[i]);
    stroke(colours[i]);
    rect(i*xInc, height, xInc, -(ratio*rainfall[i]));
    translate(i*xInc+(xInc/2), height-10);
    rotate(-PI/2);
    fill(255);
    text(months[i], 0, 0);
    rotate(PI/2);
    translate(-(i*xInc+(xInc/2)), -(height-10));
  }
  
  stroke(0);
  line(0, height-(ratio*avg(rainfall)), width, height-(ratio*avg(rainfall)));
  
  println(sum(rainfall));
  println("The minumum rain fall of: " + rainfall[minimum(rainfall)] + " was recorded in " + months[minimum(rainfall)]);
  println("The maximum rain fall of: " + rainfall[maximum(rainfall)] + " was recorded in " + months[maximum(rainfall)]);
  println("The average rainfall is " + avg(rainfall));
  
  /*
  Iterates over every element of the array
  for(float r:rainfall)
  {
    println(r);
  }
  */
}

//Arrays are bound-checked in Java
//They are objects, which have fields and methods associated with them
float[] rainfall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"January", "February", "March", "April", "May", "June", "July", "August",
                      "September", "October", "November", "December"};
float lastX=0, lastY, xInc;

void draw()
{
  
}

float sum(float[] rain)
{
  float s = 0;
  for(int i=0; i<rain.length; i++)
  {
    s += rain[i];
  }
  
  return s;
}

int minimum(float[] rain)
{
  int ind = 0;
  
  for(int i=1; i<rain.length; i++)
  {
    if(rain[i]<rain[ind])
    {
      ind = i;
    }
  }
  
  return ind;
  
}

int maximum(float[] rain)
{
  int ind = 0;
  
  for(int i=1; i<rain.length; i++)
  {
    if(rain[i]>rain[ind])
    {
      ind = i;
    }
  }
  
  return ind;
}

float avg(float[] rain)
{
  return sum(rain)/ (float) rain.length;
}
