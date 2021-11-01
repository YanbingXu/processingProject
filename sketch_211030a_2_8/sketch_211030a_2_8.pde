Mover[] movers = new Mover[10];
void setup(){
  size(640,320);
  background(255);
  
  for(int i =0; i<movers.length; i++){
    movers[i] = new Mover(random(0.5, 2.5), random(width), random(height));
  }
}

void draw(){
  background(255);
  
  for (int i = 0; i<movers.length; i++){
    for(int j = 0; j<movers.length;j++){
      if(j != i){
        PVector attract = movers[j].attract(movers[i]);
        movers[i].applyforce(attract);
      }
    }
    movers[i].update();
    movers[i].display();
  }
}
