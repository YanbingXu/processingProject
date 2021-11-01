Attractor attractor;
Mover mover[] = new Mover[10];
void setup(){
  size(640,320);
  background(255);
  
  attractor = new Attractor();
  for(int i = 0; i< mover.length; i++){
    mover[i] = new Mover(random(0.5, 2.5), random(width), random(height));
  }
}

void draw(){
  background(255);
  
  attractor.display();
  
  for (int i = 0; i<mover.length; i++){
    mover[i].applyForce(attractor.createAttractForce(mover[i]));
    mover[i].update();
    
  
    mover[i].display();
  }
}
