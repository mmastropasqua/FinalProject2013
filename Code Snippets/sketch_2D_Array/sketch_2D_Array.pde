//8 columns and rows
//I'm using "w" and "h" in calculating the size instead of making the location x*(width/cols)
int cols = 8;
int rows = 8;
float w;
float h;

//Declaring a 2D array of Cell objects
Cell[][] grid;


void setup() {
  size(500, 500);
  w=width/cols;
  h=height/rows;
  //initialize new grid array
  grid = new Cell[cols][rows];
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      //If I wanted to just create a grid, I could have done something replaced all these if statements with the following line:
      //grid[x][y] = new Cell(x*w, y*h, w, h, color(random(255)));
      if (y%2==0) {
        if (x%2==0) {
          grid[x][y] = new Cell(x*w, y*h, w, h, color(0, 0, 0));
        }
        else {
          grid[x][y] = new Cell(x*w, y*h, w, h, color(255, 0, 0));
        }
      }
      else {
        if (x%2==0) {
          grid[x][y] = new Cell(x*w, y*h, w, h, color(255, 0, 0));
        }
        else {
          grid[x][y] = new Cell(x*w, y*h, w, h, color(0, 0, 0));
        }
      }
    }
  }
}

void draw() {
  //display the grid
  for (int x = 0; x < cols; x++) {
    for (int y = 0; y < rows; y++) {
      grid[x][y].display();
    }
  }
}

class Cell {
  float x;
  float y;
  float w;
  float h;
  color c;

  Cell(float tx, float ty, float tw, float th, color tc) {
    x=tx;
    y=ty;
    w=tw;
    h=th;
    c=tc;
  }
  void display() {
    stroke(0);
    fill(c);
    rect(x, y, w, h);
  }
}

