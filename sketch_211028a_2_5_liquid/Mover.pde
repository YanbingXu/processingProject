class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  Mover(float m, float x, float y){
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    mass = m; 
  }
  
  void applyforce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void display(){
    fill(175);
    stroke(0);
    
    ellipse(location.x, location.y, 16*mass, 16*mass);
  }
  
  void checkedge(){
    if(location.x > width){
      velocity.x *= -1;
      location.x = width;
    }else if(location.x <0){
      velocity.x *= -1;
      location.x = 0;
    }
    
    if(location.y > height){
      location.y = height;
      velocity.y *= -1;
    }else if(location.y < 0){
      location.y = 0;
      velocity.y *= -1;
    }
  }
  
  boolean isInside(Liquid liquid){
    if((location.x > liquid.x) && location.x < (liquid.x +liquid.w) && location.y>liquid.y && location.y < (liquid.y + liquid.h)){
      return true;
    }else{
      return false;
    }
  }
  
  void drag(Liquid liquid){
    float v = velocity.mag();
    float dragMag = v*v*liquid.c;
    
    PVector drag = PVector.mult(velocity,-1);
    drag.normalize();
    
    drag.mult(dragMag);
    
    applyforce(drag);
  }
}
