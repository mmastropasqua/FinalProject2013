/********************************************************
Glitchy, but a quick example of adding things at random.
********************************************************/
ArrayList ball = new ArrayList();
void setup() {

  size(300, 300);
}

void draw() {
  background(0);
  int rand = int(random(10));
  println(rand);
  if (rand==0) {
    ball.add(new Ball(random(width), 50, 10, 500));
  }
  for (int i = 0; i < ball.size(); i++) {
    Ball b = (Ball)ball.get(i);
    b.display();
    b.update();
  }
}

