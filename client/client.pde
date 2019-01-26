PFont large;
PFont medium;
PFont small;
boolean side = true;
homepage hp;

int numberOfFlashCardLists;

void setup() {
  size(750, 400);
  background(255);

  large = createFont("Georgia", 40);
  medium = createFont("Georgia", 28);
  small = createFont("Georgia", 18);
  
  numberOfFlashCardLists = 0;                                                   //   <-- get the number from file and pass in each time this is loaded to avoid over writing
  hp = new homepage(large, small, numberOfFlashCardLists);
}

//flashCard test = new flashCard("What is marketing?", "not too sure");
void mouseClicked() {
  hp.mouseClicked();
}

void keyPressed() {
  if (keyCode == ENTER) {
    hp.create_flashcards_user_input(true);
  }
  hp.keyPressed();
}
void draw() {
  background(255);
  fill(0);
  hp.draw();
  //test.displayFlashCard(side);
}