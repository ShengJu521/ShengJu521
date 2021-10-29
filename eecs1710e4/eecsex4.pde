LetterGenerator lg;
String input = "g";

void setup() {
  size(800, 600, P2D);
  lg = new LetterGenerator(input, 0, height/2);
}

void draw() {
  background(0);
  
  lg.run(); 
}
