import processing.video.*;

Movie movieBackground;

Flower[] flowers = new Flower[3]; 

void setup() {
  //size(640, 640);
  fullScreen();
  movieBackground = new Movie(this, "videoloop.mp4");
  movieBackground.loop();
  
  //xpos, ypos, scale, rotatespeed
  //defaults: 0,0, 1, 1

   //initializing flowers  
   for (int i = 0; i < flowers.length; i++ ) {
     flowers[i] = new Flower(width/2, height/2, random(2,3), 1, random(-2,2));
   } 
  
}
 
void draw() {
  fill(0,250);
  rect(0, 0, width, height);
  
  image(movieBackground, 0, 0, width, height);
  
  PVector gravity = new PVector(0,0.1);
  
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