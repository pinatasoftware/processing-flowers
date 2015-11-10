import processing.video.*;
PImage img;

Movie movieBackground;

Skull[] skulls = new Skull[5];
Flower[] flowers = new Flower[2];

void setup() {
  size(640, 640);
  //fullScreen();
  movieBackground = new Movie(this, "lasaladenacho.mp4");
  movieBackground.loop();
     
    //initializing skulls  
   for (int i = 0; i < skulls.length; i++ ) {
     skulls[i] = new Skull(random(width/2), random(height/2), random(2,3), random(80,200), random(-2,2), "GreenSkull.png");
   } 
   
   for (int i = 0; i < flowers.length; i++ ) {
     flowers[i] = new Flower(random(width/2), random(height/2), random(2,3), 1, random(-2,2));
   } 
   
   
   
   
  
}
 
void draw() {
  fill(0,250);
  rect(0, 0, width, height);
  
  image(movieBackground, 0, 0, width, height);
  
  fill(255,0,0);
  
  PVector gravity = new PVector(0,0.1);
   
   for (int i = 0; i < skulls.length; i++) {
     skulls[i].display();
     skulls[i].move();
     //flowers[i].applyForce(gravity);
     skulls[i].checkEdges();
   }
   
    for (int i = 0; i < flowers.length; i++) {
     flowers[i].display();
     flowers[i].move();
     //flowers[i].applyForce(gravity);
     flowers[i].checkEdges();
   }
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}