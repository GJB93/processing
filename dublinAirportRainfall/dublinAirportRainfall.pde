void setup()
{
  size(1800, 1000);
  loadData();
  calculateYearlyValues();
  println(maxAvg + " " + minAvg);
  //drawBarChart(yearlyTotal, years, minTotal, maxTotal);
  //drawBarChart(yearlyAverage, years, minAvg, maxAvg);
  drawTrendLine(yearlyAverage, years, minAvg, maxAvg);
}

//Declare an array of float arrays
ArrayList<ArrayList<Float>> data = new ArrayList<ArrayList<Float>>();

//Declare an array of floats for yearly totals and yearly averages
ArrayList<Integer> years = new ArrayList<Integer>();
ArrayList<Float> yearlyTotal = new ArrayList<Float>();
ArrayList<Float> yearlyAverage = new ArrayList<Float>();

int numOfMonths = 12;

//Variables for maximum and minimum values, as well as initial values for these variables
float maxInit=Float.MIN_VALUE, minInit=Float.MAX_VALUE;
float maxTotal = maxInit, minTotal = minInit;
float maxAvg = maxInit, minAvg = minInit;

void drawAxis(float max, float min)
{
  background(0);
  stroke(255);
  fill(255);
  float borderW = width*0.1f; 
  float borderH = height*0.1f;
  float graphW = width - (borderW*2.0f);
  float graphH = height - (borderH*2.0f);
  float tickW = borderW*0.1;
  float textIntW = borderW*0.2;
  float textIntH = borderH*0.35;
  float rectWidth = graphW/ (float)(data.size() - 1);
  float verticalIncrement = data.size()/5;
  float dataRange = max-min;
  float numberInc = dataRange/ verticalIncrement;
  float tickIncrement = graphH/ verticalIncrement;
  
  
  line(borderW, (height-borderH) - graphH, borderW, height-borderH);
  line(borderW, (height-borderH), borderW+graphW, height-borderH);
  
  textAlign(CENTER);
  textSize(8);
  
  for(int i=0; i<data.size(); i+=5)
  {
    line(borderW+(rectWidth*i), (height-borderH)+tickW, borderW+(rectWidth*i), height-borderH);
    text(years.get(i), borderW+(rectWidth*i), (height-borderH)+textIntW);
  }
  
  for(float i=0; i<= verticalIncrement; i++)
  {
    line(borderW, (height-borderH)-(tickIncrement*i), borderW-tickW, (height-borderH)-(tickIncrement*i));
    text((numberInc*i)+min, borderW-textIntH, (height-borderH)-(tickIncrement*i));
  }
}

void drawBarChart(ArrayList<Float> data, ArrayList<Integer> year, float min, float max)
{
  stroke(255);
  fill(0);
  
  float borderW = width*0.1f; 
  float borderH = height*0.1f;
  float graphW = width - (borderW*2.0f);
  float graphH = height - (borderH*2.0f);
  float rectWidth = graphW/ (float)(data.size() - 1);
  
  for(int i=0; i<data.size() - 1; i++)
  {
    float x = map(i, 0, data.size(), borderW, borderW+graphW);
    float y = map(data.get(i), 0, max, height-borderH, (height-borderH) - graphH);
    rect(x, y, rectWidth, (height-borderH)-y);
  }
  
}

void drawTrendLine(ArrayList<Float> data, ArrayList<Integer> year, float min, float max)
{
  stroke(255);
  fill(0);
  drawAxis(maxAvg, minAvg);
  float borderW = width*0.1f; 
  float borderH = height*0.1f;
  float graphW = width - (borderW*2.0f);
  float graphH = height - (borderH*2.0f);
  float rectWidth = graphW/ (float)(data.size() - 1);
  
  for(int i=0; i<data.size() - 1; i++)
  {
    float x1 = map(i, 0, data.size(), borderW, borderW+graphW);
    float y1 = map(data.get(i), min, max, height-borderH, (height-borderH) - graphH);
    float x2 = map(i+1, 0, data.size(), borderW, borderW+graphW);
    float y2 = map(data.get(i+1), min, max, height-borderH, (height-borderH) - graphH);
    line(x1, y1, x2, y2);
  }
  
}

//Method to display relative yearly values to the console
void displayYearlyValues()
{
  int i=1850;
  for(float f:yearlyAverage)
  {
    println("The average for " + i + " is " + f);
    i++;
  }//end for
}//end displayYearlyValues()

//Method to calculate and receive values relevant to yearly rainfall calculation, such as average, total, minimum and maximum
void calculateYearlyValues()
{
  //For each float array
  for(ArrayList<Float> values: data)
  {
    //Reset total to zero
    float total = 0;
    
    //For each value
    for(float f:values)
    {
      //Add to the total yearly value
      total += f;
    }//end for
    
    //Add the total to the yearlyTotal array
    yearlyTotal.add(total);
    
    maxTotal = getMax(total, maxTotal);
    minTotal = getMin(total, minTotal);
    //println("Max: " + maxTotal + ", Min: " + minTotal);
    
    float avg = total/ (float)numOfMonths;
    
    yearlyAverage.add(avg);
    maxAvg = getMax(avg, maxAvg);
    minAvg = getMin(avg, minAvg);
  }
}//end calculateYearlyValues()

float getMax(float num, float currMax)
{
  float temp = currMax;
  if(num > currMax)
  {
    temp = num;
  }
  
  return temp;
}

float getMin(float num, float currMin)
{
  float temp = currMin;
  if(num < currMin)
  {
    temp = num;
  }
  
  return temp;
}

//Method to load the data from a given file
void loadData()
{
  //Load an array of strings with each line of the given file
  String[] lines = loadStrings("Dublin Airport.csv");
  
  //For each line
  for(String s:lines)
  {
    //Split the string at each comma
    String[] elements = s.split(",");
    
    //Declare a float array to hold each monthly rainfall value
    ArrayList<Float> values = new ArrayList<Float>();
    
    //Boolean variable used to check if the first element is being read
    //so that it can be discarded, as the first element is always the
    //year
    boolean first = true;
    
    //For each value/word in the line
    for(String e:elements)
    {
      //If the value read isn't the year
      if(!first)
      {
        //Read the string value as a float, and add it into the float array
        values.add(parseFloat(e));
      }
      else
      {
        years.add(parseInt(e));
        first = false;
      }
    }
    //Once all the values have been read, pass the float array back to our main data array
    data.add(values);
  }
}//end loadData()

void draw()
{
  
}//end draw()
