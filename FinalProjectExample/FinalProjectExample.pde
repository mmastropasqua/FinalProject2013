/*********************************************************************************
 Ball Filling Game - Final Project Example
 J. Gerstein
 Spring 2013
 
 //check documentation at github.com/gersteinj/FinalProject2013
 *********************************************************************************/

/*********************************************************************************
 Here are notes on how I created the GrowBall.  Hopefully the process wil help you as well
 
 *First step in creating the growing ball is going to be making a circle appear and grow when the mouse is pressed
 
 *Once this was tested, I found that the ball followed the mouse, but I wanted it to stay in one place
 *x and y should only be assigned the mouse location at the moment the mouse is pressed
 *I also want d to reset to 0 each time the mouse is pressed
 
 *Once the part above worked, I wanted the ball to stop growing if it touched a wall
 *An if statement telling it only to grow if it's not touching a wall should work
 
 *When all of the above parts worked, I wanted to start adding more than one GrowBall
 *This means multiple x, y, and d variables
 *Now I know the basic concept behind GrowBall works, so I should probably create a class
 *Class + array or ArrayList will let me create multiples easily
 *********************************************************************************/
int x;
int y;
int d;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  //if the mouse is pressed, I want to create an ellipse
  if (mousePressed) {
    //while the mouse is pressed, I'm going to check to see if the ellipse is touching a wall
    //If the ellipse is NOT touching a wall, the diameter increases
    if (x+d/2<width && x-d/2>0 && y+d/2<height && y-d/2>0) {
      d++;
    }
    ellipse(x, y, d, d);
  }
}
//Each time I press the mouse, I reset d to 0 and move x and y to the mouse location
void mousePressed() {
  d=0;
  x=mouseX;
  y=mouseY;
}












/*********************************************************************************
 Everything below this line is from my test of the bouncers
 
 
 //Started with making sure my bouncers work
 
 //create array of 5 bouncers
 Bouncer[] bouncers = new Bouncer[5];
 
 void setup() {
 size(700, 300);
 for (int i = 0; i < bouncers.length; i++) {
 bouncers[i] = new Bouncer();
 }
 }
 void draw() {
 background(0);
 for (int i = 0; i < bouncers.length; i++) {
 bouncers[i].display();
 bouncers[i].bounce();
 }
 }
 *********************************************************************************/
