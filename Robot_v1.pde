int row = 10;
int column = 10;
int rancol;
int ranrow;
int n = 30;


World[][] world;
Barrier[] barrier;
Robot robot;


void keyReleased(){

    if(key == 'w'){
      robot.row-=1;
    }
    if(key == 's'){
      robot.row+=1;
    }
    if(key == 'a'){
      robot.col-=1;
    }
    if(key == 'd'){
      robot.col+=1;
    }
    
  
}

void setup(){
  size(1000,1000); 
  
  world = new World[column][row];
  for(int i = 0; i < column ; i++){
    for(int j = 0; j < row; j++){
      world[i][j] = new World(i*100, j*100, 100, 100 );
   }
  }
  
  barrier = new Barrier[n];
  for(int i= 0; i < n; i++){
    rancol = round(random(column));
    ranrow = round(random(row));
    barrier[i] = new Barrier(rancol, ranrow, 100, 100);
  }
  
  robot = new Robot(rancol, ranrow);
  
}

void draw(){
  background(255);
  
  for(int i = 0; i < column ; i++){
   for(int j = 0; j < row; j++){
      world[i][j].drawWorld();
   }
  }
  
  for(int i = 0; i < n; i++){
    barrier[i].drawBarrier();
  }

  
  robot.drawRobot();

}

///////////////////////////////////////////////////////////////////////////////////////// 
 
class World{
  float row;
  float col;
  float w;
  float h;
  String[] map = loadStrings("MapV1.txt");
  
  World(float row, float col, float w, float h){
    this.row = row;
    this.col = col;
    this.w = w;
    this.h = h;
  }
  
  void drawWorld(){
    stroke(0);
    fill(225);
    rect(this.row ,this.col , this.w, this.h); 
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
    for(int i = 0; i < 10; i++){
      stroke(0);
      fill(150);
      rect(this.rancol*100 ,this.ranrow*100 , this.w, this.h);
    }
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
    fill(255);
    ellipseMode(CORNER);
    ellipse(this.col*100, this.row*100, 100, 100);
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
