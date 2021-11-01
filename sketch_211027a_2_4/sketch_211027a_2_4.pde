Mover movers[] = new Mover[20];
void setup(){
  size(640, 320);
  
  for(int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(0.5, 2.5), 0, 0);
  }
}

void draw(){
  background(255);
  

  for(int i = 0; i < movers.length; i++){
    PVector v = movers[i].velocity.get();
    PVector friction = v.mult(-1);
    friction.normalize();
    
    float mu = 0.05;
    float normal = 1;
    float fractionMag = mu * normal;
    
    friction.mult(fractionMag);
    
    PVector wind = new PVector(0.01, 0);
    float m = movers[i].mass;
    PVector gravity = new PVector(0, 0.1 * m);
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].applyForce(friction);
    movers[i].update();
    movers[i].display();
    movers[i].checkedge();
  }
  
}

class Mover{
  PVector velocity;
  PVector acceleration;
  PVector location;
  float mass;
  
  Mover(float m, float x, float y){
    velocity = new PVector(0, 0);
    location = new PVector(x, y);
    acceleration = new PVector(0,0);
    mass = m;
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void checkedge(){
    if(location.x > width){
      location.x = width;
       velocity.x *= -1;
    }else if(location.x < 0){
      velocity.x *= -1;
      location.x = 0;
    }
    
    if(location.y > height){
      velocity.y *= -1;
      location.y = height;
    }else if(location.y < 0){
      velocity.y *= -1;
      location.y = 0;
    }
    
  }
  
  void display(){
    stroke(0);
    fill(175);
    
    ellipse(location.x, location.y, mass * 16, mass * 16);
  }
}
