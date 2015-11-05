Flower[] flowers = new Flower[3]; 

void setup() {
  //size(640, 640);
  fullScreen();
  //xpos, ypos, scale, rotatespeed
  //defaults: 0,0, 1, 1

   //initializing flowers  
   for (int i = 0; i < flowers.length; i++ ) {
     flowers[i] = new Flower(random(width/2),random(height/2),random(1,2.25), random(-3,3));
   } 
  
}
 
void draw() {
  background(20);  
   for (int i = 0; i < flowers.length; i++) {
     flowers[i].display();
   } 
}