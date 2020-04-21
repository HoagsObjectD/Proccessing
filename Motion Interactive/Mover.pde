class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector keyPressedAcc;
  PVector mousePressedAcc;
  
 Mover(){
  location = new PVector(random(width), random(height));
  velocity = new PVector(0,0);
  acceleration = new PVector(-0.0001, 0.01);
  keyPressedAcc = new PVector(0.1, 0.01);
  mousePressedAcc =  new PVector(-0.0001, 0.01);
 }
  
 void update(){
   
   //the mover will move randomly
   //acceleration = PVector.random2D();
   //acceleration.mult(0.5);
   
   //the object follows the mouse
   PVector mouse = new PVector(mouseX, mouseY);
   PVector dir = PVector.sub(mouse, location);
   
   dir.normalize();
   dir.mult(0.5);
   acceleration = dir;
    
   
   velocity.add(acceleration);
   location.add(velocity);
   velocity.limit(10);
   
 }
  void keyPressed(){
    
    //if a key is pressed, the acceleration increases
    if(keyPressed == true){
    velocity.add(keyPressedAcc);
    location.add(velocity);
    }
  }
 
 //if the mouse is pressed, the acceleration decreases
 void mousePressed(){
   if(mousePressed == true){
   velocity.add(mousePressedAcc);
   location.sub(velocity);
   }
 }
 
  void display(){
    stroke(0);
    strokeWeight(2);
    fill(#6115CE);
    ellipse(location.x,location.y,44,44);
  }
  
  // Display mover at the other side
  void checkEdges(){
    if(location.x > width){
      location.x = 0;
    }
    else if(location.x < 0){
      location.x = width;
    }
    if(location.y > height)
      location.y = 0;
      
    else if(location.y < 0){
       location.y = height;
    }
  }
}
