import peasy.*;


PeasyCam cam;

final int UPP = 0; 
final int DWN = 1; 
final int RGT = 2;
final int LFT = 3; 
final int FRT = 4; 
final int BCK = 5;
//up, down, right, left, front, back
color[] colors = {
#FFFFFF, #FFFF00, 
#FF0000, #FFA500,
#00FF00, #0000FF
};

int dim = 3;
//Cubie[][][] cube = new Cubie[dim][dim][dim];  
Cubie [] cube = new Cubie[dim*dim*dim];
//String[] allMoves = {"f", "b", "u", "d" , "l", "r"};
Move[] allMoves = new Move[]{
  new Move(0,1,0,1), 
  new Move(0,1,0,-1),
  new Move(0,-1,0,1), 
  new Move(0,-1,0,-1), 
  new Move(1,0,0,1), 
  new Move(1,0,0,-1),
  new Move(-1,0,0,1), 
  new Move(-1,0,0,-1), 
  new Move(0,0,1,1), 
  new Move(0,0,1,-1),
  new Move(0,0,-1,1), 
  new Move(0,0,-1,-1), 
};
ArrayList<Move> sequence = new ArrayList<Move>();
int counter = 0;
boolean started = false;

Move currentMove;
void setup() {
  size(600,600,P3D);
  cam = new PeasyCam(this, 400);
  int index = 0;
  //for(int i = 0; i<dim;i++) {
  //  for(int j = 0; j<dim; j++){
  //    for(int k = 0; k<dim; k++) {
    for(int x = -1; x<=1;x++) {
    for(int y = -1; y<=1; y++){
      for(int z = -1; z<=1; z++) {
        //float len = 50;
        //float offset = (dim-1)*len*0.5;
        //float x = i*len - offset;
        //float y = j*len - offset;
        //float z = k*len - offset;
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x,y,z);
        //cube [i][j][k] = new Cubie(x, y, z, len);
        cube [index] = new Cubie(matrix,x,y,z);
        index++;
      }
    }
  }
  //cube [2].c = color(255,0,0);
  //cube [0].c = color(0,0,255);
  //turnZ();
  for(int i = 0; i<50; i++){
    int r = int(random(allMoves.length));
    //if(random(1) < 0.5){
    //  sequence += allMoves[r];
    //}
    //else {
    //  sequence += allMoves[r].toUpperCase();
    //}
    Move m = allMoves [r];
    sequence.add(m);
  }
  currentMove = sequence.get(counter);
  //for(int i = sequence.length() - 1; i >= 0; i--) {
  //  String nextMove = flipCase(sequence.charAt(i));
  //  sequence += nextMove;
  //}
  //move = new Move(0,1,0,1);
  println(sequence);
}
//String flipCase(char c) {
//  String s = "" + c;
//  if(s.toLowerCase().equals(s)) {
//    return s.toUpperCase();
//  }
//  else {
//    return s.toLowerCase();
//  }
  
//}
  int index = 0;
  
void turnZ(int index, int dir){
  for(int i = 0; i<cube.length; i++) {
    Cubie qb = cube[i];
  if(qb.z == index) {
    //println(qb.x,qb.y);
    //PMatrix2D matrix1 = new PMatrix2D();
    //matrix1.translate(qb.x, qb.y);
    //matrix1.print();
    
    PMatrix2D matrix = new PMatrix2D(); 
    matrix.rotate(dir*HALF_PI);
    matrix.translate(qb.x, qb.y);
    matrix.print();
    qb.turnFacesZ(dir);
    qb.update(round(matrix.m02),round(matrix.m12),round(qb.z));
    print("----------");
}
  
  }
  
}

void turnY(int index, int dir){
  for(int i = 0; i<cube.length; i++) {
    Cubie qb = cube[i];
  if(qb.y == index) {
    //println(qb.x,qb.y);
    //PMatrix2D matrix1 = new PMatrix2D();
    //matrix1.translate(qb.x, qb.y);
    //matrix1.print();
    
    PMatrix2D matrix = new PMatrix2D(); 
    matrix.rotate(dir*HALF_PI);
    matrix.translate(qb.x, qb.z);
    matrix.print();
    qb.turnFacesY(dir);
    qb.update(round(matrix.m02),qb.y,round(matrix.m12));
    print("----------");
}
  
  }
  
}

void turnX(int index, int dir){
  for(int i = 0; i<cube.length; i++) {
    Cubie qb = cube[i];
  if(qb.x == index) {
    //println(qb.x,qb.y);
    //PMatrix2D matrix1 = new PMatrix2D();
    //matrix1.translate(qb.x, qb.y);
    //matrix1.print();
    
    PMatrix2D matrix = new PMatrix2D(); 
    matrix.rotate(dir*HALF_PI);
    matrix.translate(qb.y, qb.z);
    matrix.print();
    qb.turnFacesX(dir);
    qb.update(qb.x,round(matrix.m02),round(matrix.m12));
    print("----------");
}
  
  }
  
}

void draw() {
  background(0);
  currentMove.update();
  //if(started) {
  if (currentMove.finished()) {
    if(counter < sequence.size()-1){
    counter++;
    currentMove = sequence.get(counter);
    currentMove.start();
    }
  }
  //}
  println(frameCount);
//  if(started) {
//  if(frameCount % 40 == 0){
    
//  if(counter < sequence.length()){
//  char move = sequence.charAt(counter);
//  applyMove(move);
//  counter ++;
//  }
//  }
//}
  scale(50);
  for(int i = 0; i<cube.length; i++){
    push();
    if (abs(cube[i].z) > 0 && cube [i].z == currentMove.z) {
    rotateZ(currentMove.angle);
    }
    else if (abs(cube[i].x) > 0 && cube [i].x == currentMove.x) {
    rotateX(currentMove.angle);
    }
    else if (abs(cube[i].y) > 0 && cube [i].y == currentMove.y) {
    rotateY(-currentMove.angle);
    }
    cube[i].show();
    pop();
  }
  //for(int i = 0; i<dim; i++) {
  //  for(int j = 0; j<dim; j++) {
  //    for (int k = 0; k<dim; k++) {
  //      cube [i][j][k].show();
  //    }
  //  } 
  //}
  
  
}
