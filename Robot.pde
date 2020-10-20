int row = 10;
int column = 10;
int rancol;
int ranrow;
int n = 30;
int rancolTarget ;
int ranrowTarget ;

World[][] world;
Barrier[] barrier;
Target target ;
Robot robot;
InputPro input;

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
  rancolTarget = round(random(column));
  ranrowTarget = round(random(row));
  
  robot = new Robot(rancol, ranrow);
  target = new Target(rancolTarget , ranrowTarget) ;
  
}

void draw(){
  input = new InputPro('w', 'a', 'd');
  //background(255);
  
  for(int i = 0; i < column ; i++){
   for(int j = 0; j < row; j++){
      world[i][j].drawWorld();
   }
  }
  
  for(int i = 0; i < n; i++){
    barrier[i].drawBarrier();
  }

  
  
  if(target.show == true){
    target.show() ;
  }
  target.hide() ;
  
  input.check_input();
  robot.drawRobot();
}

///////////////////////////////////////////////////////////////////////////////////////// 
<<<<<<< HEAD
/////////////////////////////////////////////////////
//
// Programmer: PARINYA JAIHARN
//
// Description: draw rectangle by recieve loop position from draw()
// 
///////////////////////////////////////////////////// 
=======
 
>>>>>>> 23bfc7912a7c1bc71760597cfe414739206684ea
class World{
  float row;
  float col;
  float w;
  float h;
  String[] map = loadStrings("Map.txt");

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
  void start()
  {
  
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

<<<<<<< HEAD
/////////////////////////////////////////////////////
//
// Programmer: PARINYA JAIHARN
//
// Description: draw rectangle by recieve random position from draw()
// 
/////////////////////////////////////////////////////
=======
>>>>>>> 23bfc7912a7c1bc71760597cfe414739206684ea
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
<<<<<<< HEAD
<<<<<<< HEAD
/////////////////////////////////////////////////////
//
// Programmer: PARINYA JAIHARN
//
// Description: 1st vertion - draw robot in circle shapemove by keyReleased()
// 
/////////////////////////////////////////////////////
=======

>>>>>>> 23bfc7912a7c1bc71760597cfe414739206684ea
=======
/////////////////////////////////////////////////////
//
// Programmer: (Suphawit Auchariyamet)
//
// Description: (check side collect for robot movement)
// 
/////////////////////////////////////////////////////
>>>>>>> f4efe48c75060c1dd401ed969d9db461403e013c
class Robot{
  float row;
  float col;
  char  side ;
  char[]  sidecollect={'w','a','s','d'};
  
 
  Robot(float row, float col){
    this.row = row;
    this.col = col;
    this.side = 'w' ;
  }
  
  void drawRobot(){
    fill(255);
    
    if (this.side == 'w'){
      this.robot_up();
     
    }
    if (this.side == 'a'){
      this.robot_left();
    }
    if (this.side == 's'){
       this.robot_down();
   
    }
    if (this.side == 'd'){
      this.robot_right();
    }
  
  }
  void robot_up()
  {
      line((this.col+(this.col+1))/2*100,this.row*100,(this.col+1)*100,(this.row+1)*100);
      line((this.col+(this.col+1))/2*100,this.row*100,(this.col)*100,(this.row+1)*100);
      line((this.col+1)*100,this.row*100,(this.col+1)*100,(this.row+1)*100);
  }
  void robot_left()
  {
      line((this.col)*100,(this.row+1+this.row)/2*100,(this.col+1)*100,(this.row)*100);
      line((this.col)*100,(this.row+1+this.row)/2*100,(this.col+1)*100,(this.row+1)*100);  
      line((this.col+1)*100,(this.row)*100,(this.col+1)*100,(this.row+1)*100);
  }
  void robot_down()
  {
       line((this.col+(this.col+1))/2*100,(this.row+1)*100,(this.col+1)*100,(this.row)*100);
       line((this.col+(this.col+1))/2*100,(this.row+1)*100,(this.col)*100,(this.row)*100);
       line((this.col)*100,(this.row)*100,(this.col)*100,(this.row+1)*100);
  }
  void robot_right()
  {
      line((this.col+1)*100,(this.row+1+this.row)/2*100,(this.col)*100,(this.row)*100);
      line((this.col+1)*100,(this.row+1+this.row)/2*100,(this.col)*100,(this.row+1)*100);  
      line((this.col)*100,(this.row)*100,(this.col)*100,(this.row+1)*100);
  }
  
  
  
  void move_forward(){
  
  if(this.side == 'w'){
      
      robot.row-=1;
      for (int k = 0 ; k < barrier.length ; k++){
      if(robot.row == barrier[k].ranrow && robot.col == barrier[k].rancol ){
        robot.row+=1;
      
      }
    }
    if(robot.row == -1){
      robot.row+=1;
    }
   
    }
   if(this.side == 'a'){
      robot.col-=1;
      for (int k = 0 ; k < barrier.length ; k++){
      if(robot.row == barrier[k].ranrow && robot.col == barrier[k].rancol ){
        robot.col+=1;
      }
    }
    if(robot.col == -1){
      robot.col+=1;
    }
    }
    if(this.side == 's'){
      
      robot.row+=1;
      for (int k = 0 ; k < barrier.length ; k++){
      if(robot.row == barrier[k].ranrow && robot.col == barrier[k].rancol ){
        robot.row-=1;
      
      }
    }
    if(robot.row == 10){
      robot.row-=1;
       
    }
    
    }
    
    if(this.side == 'd'){
      robot.col+=1;
      for (int k = 0 ; k < barrier.length ; k++){
      if(robot.row == barrier[k].ranrow && robot.col == barrier[k].rancol ){
        robot.col-=1;
      }
    }
    if(robot.col == column){
      robot.col-=1;
    }
    }
  }
  
  //void turn_left(){
  //if(keyPressed) {
    //fill(124,252,0);
    
    //if(key == 'a'){
      //if(side == "up"){
        //this.robot_up();
        //side = "left" ;
        //delay(200);
      //}
      //else if(side == "left"){
        //this.robot_left();
        //side = "down" ;
        //delay(200);
      //}
      //else if(side == "down"){
        //this.robot_down();
        //side = "left" ;
        //delay(200);
      //}
      //else if(side == "right"){
        //this.robot_right();
        //side = "up" ;
        //delay(200);
      //}
       
    //}
  //}
  //}
  //void turn_right()
  //{
    //if(key == 'd'){
      //if(side == "up"){
        //this.robot_up();
        //side = "right" ;
        //delay(200);
      //}
      //else if(side == "left"){
        //this.robot_left();
        //side = "up" ;
        //delay(200);
      //}
      //else if(side == "down"){
        //this.robot_down();
        //side = "right" ;
        //delay(200);
      //}
      //else if(side == "right"){
        //this.robot_right();
        //side = "down" ;
        //delay(200);
      //}
    //}

/////////////////////////////////////////////////////
//
// Programmer: (Suphawit Auchariyamet)
//
// Description: (change turnleft method for inputprocessor)(if robot side =w robot will move follow ex side)
// 
/////////////////////////////////////////////////////
  void turn_left() {

    for (int x = 0; x < sidecollect.length; x +=1) {
      if (sidecollect[x] == this.side) {
        if (x == 3) this.side = sidecollect[0];
        else  this.side = sidecollect[x+1];
        break;
      }
    }
    background(255);
  }

/////////////////////////////////////////////////////
//
// Programmer: (Suphawit Auchariyamet)
//
// Description: (change turn right method for inputprocessor)(if robot side =w robot will move follow ex side)
// 
/////////////////////////////////////////////////////
  void turn_right() {

    for (int x = 0; x < sidecollect.length; x +=1) {
      if (sidecollect[x] == this.side) {
        if (x == 0) this.side = sidecollect[3];
        else  this.side = sidecollect[x-1];
        
        break;
      
      }
    }
    background(255);
  }
    
    
      
  
  
  
  void turn(){
    
  }
  float getRowRobot() {
    return this.row ;
  }
  
  float getColRobot() {
    return this.col ;
  }
}

/////////////////////////////////////////////////////////////////////////////////////////

class Target{
  float row;
  float col;
  int size ;
  boolean show ;
  Target(float row, float col){
    this.row = row;
    this.col = col;
    size = 50 ;
    show = true ;
  }
  
  void show(){
    fill(255,20,147);
    ellipseMode(CORNER);
    ellipse(this.col*100+size/2, this.row*100+size/2, size, size);
    
    
  }
  void hide(){
    if (robot.getRowRobot() == this.row && robot.getColRobot() == this.col ){
      show = false ; 
      
    }
    
  }
  
}
/////////////////////////////////////////////////////
//
// Programmer: (Suphawit Auchariyamet)
//
// Description: (Input Processor)(check if key = keyboard key robot will move or turnleft turn right follow command)
// 
/////////////////////////////////////////////////////
class InputPro
{
  char move_forward,turn_left,turn_right;
  InputPro(char move_forward,char turn_left,char turn_right)
  {
    this.move_forward=move_forward;
    this.turn_left=turn_left;
    this.turn_right=turn_right;
  }
  void check_input()
  {
  if(keyPressed)
    {
    delay(250);
    if(key==this.move_forward)
      {
      robot.move_forward();
      }
    else if(key==this.turn_left)
      {
      robot.turn_left();
      }
    else if(key==this.turn_right)
      {
      robot.turn_right();
      }
    }
  }
}
