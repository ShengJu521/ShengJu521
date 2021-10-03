Ball[] balls =new Ball[15];


void setup(){
  size(800,600,P2D);
  for(int i = 0; i < 15; i ++){
  balls[i] = new Ball();
}
}

void draw(){
  background(30,144,255);
  for(int i = 0; i < 15; i ++){
  balls[i].makeball(50);
  balls[i].moveBall();
  balls[i].checkEdges();
}
}


      
    

      
