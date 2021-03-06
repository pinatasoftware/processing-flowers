import processing.video.*;
PFont font;
PImage img; //for skull
PImage imgBackground; //for frame
PImage imgBackgroundColors; //for opacity colors
ArrayList<Skull> skulls = new ArrayList<Skull>(); //skulls array list

Movie movieBackground;

void setup() {
  size(640, 640);
  //fullScreen();
  imgBackground = loadImage("backgroundwhite.png");
  imgBackgroundColors = loadImage("skullbackground.png");
  movieBackground = new Movie(this, "videoBackground00.mov");
  movieBackground.loop();
  font = loadFont("BebasNeueBold.vlw");
  textFont(font, 32);
}
 
void draw() {
  fill(0,250);
  rect(0, 0, width, height);
  //VIDEO
  pushMatrix();
  imageMode(CORNERS);
  image(movieBackground, 0, 0, width, height);
  //BACKGROUNDIMAGE
  tint(255, random(5,40));  // Display at half opacity
  image(imgBackgroundColors, 0, 0, width, height);
  popMatrix();  
  //PVector gravity = new PVector(0,0.1);
  

    tint(255, 255);  // Display at full opacity
  //BACKGROUND FRAME IMAGE
  image(imgBackground, 0, 0, width, height);


  for(int i=0; i<skulls.size(); i++){
    skulls.get(i).display();
    skulls.get(i).move();
    skulls.get(i).checkEdges();
  }
  
 //COUNTER
  fill(255,0,128);
  textAlign(CENTER);
  textSize(180);
  if(skulls.size() > 0){
    text(skulls.size(), width/2, height/2);  
  } else {
    text("@MAGIOBUS", width/2, height/2, 150);
  }
  
  println(skulls.size());
     
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}

//create new skull with a mouse click

void mousePressed() {
  
  skulls.add( new Skull(random(width/2), random(height/2), random(2,3), random(80,200), random(-2,2), "folkerskull.png") );
}
//erases last skull
void keyPressed(){
  if(skulls.size() > 0){
    skulls.remove(skulls.size()-1);
  } else{
  }
}