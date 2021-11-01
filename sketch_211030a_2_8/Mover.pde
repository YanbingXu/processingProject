class Mover{
  float mass;
  PVector location;
  PVector velocity;
  PVector acceleration;
  float G;
  
  Mover(float m, float x, float y){
    mass = m;
    G = 0.4;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void display(){
    stroke(0);
    fill(175);
    
    ellipse(location.x, location.y, mass * 10, mass * 10);
  }
  
  PVector attract(Mover mover){
    PVector force = PVector.sub(location, mover.location);
    float distance = force.mag();
    force.normalize();
    
    distance = constrain(distance, 5.0, 25);
    
    float strength = G * mass * mover.mass / (distance * distance);
    
    return force.mult(strength);
    
  }
  
  void applyforce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
}
