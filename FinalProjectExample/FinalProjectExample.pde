/*********************************************************************************
 Ball Filling Game - Final Project Example
 J. Gerstein
 Spring 2013
 
 //check documentation at github.com/gersteinj/FinalProject2013
 *********************************************************************************/
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

