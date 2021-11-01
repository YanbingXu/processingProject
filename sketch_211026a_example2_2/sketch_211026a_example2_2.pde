Mover movers[] = new Mover[100];
void setup(){
  size(640, 320);
  fill(175);
  background(255);
  
  for(int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(0.1, 5.0),00, 0);
  }
}

void draw(){
  background(255);
  
  PVector wind = new PVector(0.01, 0);
  PVector gravity = new PVector(0, 0.1);
  for(int i = 0; i<movers.length; i++){
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].update();
    movers[i].checkedge();
    movers[i].display();
  }
  
}

class Mover{
  PVector velocity;
  PVector acceleration;
  PVector location;
  float mass;
  
  Mover(float m, float x, float y){
    velocity = new PVector(x, y);
    location = new PVector(0, 0);
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
      velocity.x *= -1;
      location.x = width;
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
    
    ellipse(location.x,location.y, mass * 16, mass * 16);
  }
}
