class Particles{
  PVector acc = new PVector(0, 0);
  PVector vel= new PVector(0, 0);
  PVector loc = new PVector(random(width), random(height));
  float maxspeed = 1.0;
  
  PVector prevloc = loc.copy();
  
  
  void applyforce(PVector force){
    acc.add(force);
  }
  
  void follow(PVector[] flowField){
    int x = floor(loc.x / gridsize);
    int y = floor(loc.y / gridsize);
    
    int index = (x -1) + (y-1) * cols;
    
    index -= 1;
    
    if(index > flowField.length || index <0){
      index = flowField.length - 1;
    }
    
    applyforce(flowField[index]);
  }
  
  void updatePrev(){
    prevloc.x = loc.x;
    prevloc.y = loc.y;
  }
  
  void update(){
    vel.add(acc);
    vel.limit(maxspeed);
    loc.add(vel);
    
    acc.mult(0);
  }
  
  void edge(){
    if (loc.x > width) {
      loc.x = 0;
      updatePrev();
    }else if(loc.x < 0){
      loc.x = width;
      updatePrev();
    }
    
    if (loc.y > height) {
      loc.y = 0;
      updatePrev();
    }else if(loc.y < 0){
      loc.y = height;
      updatePrev();
    }
  }
  
  void show(){
    stroke(255, 50);
    strokeWeight(2);
    //ellipse(loc.x, loc.y, 10,10);
    point(loc.x, loc.y);
  }
}
