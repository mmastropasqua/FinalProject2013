/*********************************************************************************
 Ball Filling Game - Final Project Example
 J. Gerstein
 Spring 2013
 
 //check documentation at github.com/gersteinj/FinalProject2013
 *********************************************************************************/

GrowBall b;
void setup() {
  size(500, 500);
  b=new GrowBall();
}

void draw() {
  background(0,5,20);
  //display the GrowBall
  b.display();
  if (mousePressed) {
    //while the mouse is pressed, GrowBall grows
    b.grow();
  }
}

//When I tried running it, I found that because the growBall was created in setup, x,y is 0,0
//Each time I press the mouse, I'm going to reset GrowBall's x and y to mouseX,mouseY
//Later, the GrowBall will only be created when I click, so this issue will go away
//I also reset d to 0.  Later, each click will create a new GrowBall so this issue will disappear
void mousePressed() {
  b.x=mouseX;
  b.y=mouseY;
  b.d=0;
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
