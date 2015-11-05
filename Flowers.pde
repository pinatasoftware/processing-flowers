Flower[] flowers = new Flower[6]; 

void setup() {
  //size(640, 640);
  fullScreen();
  //xpos, ypos, scale, rotatespeed
  //defaults: 0,0, 1, 1

   //initializing flowers  
   for (int i = 0; i < flowers.length; i++ ) {
     flowers[i] = new Flower(random(width), height/2, random(2,3), 1, random(-2,2));
   } 
  
}
 
void draw() {
  fill(0,255);
  rect(0, 0, width, height);
  
  PVector gravity = new PVector(0,0.1);
  
   for (int i = 0; i < flowers.length; i++) {
     flowers[i].display();
     flowers[i].move();
     flowers[i].applyForce(gravity);
     flowers[i].checkEdges();
   } 
}