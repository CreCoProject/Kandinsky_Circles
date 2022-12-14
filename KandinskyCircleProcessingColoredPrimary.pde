// Intialise the Application
void setup()
{
  // Set the Size for the Canvas
  size(300, 500);
}

// Draw a Circle and may be there inner Circles
void drawCircles(int x, int y, int z, int j)
{
  // Chose a Braigthness
  int braightness = int(random(255));
  
  // Chose the Color
  int colorrandom = int(random(4));
  // Set the Colors in respect to the Color-Number
  switch(colorrandom)
  {
    // Set Color to Read
    case 0: fill(255, 0, 0, braightness); break;
    // Set Color to Green
    case 1: fill(0, 255, 0, braightness); break;
    // Set Color to Yellow
    case 2: fill(255, 255, 0, braightness); break;
    // Set Color to Blue
    case 3: fill(0, 0, 255, braightness); break;
  }
  // Draw a Circle at the given Position
  circle(x, y, z);
  
  // Checks is maximal Recursivity is given
  if(j < 4 )
  {
    // Increament the actual given Recursivity deep
    int jj = j + 1;
    
    // Chose a number of inner Circles
    int n = int(random(4));
    // Iterrates about needed inner Circles
    for( int nn = 0; nn < n; nn++)
    {
      // Sets a random Diameter lesser then the master Circle
      int r = int(random(z));
      
      // Calculate possible min and max Values for the Y Coordinate
      // of the actual inner Circle
      int ymin = y - (z/2) + (r/2);
      int ymax = y + (z/2) - (r/2);
      // Chose a Y Coordinate for the actual inner Circle
      int yc = int(random( ymax - ymin))+ymin;
      
      // Calculates the possible X Coordinate
      // firstly calculate the width of the Circle
      int xdis = int(pow( (pow((float(z)/2), 2) - pow(float(yc-y), 2)), 0.5));
      // then Calculate the absolute possible X Coordinates
      int xmin = x - xdis + (r/2);
      int xmax = x + xdis - (r/2);
      int xc = int(random( xmax - xmin))+xmin;
      
      // Call the Draw Circles Method for inner Circles
      drawCircles(xc, yc, r, jj);
    }
  }
}

// Method to generate the Image
void generate()
{
  // Clear and set the Background to Withe
  background(255);
  
  // Declares Memory for Diameter of absolute master Circles
  int r;
  
  // Declares Memory for X and Y Coordinates of absolute master Circles
  int x, y;
  // Declares Helper Memory for between invoice
  int xmin, xmax;
  int ymin, ymax;
  
  // Choen a Number of absolute Master Circles
  int n = int(random(3))+1;
  // Iterate about Number of absolute Master Circles
  for(int nn = 0; nn < n; nn++)
  {
    // Choose a Diameter for the actual absolute master Circle
    r = int(random(200));
    // Calculate minimimal Position with X and Y Coordinates
    xmin = r + 10;
    ymin = r + 10;
    
    // Calculate maximal Position with X and Y Coordinates
    xmax = width-r-10;
    ymax = height-r-10;
    
    // Choose a Point for the Center of the actual Point
    // from previously Calculated Boundaries
    x = int(random(xmax-xmin))+xmin;
    y = int(random(ymax-ymin))+ymin;
    
    // Call the Draw Circles Method for actual Point
    drawCircles(x, y, r, 1);
  }
}

// empty draw Method for Compatibilty with KeyPressed Method
void draw()
{
}

// Key Pressed Method
void keyPressed()
{
  // Memorize actual pressed key
  char k = key;
  // Is n pressed generate a new Image
  if(k == 'n')
  {
    generate();
  }
  // if s is pressed save Image
  if(k == 's')
  {
    save("KandinskyCirclesProcessingColored.png");
  }
}
