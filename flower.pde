class Flower{
  float xpos;
  float ypos;
  float scale; 
  //Constructor
  Flower(float xpos, float ypos, float scale){
    this.xpos = xpos;
    this.ypos = ypos;
    this.scale = scale;
  }
  
  void display(){
    pushMatrix();
    scale(scale);
    translate(xpos, ypos);
    for (int i = 50; i > 0; i-=10) {
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
        vertex(0, 0);
        bezierVertex(s, -s/2, s, s/2, 0, 0);
        endShape();
        fill(125+sin(radians(i+frameCount))*125, 0, 125+sin(radians(i+frameCount+180))*125, map(i, 50, 0, 0, 150));
        beginShape();
        vertex(0, 0);
        bezierVertex(s, -s/3, s, s/3, 0, 0);
        endShape();
        popMatrix();
      }
    } 
    popMatrix();
  }
  
}