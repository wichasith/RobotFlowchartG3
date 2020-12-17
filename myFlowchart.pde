
class Node {
  String data = null ;
  Node next = null ;
  Node altNext = null; 

  Node(String data) {
    this.data = data ;
  }

  Node(String condition, String trueData, String falseData) {
    data = condition;
    this.next = new Node(trueData);
    this.next.next = new Node(falseData);
    this.altNext = this.next.next;
    this.next.altNext = this.next.next;
  }




  void addNode(Node position, String newData) {
    if (position.next == null) {
      position.next = new Node(newData) ;
    } else 
    addNode(position.next, newData) ;
  }

  Node addNode(Node position, String newData, String trueData, String falseData) {
    if (position.next == null) {
      position.next = new Node(newData) ;
      position.next.next = new Node(trueData);
      position.next.next.next = new Node(falseData);
      position.next.altNext = position.next.next.next;
      position.next.next.altNext = position.next.next.next;
      return position.next;
    } else 
    return addNode(position.next, newData, trueData, falseData) ;
  }
}

class Flowchart {
  Node flowchart = null; 
  Node addedIf = null; 


  void addCommand(String data) { 
    if (flowchart == null) {
      flowchart = new Node(data);
    } else {
      flowchart.addNode(flowchart, data);
    }
  }

  void addIf(String condition, String trueCase, String falseCase) {
    if (flowchart == null) {
      flowchart = new Node(condition, trueCase, falseCase);
      addedIf = flowchart;
    } else {
      addedIf = flowchart.addNode(flowchart, condition, trueCase, falseCase);
    }
  }

  void addTrueCase(String condition){
   Node lastTrueNode;
   Node linkedTrueNode;
   lastTrueNode = findAltNode(addedIf.next);
   linkedTrueNode = lastTrueNode.altNext;
   lastTrueNode.next = new Node(condition);
   lastTrueNode.altNext = null; 
   lastTrueNode.next.altNext = linkedTrueNode;
  }
  
  void addFalseCase(String condition) {
    Node lastTrue; 
    Node lastFalse ;
    lastTrue = findAltNode(addedIf.next);
    this.addCommand(condition);
    lastFalse = findLastNode(lastTrue);
    lastTrue.altNext = lastFalse;
    
  }


  Node findAltNode(Node node) {
    if (node.altNext != null) {
      return node;
    } else {
      return findAltNode(node.next);
    }
  }

  Node findLastNode(Node node) {
    if (node.next == null) {
      return node;
    } else {
      return findLastNode(node.next);
    }
  }
}
