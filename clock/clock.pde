Boolean flag = true;
int currentSecond; 
int currentMinute; 
int currentHour; 
float second1; 
float minute1; 
float hour1; 


void setup () {
  size(500, 500);
}


void draw () {  
  currentSecond = second();
  currentMinute = minute();
  currentHour = hour();
  minute1= minute() + currentSecond / 60.0;
  hour1 = hour() + minute1 / 60.0;  
  clock1();
  keyPressed();
  secondhand();
  minutehand();  
  secondhand();
   hourhand();  
  
  
  currentSecond = second();
  currentMinute = minute();
  currentHour = hour();
  minute1 = minute() + currentSecond / 60;
  hour1 = hour() + minute1 / 60;

}

void clock1() {
 ellipseMode(CENTER);
  stroke(70,130,180);
  strokeWeight(20);
  fill(176,196,222);
  ellipse(width/2, height/2, 350, 350);
  
  for(int i = 1; i <= 60; i++) {
    pushMatrix(); 
    translate(width/2, height/2); 
    rotate(radians(i * 6));
    if(i % 5 == 0) { 
      strokeWeight(4);
      line(110, 0, 130, 0);
    } else { 
      strokeWeight(2);
      line(130, 0, 130, 0);
    }
    popMatrix();  
  }
  
  textSize(40);
  fill(255);
  stroke(255);
  strokeWeight(50);
  text(12, 230, 115); 
  text(3, 390, 260) ;
  text(9, 90, 260) ;
  text(6, 240, 410) ;
}

//start and stop
void keyPressed() {
  if (key == 's' || key == 'S') {
    flag = true;
  } else if (key=='t' || key=='T') {
    flag = false;
  }
}

  // second and ellipse
void  secondhand(){
  pushMatrix();
  translate(width/2, height/2);
  float angleSecond = radians(270);
  if ((currentSecond >= 0 && currentSecond <= 15)) {
    angleSecond = radians(270 + 6 * currentSecond);
  } else {
    angleSecond = radians(6 * (currentSecond - 15));
  }
  if (flag) { 
    rotate(angleSecond);
  } else {
    rotate(radians(180));
  }
  stroke(255);
  strokeWeight(3);
  line(-15, 0, 120, 0);
  fill(255);
  popMatrix();
}


  // minute
 void   minutehand(){  
  pushMatrix();
  translate(width/2, height/2);
  float angleMinute = radians(270);
  if ((minute1 >= 0 && currentMinute <= 15)) {
    angleMinute = radians(270 + 6 * minute1);
  } else {
    angleMinute = radians(6 * (minute1 - 15));
  }
  if (flag) { 
    rotate(angleMinute);
  } else {
    rotate(radians(0));
  }
  stroke(255);
  strokeWeight(5);
  line(-10, 0, 90, 0);
  popMatrix();
 }
 
     //hour
void hourhand(){
  pushMatrix();
  translate(width/2, height/2);
  float angleHour = radians(270);
  if ((hour1 >= 3 && hour1 <= 12) || (hour1 >= 15 && hour1<= 24)) {
    angleHour = radians(30 * (hour1 - 3));
  } else {
    angleHour = radians(30 * (hour1 - 1) + 300);
  }
  if (flag) { 
    rotate(angleHour);
  } else {
    rotate(radians(270));
  }
  stroke(255);
  strokeWeight(10);
  line(-10, 0, 70, 0);
  popMatrix();
}
