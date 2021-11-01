 int gridsize = 10;
  
 int cols = height / gridsize;
 int rows = width / gridsize;
 
 int zoff = 0;
 PVector[] flowField;
 
 Particles[] particles = new Particles[200];
void setup(){
  size(640, 320,P2D);
  orientation(LANDSCAPE);
  
  background(0);
  hint(DISABLE_DEPTH_MASK);
  
 cols = width / gridsize;
 rows = height / gridsize;
 
 flowField = new PVector[cols * rows];
 
 for(int i =0; i<particles.length; i++){
   particles[i] = new Particles();
 }
 
  

  
}

void draw(){
  fill(0.7);
  rect(0, 0 ,width, height);
  noFill();
  
  float yoff = 0;
  float xstep = 0.02;
  float ystep = 0.03;
  float zstep = 0.01;
  for(int j = 0; j<rows; j++){
    float xoff = 0;
    for (int i = 0; i<cols; i++){
      int index = (i + j * cols);
      
      float angle = noise(xoff, yoff,zoff) * TWO_PI;
      PVector p = PVector.fromAngle(angle);
      
      p.setMag(0.01);
      
      flowField[index] = p;
      
      stroke(0, 50);
      
      pushMatrix();
      
      translate(i * gridsize, j*gridsize);
      rotate(p.heading());
      line(0, 0, gridsize, 0);
      
      popMatrix();
      
      
      xoff += xstep;
      
    }
    yoff += ystep;
  }
  zoff +=zstep;
  
  for(int i = 0; i<particles.length; i++){
    particles[i].follow(flowField);
    particles[i].update();
    particles[i].edge();
    particles[i].show();
  }
}
