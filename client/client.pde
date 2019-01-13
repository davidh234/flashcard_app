PFont large;
PFont small;
boolean side = true;
homepage hp;

void keyPressed() {
  side = !side;
}

void setup() {
  size(750, 400);
  background(255);
  
  large = createFont("Georgia", 40);
  small = createFont("Georgia", 18);
  hp = new homepage(large, small);
}

//flashCard test = new flashCard("What is marketing?", "not too sure");
void mouseClicked() {
  hp.mouseClicked();
}
void draw() {
  background(255);
  fill(0);
  hp.draw();
  //test.displayFlashCard(side);
}