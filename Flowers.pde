Flower flower;
Flower flower2;

void setup() {
  size(640, 640);
  flower = new Flower(50, 50);
  flower2 = new Flower(width/2, height/2);
}
 
void draw() {
  background(20);
  flower.display();
  flower2.display();
  
  
  

}