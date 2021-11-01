class Mover{
  float mass;
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  Mover(float m, float x, float y){
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void display(){
    stroke(0);
    fill(100);
    
    ellipse(location.x, location.y, mass * 5, mass * 5);
  }
  
  void applyForce(PVector force){
    acceleration.add(PVector.div(force, mass));
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
}
