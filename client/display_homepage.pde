public class homepage {

  final int HOMEPAGE = 0;
  final int LOAD = 1;
  final int CREATE = 2;
  int screen;

  PFont large;
  PFont small;

  String title = "";
  String desc = "";
  boolean titleActive = false;
  boolean descActive = false;

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
    if (screen == LOAD) {
      load_flashcards_user_input();
    }
    if (screen == CREATE) {
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

  //method responsible for displaying the create screen
  void create_flashcards() {  
    //AMOUNT OF CARDS
    textFont(small);
    textAlign(LEFT);
    text("Number of cards: " + list.size, 25, 50);

    //HEADINGS
    textAlign(CENTER, CENTER);
    textFont(large);
    text("Title: ", 300, 100);
    text("Description: ", 240, 200);

    //INPUT
    fill(255);
    rect(350, 75, 300, 50);    //title input
    rect(350, 175, 300, 50);   //description input
    fill(0);
    
    //INPUT TEXT DISPLAY
    textAlign(LEFT);
    textFont(medium);
    String titleDisplay = adjustTextDisplay(title, 22);
    String descDisplay = adjustTextDisplay(desc, 22);    
    text(titleDisplay, 355, 115);  //text display of title
    text(descDisplay, 355, 215);   //text display of description

    //BUTTONS
    textAlign(CENTER);
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
    if (click_button(190, 210, 325, 90)) {
      screen = CREATE;
      list = new flashCardList();
      current = new flashCard();
    }
    if (click_button(200, 60, 300, 90)) {
      screen = LOAD;
    }
  }
  
  //method for handling text longer than the input box size. Takes the string, and the number of chars to display
  String adjustTextDisplay(String string, int k) {
    int stringSize = string.length();
    if(stringSize <= k){
      return string;
    } else {
      int overflow = stringSize - k;
      String newString = string.substring(overflow, string.length());
      return newString;
    }
  }

  void load_flashcards_user_input() {
    //TODO

    //CHECK DATA FILE
  }

  void keyPressed() {
    char input;
    if (keyPressed) {
      if (titleActive) {
        if (keyCode != BACKSPACE) {
          if (key != CODED) { //check if key is a coded key such as tab, alt or ctrl
            input = key;
            title = title + input;
          }
        } else {
          if (title.length() > 0)
            title = title.substring(0, title.length()-1);
        }
      }
      if (descActive) {
        if (keyCode != BACKSPACE) {
          if (key != CODED) {
            input = key;
            desc = desc + input;
          }
        } else {
          if (desc.length() > 0)
            desc = desc.substring(0, desc.length()-1);
        }
      }
    }
  }

  String updateTitle(char input) {
    return title + input;
  }

  String updateDescription(char input) {
    return desc + input;
  }
  void create_flashcards_user_input(boolean titleFinished) {
    //TITLE INPUT
    if (click_button(350, 75, 300, 50)) {
      println("selected title");
      titleActive = true;
      descActive = false;
    }


    //DESCRIPTION INPUT
    if (click_button(350, 175, 300, 50)) {
      println("selected description");
      descActive = true;
      titleActive = false;
    }


    //NEXT BUTTON
    if (click_button(450, 300, 100, 50)) { 
      flashCard new_flashcard = new flashCard(title, desc);
      list.add(new_flashcard);
      title = "";
      desc = "";
    }

    //FINISHED BUTTON
    if (click_button(600, 300, 100, 50)) {
      list.toString();
      //TODO
      //CREATE DATA FILE IF NONE FOUND
      //SAVE CONTENTS TO DATA FILE
    }
  }


  //checks if an area on screen has been clicked. use the values for the rect as the parameters.
  boolean click_button(int xpos, int ypos, int button_width, int button_height) {
    //if the mouse is within the given boundary return true, else false
    if (mouseX >= xpos && mouseX <= (xpos + button_width) && mouseY >= ypos && mouseY <= (ypos + button_height)) {
      return true;
    } else {
      return false;
    }
  }
}