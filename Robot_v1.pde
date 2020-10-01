void keyPressed(){
  
}

void setup(){
  
}

void draw(){

}

///////////////////////////////////////////////////////////////////////////////////////// 
 
class World{
  float row;
  float col;
  float w;
  float h;
  
  World(float row, float col, float w, float h){
    this.row = row;
    this.col = col;
    this.w = w;
    this.h = h;
  }
  
  void drawWorld(){

  }

}

/////////////////////////////////////////////////////////////////////////////////////////

class Barrier{
  boolean empty = false;
  float ranrow;
  float rancol;
  float w;
  float h;
  
  Barrier(float rancol, float ranrow, float w, float h){
    this.ranrow = ranrow;
    this.rancol = rancol;
    this.w = w;
    this.h = h;
  }
  
  void drawBarrier(){
    
  }
  
}

/////////////////////////////////////////////////////////////////////////////////////////

class Robot{
  float row;
  float col;
  Robot(float row, float col){
    this.row = row;
    this.col = col;
  }
  
  void drawRobot(){
    
  }
  
  void move(){
    
  }
  
  void turn(){
    
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

class Target{
  float row;
  float col;
  Target(float row, float col){
    this.row = row;
    this.col = col;
  }
  
  void show(){
    
  }
  void hide(){
    
  }
  
}
