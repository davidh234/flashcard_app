public class homepage {
  
  final int HOMEPAGE = 0;
  final int LOAD = 1;
  final int CREATE = 2;
  int screen = 0;

  PFont large;
  PFont small;

  public homepage(PFont large, PFont small) {
    this.large = large;
    this.small = small;
  }

  void mouseClicked() {
    if (screen == HOMEPAGE) {
      homepage_user_input();
    }
    if(screen == LOAD) {
      load_flashcards_user_input();
    }
    if(screen == CREATE) {
      create_flashcards_user_input();
    }
  }

  void draw() {
    if (screen == 0) {
      mainscreen();
    } else if (screen == LOAD) {
      load_flashcards();
    } else if (screen == CREATE) {
      create_flashcards();
    }
  }

  void mainscreen() {
    //TEXT SETTINGS
    textAlign(CENTER, CENTER);
    textFont(large);
    
    //BUTTONS
    fill(225);
    rect(200, 60, 300, 90, 5);
    rect(190, 210, 325, 90, 5);
    
    //HEADINGS
    fill(0);
    text("Load flash cards", 350, 100);
    text("Create flash cards", 350, 250);
  }

  void load_flashcards() {
    //read from file
  }

  void create_flashcards() {
    textAlign(CENTER, CENTER);
    textFont(large);

    //HEADINGS
    text("Title: ", 300, 100);
    text("Description: ", 240, 200);

    //INPUT
    fill(255);
    rect(350, 75, 300, 50);
    rect(350, 175, 300, 50);

    //BUTTONS
    textFont(small);
    fill(200);
    rect(450, 300, 100, 50);
    rect(600, 300, 100, 50);

    //TEXT FOR BUTTONS
    fill(0);
    text("Next", 500, 325);
    text("Finished", 650, 325);
  }


  void homepage_user_input() {
    if (mouseX >= 190 && mouseX <= 190+325 && mouseY >= 210 && mouseY <= 210+90) {
      screen = CREATE;
    }
    if (mouseX >= 200 && mouseX <= 200+300 && mouseY >= 60 && mouseY <= 60 + 90) {
      screen = LOAD;
    }
  }
  
  void load_flashcards_user_input() {
    //TODO
  }
  
  void create_flashcards_user_input() {
    //TODO
  }
}