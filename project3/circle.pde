class Circle{
  float x;
  float y;
  float xx;
  float yy;
  
 Circle(){
  x = width/2;
  y = height/2;
  float z = random(TWO_PI);
  float speed = random(2);
  xx = cos(z)*speed;
  yy = sin(z)*speed;
}
  
void dispaly(){
  noStroke();
  color c = pic.get(int(x/width*2560),int(y/height*1600));
  fill(c);
  ellipse(x,y,4,4);
}
  
 void move(){
   x = x + xx;
   y = y + yy;
   if ( y < 0){
     y = height;
   }if ( y > height){
     y = 0;
   }if ( x < 0){
     x = width;
   }if ( x > width){
     x = 0;
   }
   
  
 }
  
  
  
  
}
