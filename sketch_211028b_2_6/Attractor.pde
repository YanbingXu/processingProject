class Attractor{
  PVector location;
  float mass;
  float G;
  
  Attractor(){
    location = new PVector(width / 2, height / 2);
    mass = 20;
    G = 0.4;
  }
  
  void display (){
    stroke(0);
    fill(175, 200);
    
    ellipse(location.x, location.y, mass * 5, mass * 5);
  }
  
  PVector createAttractForce(Mover mover){
    PVector dir = PVector.sub(location, mover.location);
    float dirMag = dir.mag();
    dirMag = constrain(dirMag, 5, 25);
    
    dir.normalize();
    
    float strength = G *mass * mover.mass / dirMag / dirMag;
    
    PVector force = dir.mult(strength);
    
    return force;
  }
}
