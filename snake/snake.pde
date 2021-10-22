int grid = 20;
int backgroundColor = 255;
int snakeLength = 2;
int maxSnakeLength = 400;

int snakeHeadX = 0;
int snakeHeadY = 0;

int[] x = new int[maxSnakeLength];
int[] y = new int[maxSnakeLength];

int foodX;
int foodY;

char snakeDirection = 'R';
char snakeDirectionTemp;

int speed = 5;

int timeStart;
int timePassed;
int timeInterval;

int bestScore = snakeLength - 2;

boolean foodEaten = true;

boolean gameOver = false;
boolean gameStart = false;
int gamePause = 0;


void setup(){
  size(500, 500);
  frameRate(15);
  noStroke();
  showFirstStart();

  timeStart = millis();
}

void draw(){
  if (keyPressed && (key == 'r' || key == 'R'))
  {
    if (gameStart == false)
    {
      gameStart = true;
    }
    if (gameOver)
    {
      snakeInit();
    }
  }
  if (gameOver)
  {
    return;
  }


  timePassed = millis() - timeStart; 
  timeInterval = 1000 / speed;


  if (timePassed > timeInterval && snakeDirection != 'P' && gameStart){
    background(backgroundColor);

    switch(snakeDirection) {
    case 'L':
      snakeHeadX -= grid;
      break;
    case 'R':
      snakeHeadX += grid;
      break;
    case 'D':
      snakeHeadY += grid;
      break;
    case 'U':
      snakeHeadY -= grid;
      break;
    }


    drawFood(width, height);

    if (snakeHeadX == foodX && snakeHeadY == foodY){
      foodEaten = true;
      snakeLength++;

      if ( snakeLength%5 == 1) {
        speed++;
      }
      speed = min(20, speed);
    }


    drawSnake();


    if (checkSnakeDie()){
      return;
    }

    timeStart = millis(); 
  }
}


void keyPressed(){
  if (key == 'p' || key == 'P'){
    gamePause++;
    if (gamePause%2 == 1){
      snakeDirectionTemp = snakeDirection;
      snakeDirection = 'P';
    } else {
      snakeDirection = snakeDirectionTemp;
    }
  }

  if (snakeDirection != 'P'&& keyPressed && key == CODED){
    switch(keyCode) {
    case LEFT:
      if (snakeDirection != 'R') {
        snakeDirection = 'L';
      }
      break;
    case RIGHT:
      if (snakeDirection != 'L') {
        snakeDirection = 'R';
      }
      break;
    case DOWN:
      if (snakeDirection != 'U') {
        snakeDirection = 'D';
      }
      break;
    case UP:
      if (snakeDirection != 'D') {
        snakeDirection = 'U';
      }
      break;
    }
  }
}

void drawFood(int max_width, int max_high){
  int food_out = 0; 

  fill(70,130,180); 

  if (foodEaten){
    while (food_out == 0){
      food_out = 1;
      foodX = int(random(0, max_width) / grid) * grid;
      foodY = int(random(0, max_high) / grid) * grid;

      for (int i=snakeLength-1; i>=0; i--) {
        if ( foodX == x[i] && foodY == y[i] ) {
          food_out = 0;
        }
      }
    }
  }

  rect(foodX, foodY, grid, grid);
  foodEaten = false;
}

void drawSnake(){
  for (int i=snakeLength-1; i>0; i--) {
    x[i] = x[i-1];
    y[i] = y[i-1];
  }

  x[0] = snakeHeadX;
  y[0] =snakeHeadY;

  fill(255,236,139);

  for (int i=0; i<snakeLength; i++) {
    rect(x[i], y[i], grid, grid);
  }
}

void showFirstStart(){
  pushMatrix();
  background(255);  

  fill(255,236,139);
  textSize(40);
  text("Press 'R' or 'r' to start.", 0, 260);
  popMatrix();
}

void showGameOver(){
  gameOver = true;

  pushMatrix();
  bestScore = bestScore > snakeLength ? (bestScore - 2 ): (snakeLength - 2);

  background(255);  
  translate(width/2, height/2 - 50);
  fill(255,236,139);  
  textAlign(CENTER); 
  textSize(84);
  text(snakeLength - 2 + "/" + bestScore, 0, 0);

  fill(255,236,139);
  textSize(30);
  text("Score / Best", 0, 200);
  text("Game Over, Press 'R' or 'r' to restart.", 0, 260);
  popMatrix();
}

void snakeInit(){
  background(backgroundColor);
  snakeLength = 2;
  gameOver = false;
  snakeHeadX = 0;
  snakeHeadY = 0;
  snakeDirection = 'R';
  speed = 5;
}

boolean checkSnakeDie(){
  if ( snakeHeadX< 0 || snakeHeadX >= width || snakeHeadY < 0 || snakeHeadY >= height) {
    showGameOver();
    return true;
  }

  if ( snakeLength > 2 ) {
    for ( int i=1; i<snakeLength; i++ ) {
      if ( snakeHeadX == x[i] && snakeHeadY == y[i] ) {
        showGameOver();
        return true;
      }
    }
  }

  return false;
}
