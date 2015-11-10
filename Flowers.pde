import processing.video.*;
ArrayList<Skull> skulls = new ArrayList<Skull>();
PImage img;

Movie movieBackground;

void setup() {
  size(640, 640);
  //fullScreen();
 
  movieBackground = new Movie(this, "lasaladenacho.mp4");
  movieBackground.loop();
     

}
 
void draw() {
  fill(0,250);
  rect(0, 0, width, height);
  pushMatrix();
  imageMode(CORNERS);
  image(movieBackground, 0, 0, width, height);
  popMatrix();
  //PVector gravity = new PVector(0,0.1);
  
  for(int i=0; i<skulls.size(); i++){
    skulls.get(i).display();
    skulls.get(i).move();
    skulls.get(i).checkEdges();
  }
  
  println(skulls.size());
  
 
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

//create new skull with a mouse click

void mousePressed() {
  
  skulls.add( new Skull(random(width/2), random(height/2), random(2,3), random(80,200), random(-2,2), "GreenSkull.png") );
}