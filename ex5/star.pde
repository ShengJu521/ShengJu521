class Star{
float x1=139;
float y1=103;

void stars(float x1,float y1){
  ellipse(x1,y1,30,30);
  fill(255,246,143);
  stroke(255,246,143);  
}

boolean mouseIn(float mx,float my){
  if( dist (x1,y1,mx,my )<30){
    return true;
     }else{
    return false;
     }

     
}


}
