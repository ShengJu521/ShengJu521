PImage bqb;
PImage pdx;
PImage shuimu;
PImage zyg;
PImage bob;
float jellyfish;
float xspeed=5;


void setup(){
  size(800,600,P2D);

       jellyfish=0;
  println ("Are you ready, kids?");
  
}
void draw(){
  //auto move 
      bqb = loadImage("bqb.png"); 
    image(bqb ,400,300,800, 600); 
  tint(255,150);
   shuimu = loadImage("shuimu.png");
     imageMode(CENTER); 
     image(shuimu,jellyfish,100,220,140); 
     jellyfish = jellyfish + xspeed;
     if ( jellyfish > width || jellyfish < 0){
     xspeed = xspeed * -1;
   }
   

//move the mouse from left to right
   if(mouseX>60){
     tint(255);
     pdx = loadImage("pdx.png");
      image(pdx,60,300,100, 100); 
  imageMode(CENTER);
   }
   
   if(mouseX>240){ 
     tint(255);
     zyg = loadImage("zyg.png");
     image(zyg,300,340,100, 100); 
  imageMode(CENTER);
   }
   
   if(mouseX>400){
     tint(255);
     bob = loadImage("bob.png");
     image(bob,550,400,100, 100); 
  imageMode(CENTER);
   }
   
}
