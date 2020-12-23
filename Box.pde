  class Cubie {
  //PVector pos;
  PMatrix3D matrix;
  int x = 0;
  int y = 0; 
  int z = 0;
  color c;
  Face[] faces = new Face[6];
  //float len;
  //Cubie(float x, float y, float z, float len_)  {
    Cubie(PMatrix3D m, int x, int y, int z)  {
    //pos = new PVector(x,y,z);
    matrix = m;
    //len = len_;  
    this.x = x;
    this.y=y;
    this.z = z;
    c = color(255);
    faces[0] = new Face(new PVector(0,0,-1),color(0,0,255));
    faces[1] = new Face(new PVector(0,0,1), color(0,255,0));
    faces[2] = new Face(new PVector(0,1,0), color(255,255,255));
    faces[3] = new Face(new PVector(0,-1,0), color(255,255,0));
    faces[4] = new Face(new PVector(1,0,0), color(255,150,0));
    faces[5] = new Face(new PVector(-1,0,0), color(255,0,0));
  }
  void turnFacesZ(int dir) {
    for(Face f: faces)  {
      f.turnZ(dir*HALF_PI);
      }
    
  }
  
  void turnFacesY(int dir) {
    for(Face f: faces)  {
      f.turnY(dir*HALF_PI);
      }
    
  }
  
  void turnFacesX(int dir) {
    for(Face f: faces)  {
      f.turnX(dir*HALF_PI);
      }
    
  }
  
  void update(int x, int y, int z) {
   matrix.reset();
   matrix.translate(x,y,z);
    this.x = x;
    this.y=y;
    this.z = z;
  }
  void show() {
    //fill(c);
    noFill();
    stroke(0);
    strokeWeight(0.1);
    pushMatrix();
    applyMatrix(matrix);
    box(1);
    for(Face f: faces) {
      f.show();
    }
    /*translate(pos.x, pos.y, pos.z);
    //box(len);
    beginShape(QUADS);
    float r = len/2;
    //code for z-axis
    
    //code for back face
    fill(colors[BCK]);
    vertex(-r, -r, -r);
    vertex(r,-r, -r);
    vertex(r,r, -r);
    vertex(-r, r, -r);
    
    //code for front face
    fill(colors[FRT]);
    vertex(-r, -r, r);
    vertex(r,-r, r);
    vertex(r,r, r);
    vertex(-r, r, r);
    
    //code for x-axis
    
    //code for left face
    fill(colors[LFT]);
    vertex(-r, -r, -r);
    vertex(-r, r, -r);
    vertex(-r, r, r);
    vertex(-r,-r,r);
    
    //code for right face
    fill(colors[RGT]);
    vertex(r,-r,-r);
    vertex(r,r,-r);
    vertex(r,r,r);
    vertex(r, -r, r);
    
    //code for y-axis
    
    //code for up face
    fill(colors[UPP]);
    vertex(-r,-r,-r);
    vertex(r,-r,-r);
    vertex(r,-r,r);
    vertex(-r,-r,r);
    
    //code for down face
    fill(colors[DWN]);
    vertex(-r,r,-r);
    vertex(r,r,-r);
    vertex(r,r,r);
    vertex(-r,r,r);
   
    
    endShape();*/
    popMatrix();
  }
  
}
