Mover movers[] = new Mover[20];
Liquid liquid = new Liquid(0, 220, 640, 100, 0.1);
void setup(){
  size(640,320);
  background(255);
  
  for(int i = 0; i<movers.length; i++){
    movers[i] = new Mover(random(0.5, 2.5), 10+ 20*i, 20);
  }
}

void draw(){
  background(255);
  
  liquid.display();
  
  for (int i = 0; i<movers.length; i++){
    //PVector wind = new PVector(0.01, 0);
    PVector gravity = new PVector(0, 0.1 * movers[i].mass);
    if(movers[i].isInside(liquid)){
      movers[i].drag(liquid);
    }
    //movers[i].applyforce(wind);
    movers[i].applyforce(gravity);
    movers[i].update();
    movers[i].display();
    movers[i].checkedge();
  }
  
}
