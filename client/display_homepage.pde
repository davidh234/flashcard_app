public class homepage {
  
  final int HOMEPAGE = 0;
  final int LOAD = 1;
  final int CREATE = 2;
  int screen;

  PFont large;
  PFont small;
  
  String title = "";
  String desc = "";
  boolean finished = false;
  
  flashCardList list;
  flashCard current;

  public homepage(PFont large, PFont small) {
    this.screen = 0;
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
      create_flashcards_user_input(false);
    }
  }

  void draw() {
    if (screen == HOMEPAGE) {
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
    rect(200, 60, 300, 90, 5);      //load
    rect(190, 210, 325, 90, 5);     //create
    
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
    rect(350, 75, 300, 50);    //title input
    rect(350, 175, 300, 50);   //description input

    //BUTTONS
    textFont(small);
    fill(200);
    rect(450, 300, 100, 50);    //next
    rect(600, 300, 100, 50);    //finished

    //TEXT FOR BUTTONS
    fill(0);
    text("Next", 500, 325);
    text("Finished", 650, 325);
  }


  void homepage_user_input() {
    if(click_button(190, 210, 325, 90)) {
      screen = CREATE;
      list = new flashCardList();
      current = new flashCard();
    }
    if(click_button(200, 60, 300, 90)) {
      screen = LOAD;
    }
  }
  
  void load_flashcards_user_input() {
    //TODO
    
    //CHECK DATA FILE
  }
  
  boolean keyPressed() {
    char input = ' ';
    if(keyPressed) {
      if(keyCode == ENTER) {
        create_flashcards_user_input(true);
        return true;
      }
      input = key;
      title = title + input;
    }
    create_flashcards_user_input(false);
    return false;
  }
  
  void create_flashcards_user_input(boolean titleFinished) {
    //TITLE INPUT
      
      //*** check for click on title or desc first *****
     title = current.enterTitle(titleFinished);
     
     
    //DESCRIPTION INPUT
     desc = current.enterDescription(false);
    
    //NEXT BUTTON
    if(click_button(450, 300, 100, 50)) { 
      flashCard new_flashcard = new flashCard(title, desc);
      list.add(new_flashcard);
    }
    
    //FINISHED BUTTON
      //CREATE DATA FILE IF NONE FOUND
      //SAVE CONTENTS TO DATA FILE
  }
  
  
  //checks if an area on screen has been clicked. xpos and ypos refer to the top left corner of the button as an (x,y) co-ordinate.
  boolean click_button(int xpos, int ypos, int button_width, int button_height) {
    //if the mouse is within the given boundary return true, else false
    if(mouseX >= xpos && mouseX <= (xpos + button_width) && mouseY >= ypos && mouseY <= (ypos + button_height)){
      return true;
    }
    else {
      return false;
    }
  }
  
}