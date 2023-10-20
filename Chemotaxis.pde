
ball swarm[] = new ball[100];
healthCell healthy = new healthCell(250,250,50);
boolean infected;


void setup(){
size(750,750);
background(98, 150, 224);
for(int x = 0; x < swarm.length; x++)
  swarm[x] = new ball((int)(Math.random()*750),(int)(Math.random()*750), (int)(Math.random()*255));
}


void draw(){
  background(98,150,224);
  for (int x = 0; x < swarm.length; x++){
     
    swarm[x].show();
    swarm[x].walk();
    swarm[x].infection();
   //loop to loop object functions
  }
  
  healthy.show();
  healthy.move();
  healthy.health();
}

class ball{
int myX, myY, mySize, myColor;
ball(int x, int y, int z){
  myX = x;
  myY = y;
 
  mySize = 20;
  myColor = z;
}
 void show(){
   fill(myColor);
   ellipse(myX, myY, mySize, mySize);
   //draws a circle with the color from the variable myColor and positions + size
 }
  void walk(){
    if(mouseX > myX)
      myX += (int)(Math.random()*13-5);
    if(mouseX < myX)
      myX -= (int)(Math.random()*13-5);
      //move balls towards mouse x
      
    if(mouseY > myY)
      myY += (int)(Math.random()*13-5);
    if(mouseY < myY)
      myY -= (int)(Math.random()*13-5);
      //move balls towards mouse y
    
    
    //balls/bacterium will move towards the mouse (only for x axis)
    
    if(myX > 750)
    myX = 0;
    if(myX < 0)
    myX = 750;
    if(myY > 750)
    myY = 0;
    if(myY < 0)
    myY = 750;
    //makes sure that the balls stay on the sscreen and doesn't move into the empty space forever
  }
     void infection(){
         if (dist(mouseX,mouseY,myX,myY)<100){
      infected = true;}
       else{
       infected = false;}
     }
    //  If the bacter is close enough to the mouse, the green cell turns black
      
  
//make sure to include an extra parameter to the constructor, which stores the color variable
//
    
  
  
}

class healthCell{
  int myX,myY,mySize,myColor;
  
 
  healthCell(int x, int y, int z){
    myX = x;
    myY = y;
    mySize = z;
    myColor = color(20,255,30);
  }
  
  void show(){
    fill(myColor);
   ellipse(myX, myY, mySize, mySize);
  }
  
  void move(){
   myX = mouseX;
   myY = mouseY;
  //green cell will follow mouse
  }
  
  void health(){
    if (infected == true)
    myColor = 0;
    else
    myColor = color(20,255,30);
    //cell turns black when close enough to bacteria, otherwise, it stays green
  }
    
  
}
