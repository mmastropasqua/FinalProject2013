/*********************************************************************************
 Ball Filling Game - Final Project Example
 J. Gerstein
 Spring 2013
 
 //check documentation at github.com/gersteinj/FinalProject2013
 *********************************************************************************/
//create an ArrayList so it's easy to add new GrowBalls
ArrayList fill = new ArrayList();   //create array of 5 bouncers
Bouncer[] bouncers = new Bouncer[5];
int lives = 20;

int area;
int whitePixels=0;
int threshold;

void setup() {
  size(500, 500);
  //Calculate area of display
  area=width*height;
  threshold=int(area*.6);  
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i] = new Bouncer();
  }
}

void draw() {
  background(0, 5, 20);

  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i].display();
    bouncers[i].wallCheck();
    for (int j = 0; j < fill.size(); j++) {
      GrowBall ball = (GrowBall)fill.get(j);
      //Made this into an if statement to decrease lives
      //May eventually split the bouncing and life checking into two methods for clarity
      if (bouncers[i].ballCheck(ball)) {
        lives--;
      }
    }
    bouncers[i].move();
  }
  //Here, I'm going to want to display all the GrowBalls, but only grow the newest
  //Use the for loop to display all the balls
  for (int i = 0; i < fill.size(); i++) {
    GrowBall ball = (GrowBall)fill.get(i);
    ball.display();
    if (mousePressed) {
      //If the mouse is pressed, create newBall, which retrieves the final object in the fill ArrayList
      //Grow the new ball
      GrowBall newBall = (GrowBall)fill.get(fill.size()-1);
      if (i!=fill.size()-1) {
        //check to see if newBall is touching other balls
        newBall.isTouchingBall(ball);
      }
    }
  }
  //pulled newBall.grow() out of the for loop to slow it down and fix the problem of overlapping borders
  if (mousePressed) {
    GrowBall newBall = (GrowBall)fill.get(fill.size()-1);
    //check to see if newBall is touching the wall
    newBall.isTouchingWall();
    newBall.grow();
  }
  fill(0, 0, 255);
  textSize(50);
  text("lives: " + lives, 50, height-50);
}


//Each time I press the mouse, I create a new GrowBall and add it to the ArrayList
void mousePressed() {
  fill.add(new GrowBall());
}

void mouseReleased() {
  //The next two lines set the stillAlive variable of the newest GrowBall to false when mouse is released
  //This fixes the problem of balls getting hit and causing a loss of life when no longer actually growing
  GrowBall newBall = (GrowBall)fill.get(fill.size()-1);
  newBall.stillAlive=false;
  loadPixels();
  whitePixels=0;
  for (int i = 0; i < pixels.length; i++) {
    if (pixels[i] == color(255)) {
      whitePixels++;
    }
  }

  println("\narea to fill: " + area + "\nwhite pixels: " + whitePixels + "\nneeded to advance: " + threshold);
  if (whitePixels>threshold) {
    println("WINNER");
  }
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
