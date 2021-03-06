class Flower {  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float scale; 
  float rotatespeed;
  float rotatedegrees;
  int basecolor;
  float basesize;

  //Constructor
  Flower(float x, float y, float mass, float scale, float rotatespeed) {
    this.mass = mass;
    location = new PVector(x, y);
    velocity = new PVector(random(5),random(5));
    acceleration = new PVector(0, 0);
    this.scale = scale;
    this.rotatespeed = rotatespeed;
    rotatedegrees = random(360);
    basecolor = round(random(0,255));
    basesize = 250 * scale;
  }

  void display() {
    pushMatrix();
    scale(scale);
    translate(location.x, location.y);
    rotate(radians(rotatedegrees += rotatespeed) );
    for (int i = 40; i > 0; i-=10) {
      for (int q = 0; q < 360; q+=18) {
        float x = sin(radians(q+i));
        float y = cos(radians(q+i));

        float s = i*3;

        fill(255, 125);
        stroke(255);

        pushMatrix();
        translate(x*i, y*i);
        rotate(radians(-q-i+90));
        beginShape();
        noStroke();
        vertex(0, 0);
        bezierVertex(s, -s/2, s, s/2, 0, 0);
        endShape();
        fill(basecolor, 125+sin(radians(i+frameCount))*125, 146, map(i, 50, 0, 0, 1000));
        beginShape();
        noStroke();
        vertex(0, 0);
        bezierVertex(s, -s/3, s, s/3, 0, 0);
        endShape();
        popMatrix();
      }
    } 
    popMatrix();
  }

  void move() {
    pushMatrix();
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    popMatrix();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void checkEdges() {
    pushMatrix();
    if (location.x > width - basesize/2) {
      location.x = width - basesize/2;
      velocity.x *= -1;
    } else if (location.x < 0 + basesize/2) {
      velocity.x *= -1;
      location.x = 0 + basesize/2;
    }

    if (location.y > height - basesize/2) {
      velocity.y *= -1;
      location.y = height - basesize/2;
    } else if(location.y < 0 + basesize/2){
      velocity.y *= -1;
      location.y = 0 + basesize/2;
    }
    popMatrix();
  }
}