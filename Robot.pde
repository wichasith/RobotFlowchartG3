World world ;

void setup() {
  size(1000, 1000);
  world = new World(10, 10, "Map.txt") ;
  Node node ;
  node = new Node("move()") ;
  node.addNode(node,"turnleft()") ;
  //node.addNode(node,"turnright()") ;
  
  println(node.data) ;
  println(node.next.data) ;
  //println(node.next.next.data) ;
  
  world.addFlowchart(node) ;
}

void draw() {
  background(255) ;
  world.drawWorld() ;
  world.worldUpdate() ;
  world.doFlowchart() ;
}

class World {
  int row, col, blockWeight, blockHeight ;
  int walls ;
  boolean blocked ;
  Robots robot ;
  Barrier[] barrier ;
  Target target ;
  InputProcesser input ;
  Node doNode,start ;

  World(int row, int col ) {
    this.blocked = false ;
    this.row = row ;
    this.col = col ;
    blockWeight = width/row ;
    blockHeight = height/col ;
    robot = new Robots(5, 5) ;
    input = new InputProcesser('w', 'a', 'd', robot);
    barrier = new Barrier[10] ;
    for (int i = 0; i < 10; i ++)
    {
      barrier[i] = new Barrier(i, i, 100, 100) ;
    }
    target = new Target(1, 2, 50) ;
  }

  World(int row, int col, String fileName ) {
    this.blocked = false ;
    this.row = row ;
    this.col = col ;
    blockWeight = width/row ;
    blockHeight = height/col ;
    robot = new Robots(5, 5) ;
    input = new InputProcesser('w', 'a', 'd', robot);
    target = new Target(1, 2, 50) ;

    String[] all_lines = loadStrings(fileName);
    barrier = new Barrier[all_lines.length] ;
    for (int i = 0; i < all_lines.length; i++) {
      String[] barrier_column_rown = split(all_lines[i], ',');
      barrier[i] = new Barrier(int(barrier_column_rown[0]), int (barrier_column_rown[1]), blockWeight, blockHeight);
      //println(all_lines.length);
    }
    
  }

  void drawWorld() {
    stroke(0);
    for (int i = 0; i <= col; i++) {
      line(i*blockWeight, 0, i*blockWeight, height) ;
    }
    for (int i = 0; i <= row; i++) {
      line(0, i*blockHeight, width, i*blockHeight) ;
    }

    robot.drawrobot() ;

    for (Barrier each_barrier : barrier ) {
      each_barrier.drawBarrier() ;
    }
    if (checkTarget() == false) {
      target.show() ;
    }
    world.isBlock() ;
    
  }

  void worldUpdate() {
    input.check_input() ;
  }

  boolean isBlock() {

    for (int i = 0; i <= 29; i ++) {
      if (robot.side == "up" && robot.getRowRobot()-1 == barrier[i].getRowBarrier() && robot.getColRobot() == barrier[i].getColBarrier()) {
        robot.blocked = true;
        return true ;
      } else if (robot.side == "left" && robot.getColRobot()-1 == barrier[i].getColBarrier() && robot.getRowRobot() == barrier[i].getRowBarrier()) {
        robot.blocked = true;
        return true ;
      } else if (robot.side == "down" && robot.getRowRobot()+1 == barrier[i].getRowBarrier() && robot.getColRobot() == barrier[i].getColBarrier()) {
        robot.blocked = true;
        return true ;
      } else if (robot.side == "right" && robot.getColRobot()+1 == barrier[i].getColBarrier() && robot.getRowRobot() == barrier[i].getRowBarrier()) {
        robot.blocked = true;
        return true ;
      } else if (robot.side == "up" && robot.getRowRobot()-1 == -1) {
        robot.blocked = true;
        return true ;
      } else if (robot.side == "left" && robot.getColRobot()-1  == -1) {
        robot.blocked = true;
        return true ;
      } else if (robot.side == "down" && robot.getRowRobot()+1 == row) {
        robot.blocked = true;
        return true ;
      } else if (robot.side == "right" && robot.getColRobot()+1 == col) {
        robot.blocked = true;
        return true ;
      }
    }
    return false ;
  }

  boolean checkTarget() {
    if (target.getRowTarget() == robot.getRowRobot() && target.getColTarget() == robot.getColRobot()) {
      return true ;
    } else return false ;
  }
  
  void addFlowchart(Node node) {
    doNode = node ;
    start = node;
    
  }
  
  void doFlowchart() {
    if (doNode != null && frameCount%50==0) {
      println(doNode.data);
    if(doNode.data == "move()") {
      robot.move_forward() ;
    }
      else if (doNode.data == "turnleft()"){
      robot.turn_left()  ;
    }
      else if (doNode.data == "turnright()"){
      robot.turn_right()  ;
    }
    
    doNode = doNode.next ;
    }
    
   
    else if(doNode == null && frameCount%50==0){
      doNode = start;}
  }
  
}

