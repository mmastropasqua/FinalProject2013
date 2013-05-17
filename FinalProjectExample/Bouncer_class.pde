//Bouncer class is recycled from a previous program and renamed for clarity
//Additions may have to be made later to make it interact with the GrowBall class

class Bouncer {
  int x;
  int y;
  int d;
  int xspeed;
  int yspeed;

  Bouncer() {
    d=10;
    x=int(random(d, width-d));
    y=int(random(d, height-d));
    //later, improve this so the bouncers don't all go the same way
    xspeed=1;
    yspeed=1;
  }

  void display() {
    fill(0, 255, 150);
    ellipse(x, y, d, d);
  }

  void bounce() {
    x+=xspeed;
    y+=yspeed;
    //If the ball hits an edge, the speed changes directions
    //I'm using the absolute value so the bouncers don't get stuck on an edge
    //If the ball is touching the right edge, the ball will ALWAYS start to move to the left
    if (x+d/2>=width) {
      xspeed=-abs(xspeed);
    }
    if (x-d/2<=0) {
      xspeed=abs(xspeed);
    }
    if (y+d/2>=height) {
      yspeed=-abs(yspeed);
    }
    if (y-d/2<=0) {
      yspeed=abs(yspeed);
    }
  }
}

