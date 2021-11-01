float angle = 0;
void setup(){
  size(200, 200);
 
}

void draw(){
  background(255);
 
  angle += 20;
  translate(width / 2, height / 2);
  rotate(angle);
  line(-50, 0, 50, 0);
  ellipse(50, 0, 8, 8);
  ellipse(-50, 0, 8, 8);
}