class Robots {
  float row, col ;
  String side  ;
  boolean blocked ;
  Robots(int row, int col ) {
    this.row = row ;
    this.col = col ;
    this.side = "up" ;
  }
  void drawrobot() {

    stroke(0);

    if (this.side == "up") {
      this.robot_up();
    }
    if (this.side == "left") {
      this.robot_left();
    }
    if (this.side == "down") {
      this.robot_down();
    }
    if (this.side == "right") {
      this.robot_right();
    }
  }
  void robot_up()
  {
    line((this.col+(this.col+1))/2*100, this.row*100, (this.col+1)*100, (this.row+1)*100);
    line((this.col+(this.col+1))/2*100, this.row*100, (this.col)*100, (this.row+1)*100);
    line((this.col)*100, (this.row+1)*100, (this.col+1)*100, (this.row+1)*100);
  }
  void robot_left()
  {
    line((this.col)*100, (this.row+1+this.row)/2*100, (this.col+1)*100, (this.row)*100);
    line((this.col)*100, (this.row+1+this.row)/2*100, (this.col+1)*100, (this.row+1)*100);  
    line((this.col+1)*100, (this.row)*100, (this.col+1)*100, (this.row+1)*100);
  }
  void robot_down()
  {
    line((this.col+(this.col+1))/2*100, (this.row+1)*100, (this.col+1)*100, (this.row)*100);
    line((this.col+(this.col+1))/2*100, (this.row+1)*100, (this.col)*100, (this.row)*100);
    line((this.col)*100, (this.row)*100, (this.col+1)*100, (this.row)*100);
  }
  void robot_right()
  {
    line((this.col+1)*100, (this.row+1+this.row)/2*100, (this.col)*100, (this.row)*100);
    line((this.col+1)*100, (this.row+1+this.row)/2*100, (this.col)*100, (this.row+1)*100);  
    line((this.col)*100, (this.row)*100, (this.col)*100, (this.row+1)*100);
  }



  void move_forward() {

    if (world.isBlock() == false )
    {
      if (this.side == "up") {
        this.row -= 1 ;
      }
      if (this.side == "left") {
        this.col -= 1 ;
      }
      if (this.side == "down") {
        this.row += 1 ;
      }
      if (this.side == "right") {
        this.col += 1 ;
      }
    }
    //print(world.isBlock()) ;
  }

  void turn_left() {

    if (this.side == "up") {
      this.side = "left" ;
    } else if (this.side == "left") {
      this.side = "down" ;
    } else if (this.side == "down") {
      this.side = "right" ;
    } else if (this.side == "right") {
      this.side = "up" ;
    }
  }

  void turn_right() {

    if (this.side == "up") {
      this.side = "right" ;
    } else if (this.side == "right") {
      this.side = "down" ;
    } else if (this.side == "down") {
      this.side = "left" ;
    } else if (this.side == "left") {
      this.side = "up" ;
    }
  }


  float getRowRobot() {
    return this.row ;
  }

  float getColRobot() {
    return this.col ;
  }

  String getSide() {
    return this.side ;
  }
}

class Barrier {
  int row, col ;
  int blockWeight, blockHeight ;
  Barrier(int row, int col, int blockWeight, int blockHeight) {
    this.row = row ;
    this.col = col ;
    this.blockWeight = blockWeight ;
    this.blockHeight = blockHeight ;
  }

  void drawBarrier() {
    noStroke() ;
    fill(100) ;
    rect( col*blockWeight, row*blockHeight, blockWeight, blockHeight ) ;
  }

  int getRowBarrier() {
    return this.row ;
  }

  int getColBarrier() {
    return this.col ;
  }
}

class Target {
  int row, col, size ;
  Target(int row, int col, int size) {
    this.row = row ;
    this.col = col ;
    this.size = size ;
  }

  void show() {
    fill(255, 20, 147);
    ellipseMode(CORNER);
    ellipse(this.col*100+size/2, this.row*100+size/2, size, size);
  }  
  

  int getRowTarget() {
    return this.row ;
  }

  int getColTarget() {
    return this.col ;
  }
}

class InputProcesser
{
  char move_forward, turn_left, turn_right;
  Robots robot ;

  InputProcesser(char move_forward, char turn_left, char turn_right, Robots robot)
  {
    this.move_forward=move_forward;
    this.turn_left=turn_left;
    this.turn_right=turn_right;
    this.robot = robot ;
  }
  void check_input()
  {
    if (keyPressed)
    {
      delay(250);
      if (key==this.move_forward)
      {
        robot.move_forward();
      } else if (key==this.turn_left)
      {
        robot.turn_left();
      } else if (key==this.turn_right)
      {
        robot.turn_right();
      }
    }
  }
}
