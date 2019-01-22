//flashcard list ADT - implemented as doubly linked list
public class flashCardList {
  flashCard start = null;
  flashCard end = null;
  int size =0;
  
   //add a new flashcard to the linked list, default position of the end of the list
   void add(flashCard card) {
     if(start == null) {
       start = card;
       end = card;
     } else {
       end.next = card;
       card.prev = end;
       end = card;
     }
     size++;
   }
   
   //remove the most recently added card from the list
   void remove() {
     flashCard prev = end.prev;
     if(prev != null) {
       prev.next = null;
       end = prev;
     }
     size--;
   }
   
   //method override for adding a flashcard at a given position 'pos'
   void add(flashCard card, int pos) {}
   
   //remove a flashcard at position pos from the list
   void remove(int pos) {}
   
   //delete the entire list of flash-cards 
   //should delete the file also
   void deleteList(flashCard start) {
      
   }
   
   //given the starting nodes in two lists, join the two flashcards
   void unionLists(flashCard first, flashCard second) {}
   
   String toString() {
     flashCard current = start;
     int i=1;
     while(current != null) {
       println("card number " + i);
       println("title: " + current.title);
       println("description: " + current.description + "\n");
       current = current.next;
       i++;
     }
     return null;
   }

}