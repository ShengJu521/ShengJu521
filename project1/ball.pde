class Ball{
float x=random(800);
float y=random(600);
float xspeed =random(5);
float yspeed = random(5);
float diameter;
color c;
color c1 = color (244,164,96);
color c2 = color (255,236,139);
color c3 = color (255,174,185);
float z;
float h;


   void makeball(float changeD){
       fill(c);
       c=c1;
        ellipse(x,y,diameter,diameter);
        diameter=changeD;
  }
  
   void moveBall(){
        x=x+xspeed;
        y=y+yspeed;
  }
  
   void checkEdges(){
    if ( x > width||x< 0){
     xspeed = xspeed * -1;
      z++;
   }
      
    if (y > height || y< 0){
  yspeed = yspeed * -1;
  h++;
 }


           if(z%5==0){
           c=c2;
   }
          if(h%3==0){
           c=c3;
   }

      }
}
     
  
    
