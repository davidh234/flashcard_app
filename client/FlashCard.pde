public class flashCard {
  String title;
  String description;
  flashCard next;
  flashCard prev;
  
//---- different constructors for ease of use with flashcardList ----
  public flashCard() {
    
  }
  
  public flashCard(String title, String desc) {
    this.title = title;
    this.description = desc;
    this.next = null;
    this.prev = null;
  }
  
  public flashCard(String title, String desc, flashCard prev) {
    //TODO
  }
  
  public flashCard(String title, String desc, flashCard prev, flashCard next) {
    //TODO
  }
  
//----------------------------------------------------------------
  
  public void displayFlashCard(boolean side) {
    if(side) {
      text(this.title, 400, 200);
    } else {
      text(this.description, 400, 200);
    }
  }
  String enterTitle(boolean finished) {
     return null;
  }
  
  String enterDescription(boolean finished) {
    //TODO
    return description;
  }
}