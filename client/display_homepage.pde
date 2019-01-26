public class homepage {

  final int HOMEPAGE = 0;
  final int LOAD = 1;
  final int CREATE = 2;
  int screen;

  PFont large;
  PFont small;

  String title = "";
  String desc = "";
  String listName = "";
  
  boolean titleActive = false;
  boolean descActive = false;

  flashCardList list;
  flashCard current;
  
  JSONObject output;
  JSONArray cardsJSON;
  int listCount;

  public homepage(PFont large, PFont small, int listCount) {
    this.screen = 0;
    this.large = large;
    this.small = small;
    this.listCount = listCount;
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

  //reads any files from the 'data' folder and displays them on the load page to be selected                        <-- this method is being called repeatedly, just call once
  void load_flashcards() {
     File dir = new File(sketchPath("data"));
     String[] files = dir.list();
     JSONArray[] file = new JSONArray[files.length];
     
     //check if no files exist
     if(files.length == 0) {  
       textAlign(LEFT, LEFT);                                                                                      // <-- add back button to this page
       textFont(small);
       text("Looks like you haven't created any lists!", 200, 175);
     } 
     //some files exist.. print each one
     else { 
       for(int i =0; i < files.length; i++){
         file[i] = loadJSONArray(files[i]);
         fill(0);
         textFont(medium);
         text(files[i].substring(0,files[i].length()-5), 100, (50*i + 30));                                        // <-- fix display to be standardised
       }
     }
  }

  //method responsible for displaying the create screen
  void create_flashcards() {  
    //AMOUNT OF CARDS
    textFont(small);
    textAlign(LEFT);
    text("Number of cards: " + list.size, 25, 50);

    //HEADINGS
    textAlign(CENTER, CENTER);
    textFont(medium);
    text("List name: ", 275, 75);
    textFont(large);
    text("Title: ", 300, 145);
    text("Description: ", 240, 245);

    //INPUT
    fill(255);
    rect(350, 50, 300, 50);    //card list name
    rect(350, 125, 300, 50);    //title input
    rect(350, 225, 300, 50);   //description input
    fill(0);
    
    //INPUT TEXT DISPLAY
    textAlign(LEFT);
    textFont(medium);
    String listDisplay = adjustTextDisplay(listName, 22);
    String titleDisplay = adjustTextDisplay(title, 22);
    String descDisplay = adjustTextDisplay(desc, 22);    
    text(listDisplay, 355, 85);    //text display of list name
    text(titleDisplay, 355, 160);  //text display of title
    text(descDisplay, 355, 260);   //text display of description

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
      else if (descActive) {
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
      else { //list name
        if (keyCode != BACKSPACE) {
          if (key != CODED) {
            input = key;
            listName = listName + input;
          }
        } else {
          if (listName.length() > 0)
            listName = listName.substring(0, listName.length()-1);
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
    
    //LIST NAME INPUT
    if (click_button(350, 50, 300, 50)) {
      println("selected list name");
      titleActive = false;
      descActive = false;
    }
    
    //TITLE INPUT
    if (click_button(350, 125, 300, 50)) {
      println("selected title");
      titleActive = true;
      descActive = false;
    }


    //DESCRIPTION INPUT
    if (click_button(350, 225, 300, 50)) {
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
      flashCard next;
      cardsJSON = new JSONArray();
      for(int k = 0; k < list.size; k++){
        next = list.getCard(k);
        if(next != null){
          output = new JSONObject();
          output.setString("title",next.title);
          output.setString("description",next.description);
          cardsJSON.setJSONObject(k, output);
        }                                                     
      }
      if(!cardsJSON.isNull(0)){
        if(listName == ""){
          listName = "[NoName]";
        }
        saveJSONArray(cardsJSON, "data/"+ listName+ ".json");              //<-- should check for name conflict and adjust name to avoid over-writing
        listName = "";
      }
      screen = HOMEPAGE; //return to homepage upon finishing
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