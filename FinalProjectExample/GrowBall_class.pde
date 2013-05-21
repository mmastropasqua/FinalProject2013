class GrowBall {
  float x;
  float y;
  float d;
  boolean stillAlive;

  //Each time I create a GrowBall, diameter is 0 and x and y are the mouse coordinates
  GrowBall() {
    d=0;
    x=mouseX;
    y=mouseY;
    stillAlive=true;
  }
  //Eventually, I'm going to have to separate display and growth, so I may as well do it now
  void display() {
    fill(255);
    stroke(255,0,0);
    ellipse(x, y, d, d);
  }
  //Growing is accomplished by increasing the diameter
  //Only grow if GrowBall is stillAlive
  void grow() {
    //check to see if stillAlive is true before doing growth.
    if (stillAlive==true) {
      d++;
    }
  }
  //I'm going to create a method for checking if the GrowBall touches the wall
  //This way I can use it inside of grow or anywhere else I want it
  //I already figured it out in my initial test of the GrowBall, so copypaste!
  boolean isTouchingWall() {
    if (x+d/2>width || x-d/2<0 || y+d/2>height || y-d/2<0) {
      stillAlive=false;
      return true;
    }
    else {
      return false;
    }
  }
  //Next, I'm going to create a method for checking if the GrowBall touches other GrowBalls
  boolean isTouchingBall(GrowBall b) {
    if (dist(x, y, b.x, b.y)<d/2+b.d/2) {
      //if it's touching, set stillAlive to false
      stillAlive=false;
      return true;
    }
    else {
      return false;
    }
  }
}

