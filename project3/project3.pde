Circle [] circles;
PImage pic;

void setup(){
  size(800,480);
  pic= loadImage("pic.jpeg");
  circles = new Circle [20000];
  for ( int i = 0; i < circles.length; i ++){
    circles[i]= new Circle();
  }
}
void draw(){
  background(0);
  for ( int i = 0; i < circles.length; i ++){
   circles[i].dispaly();
   circles[i].move();
  }
}
