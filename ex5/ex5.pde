import processing.sound.*;

SoundFile s1;
Star star;

void setup(){
  size(300,300,P2D);
  background(70,130,180);
  s1= new SoundFile(this,"Florence.mp3");
  star = new Star ();
}

void draw(){
 star.stars(139,103);
   s1.amp(1);

}

void mousePressed(){
  if(star.mouseIn(mouseX,mouseY)){
    if(s1.isPlaying()){      
      s1.stop();
    }else{
      
      s1.play();
    }
  }
  
}
  
  
