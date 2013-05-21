/*********************************************************************************
 Ball Filling Game - Final Project Example
 J. Gerstein
 Spring 2013
 
 //check documentation at github.com/gersteinj/FinalProject2013
 *********************************************************************************/
//create an ArrayList so it's easy to add new GrowBalls
ArrayList fill = new ArrayList();   //create array of 5 bouncers
Bouncer[] bouncers = new Bouncer[5];

void setup() {
  size(500, 500);   
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i] = new Bouncer();
  }
}

void draw() {
  background(0, 5, 20);  
  for (int i = 0; i < bouncers.length; i++) {
    bouncers[i].display();
    bouncers[i].wallCheck();
    for(int j = 0; j < fill.size(); j++){
    GrowBall ball = (GrowBall)fill.get(j);
      bouncers[i].ballCheck(ball);
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
      //check to see if newBall is touching the wall
      newBall.isTouchingWall();
      if (i!=fill.size()-1) {
        //check to see if newBall is touching other balls
        newBall.isTouchingBall(ball);
      } 
      //Grow function only grows if stillAlive==true
      newBall.grow();
    }
  }
}


//Each time I press the mouse, I create a new GrowBall and add it to the ArrayList
void mousePressed() {
  fill.add(new GrowBall());
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
