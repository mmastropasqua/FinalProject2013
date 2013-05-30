class Ball {
  float x;
  float y;
  float speed; 
  float w;
  float grav = .1;
  float life;
  float l;
  float lifeMax;

  Ball(float tx, float ty, float tw, float tlife) {
    x=tx;
    y=ty;
    w=tw;
    speed=0;
    life=tlife;
    lifeMax = life;
  }

  void display() {
    noStroke();
    l=map(life, 0, lifeMax, 0, 255);
    fill(0,100,255, l);
    ellipse(x, y, w, w);
  }

  void update() {
    y=y+speed;
    speed = speed+grav;
    if (y+w/2>height) {
      speed*=-0.95;
    }
    life--;
    if (life<=0) {
      w=random(10, 50);    
      x=random(width);
      y=random(w/2, 50);
      life=random(128, 800);
    }
  }
}

