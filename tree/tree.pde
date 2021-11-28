float theta;   

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  frameRate(30);
  stroke(100,149,237);
  float a = (mouseX / (float) width) * 360f;
  theta = radians(a);
  translate(width/2,height);
  line(0,0,0,-height/2);
  translate(0,-height/2);
  branch(100);

}

void branch(float h) {
  h *= 0.7;
  
  if (h > 2) {
    pushMatrix();    
    rotate(theta);   
    line(0, 0, 0, -h);  
    translate(0, -h); 
    branch(h);       
    popMatrix();     
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
