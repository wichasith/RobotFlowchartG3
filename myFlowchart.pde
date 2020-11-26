
class Node {
  String data = null ;
  Node next = null ;
  
  Node(String data) {
    this.data = data ;
    
  }
  
  void addNode(Node position , String newData) {
    if (position.next == null) {
      position.next = new Node(newData) ; 
    }
    else 
      addNode(position.next , newData) ;
    
  }
  
}
