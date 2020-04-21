//create 500 objects

Mover[] movers = new Mover[500];

void setup(){
  size(900,640);
  background(#CE1537);
  for(int i = 0; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(#CE1537);
  
  for(int i = 0; i < movers.length; i++){
  movers[i].update();
  movers[i].checkEdges();
  movers[i].display();
  movers[i].keyPressed();
  movers[i].mousePressed();
  }
}
