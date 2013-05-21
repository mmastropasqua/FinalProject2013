/*********************************************************************************
 Ball Filling Game - Final Project Example
 J. Gerstein
 Spring 2013
 
 //check documentation at github.com/gersteinj/FinalProject2013
 *********************************************************************************/
//create an ArrayList so it's easy to add new GrowBalls
ArrayList fill = new ArrayList();

void setup() {
  size(500, 500);
}

void draw() {
  background(0, 5, 20);
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
        //I'm leaving this in to for error checking for now
        if (newBall.isTouchingBall(ball)) {
          print("TOUCH");
        }
        else {
          print(".");
        }
      }        
      //I'm leaving this in to for error checking for now
      if (newBall.isTouchingWall()) {
        print("WALL");
      }
      else {
        print("<>");
      }
      newBall.grow();
    }    


    //Testing out my touch function
    //Added if statement so I don't have the newest ball checking for intersections with itself
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
