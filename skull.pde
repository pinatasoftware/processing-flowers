class Skull {
  //vars
  PImage img;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size; 
  float rotatespeed;
  float rotatedegrees;
  int basecolor;
  String filename;
  
  //Constructor
  Skull(float x, float y, float mass, float size, float rotatespeed, String filename) {
    this.mass = mass;
    location = new PVector(x, y);
    velocity = new PVector(random(5),random(5));
    acceleration = new PVector(0, 0);
    this.rotatespeed = rotatespeed;
    rotatedegrees = random(360);
    basecolor = round(random(0,255));
    this.size = size;
    this.filename = filename;
    img = loadImage(filename);

  }
  
  //displaying skull image
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(rotatedegrees += rotatespeed) );
    imageMode(CENTER);
    image(img, 0, 0, size, size);
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
      if (location.x > width) {
        location.x = width;
        velocity.x *= -1;
      } else if (location.x < 0) {
        velocity.x *= -1;
        location.x = 0;
      }
      
      if (location.y > height) {
        velocity.y *= -1;
        location.y = height;
      } else if(location.y < 0){
        velocity.y *= 1;
        location.y = 0;
      }
    }
  
  
  
}