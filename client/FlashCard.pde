public class flashCard {
  String title;
  String description;
  
  public flashCard(String title, String desc) {
    this.title = title;
    this.description = desc;
  }
  
  public void displayFlashCard(boolean side) {
    if(side) {
      text(this.title, 400, 200);
    } else {
      text(this.description, 400, 200);
    }
  }
  
  

}