/*

1) Take 3 points in a plane to form a triangle 
2) Randomly select any point and consider that your current position
3) Randomly select any one of the 3 Chaos Triangle Points
4) Move half the distance from your current position to the selected Triangle Point
5) Draw a Chaos Dot at the current position
6) Repeat from step 3.

*/

//Datatype ChaosTriangle, name t
ChaosTriangle t;

//Creates an Array of Chaos Dots
ChaosDot[] ChaosDots = new ChaosDot[30000000];

//total number of Chaos Dots
int TotalChaosDots = 0;

//Random Choice of Corner
int cornerChoice;

//Corners the Triangle Consists of
int ChaosTriangleDot1x;
int ChaosTriangleDot1y;
int ChaosTriangleDot2x;
int ChaosTriangleDot2y;
int ChaosTriangleDot3x;
int ChaosTriangleDot3y;

//The momentary Chaos Dot
float momentaryChaosDotx;
float momentaryChaosDoty;

//Animation Speed
float animationSpeed;

void setup(){
  
  //Window Size
  size(1300,900, P3D);

  //Generates the Chaos Triangle. 
  //It gens generated Semi-Random. While the edges have some variation to them, 
  //they are not arbitrary (to make sure we get a decent triangle every time, not some odd form)
  ChaosTriangleDot1x = width - width + (int)random(6,150);
  ChaosTriangleDot1y = height - (int)random(6,150);
  ChaosTriangleDot2x = width - (int)random(6,200);
  ChaosTriangleDot2y = height - (int)random(6,200);
  ChaosTriangleDot3x = width / 2;
  ChaosTriangleDot3y = height - height  + (int)random(6,150);
  
  
  //Initializing the first Chaos Dot, the random one it all starts with.
  //Also semi-Random, so it gets drawn in the visible area of the window.
  momentaryChaosDotx = random(width - width + 5, width - 5);
  momentaryChaosDoty = random(height - height + 5, height - 5);
  
  
  //Creates the Chaos Triangle
  t = new ChaosTriangle(ChaosTriangleDot1x, ChaosTriangleDot1y, ChaosTriangleDot2x, ChaosTriangleDot2y, ChaosTriangleDot3x, ChaosTriangleDot3y);


  //Sets the first, random Chaos Dot
  ChaosDots[0] = new ChaosDot(momentaryChaosDotx,momentaryChaosDoty);

}

//Draws everything
void draw(){

  background(0);
  stroke(255,140);
  noFill();
  strokeWeight(2);  
  
  //Calls the Display Function of Object t (for Triangle)
  t.display();
  
  //Creates the Chaos Dots
  createChaosDots();
  
  //Runs through the Array and displays all dots yet created.
  for(int i = 0; i <= TotalChaosDots; i++){   
      ChaosDots[i].display();
  }
  
  //Onscreen Stats 
  fill(0, 102, 153);
  textSize(20);
  text("Number of Chaos Dots Calculated: " + TotalChaosDots, 30, 60);
  text("Calculations Delayed by " + animationSpeed + " ms", 30, 90);
  
  fill(0, 102, 300);
  textSize(10);
  text("Move mouse to the right to slow Calculation down. ", 30, 110);
  text("Move mouse to the left to speed up the calculation. ", 30, 130);
  noFill();
}

//Calculates the Chaos Dots
void createChaosDots(){
  
  //Variables for the Delta (divided by 2) from the ChaosDot to the Corner of the Triangle
  float halfDeltaDotx;
  float halfDeltaDoty;
  
  float deltaDotTempx;
  float deltaDotTempy;
  
  deltaDotTempx = momentaryChaosDotx;
  deltaDotTempy = momentaryChaosDoty;

 
   //Random Corner Choice of the Triangle
  cornerChoice = (int) random(1,4);
  
  // ### Cornerchoice 1 #####
  if(cornerChoice == 1){
    
    //#### X Axis Part ###
    if(momentaryChaosDotx > ChaosTriangleDot1x){
      
      halfDeltaDotx = (momentaryChaosDotx - ChaosTriangleDot1x)/2;
      momentaryChaosDotx = momentaryChaosDotx - halfDeltaDotx;   
    }
    
    if(momentaryChaosDotx < ChaosTriangleDot1x){
      
      halfDeltaDotx = (ChaosTriangleDot1x -momentaryChaosDotx)/2;
      momentaryChaosDotx = momentaryChaosDotx + halfDeltaDotx;
    }
    
    //#### Y Axis Part ###
    if(momentaryChaosDoty > ChaosTriangleDot1y){
      
      halfDeltaDoty = (momentaryChaosDoty - ChaosTriangleDot1y)/2;
      momentaryChaosDoty = momentaryChaosDoty - halfDeltaDoty;   
    }
    
    if(momentaryChaosDoty < ChaosTriangleDot1y){
      
      halfDeltaDoty = (ChaosTriangleDot1y -momentaryChaosDoty)/2;
      momentaryChaosDoty = momentaryChaosDoty + halfDeltaDoty;
    }
    
    
    TotalChaosDots++;
    ChaosDots[TotalChaosDots] = new ChaosDot(momentaryChaosDotx,momentaryChaosDoty);
    stroke(0,255,0,100);
    line(momentaryChaosDotx,momentaryChaosDoty,ChaosTriangleDot1x,ChaosTriangleDot1y);
    stroke(255);
    stroke(255,0,0,100);
    line(momentaryChaosDotx,momentaryChaosDoty,deltaDotTempx,deltaDotTempy);
    stroke(255);  
     
  }

  // ### Cornerchoice 2 #####
  if(cornerChoice == 2){
    
    //#### X Axis Part ###
    if(momentaryChaosDotx > ChaosTriangleDot2x){
      
      halfDeltaDotx = (momentaryChaosDotx - ChaosTriangleDot2x)/2;
      momentaryChaosDotx = momentaryChaosDotx - halfDeltaDotx;   
    }
    
    if(momentaryChaosDotx < ChaosTriangleDot2x){
      
      halfDeltaDotx = (ChaosTriangleDot2x -momentaryChaosDotx)/2;
      momentaryChaosDotx = momentaryChaosDotx + halfDeltaDotx;
    }
    
    //#### Y Axis Part ###
    if(momentaryChaosDoty > ChaosTriangleDot2y){
      
      halfDeltaDoty = (momentaryChaosDoty - ChaosTriangleDot2y)/2;
      momentaryChaosDoty = momentaryChaosDoty - halfDeltaDoty;   
    }
    
    if(momentaryChaosDoty < ChaosTriangleDot2y){
      
      halfDeltaDoty = (ChaosTriangleDot2y -momentaryChaosDoty)/2;
      momentaryChaosDoty = momentaryChaosDoty + halfDeltaDoty;
    }
    
    
    TotalChaosDots++;
    ChaosDots[TotalChaosDots] = new ChaosDot(momentaryChaosDotx,momentaryChaosDoty);
    stroke(0,255,0,100);
    line(momentaryChaosDotx,momentaryChaosDoty,ChaosTriangleDot2x,ChaosTriangleDot2y);
    stroke(255);
    stroke(255,0,0,100);
    line(momentaryChaosDotx,momentaryChaosDoty,deltaDotTempx,deltaDotTempy);
    stroke(255);       
  }

  // ### Cornerchoice 3 #####
  if(cornerChoice == 3){
    
    //#### X Axis Part ###
    if(momentaryChaosDotx > ChaosTriangleDot3x){
      
      halfDeltaDotx = (momentaryChaosDotx - ChaosTriangleDot3x)/2;
      momentaryChaosDotx = momentaryChaosDotx - halfDeltaDotx;   
    }
    
    if(momentaryChaosDotx < ChaosTriangleDot3x){
      
      halfDeltaDotx = (ChaosTriangleDot3x -momentaryChaosDotx)/2;
      momentaryChaosDotx = momentaryChaosDotx + halfDeltaDotx;
    }
    
    //#### Y Axis Part ###
    if(momentaryChaosDoty > ChaosTriangleDot3y){
      
      halfDeltaDoty = (momentaryChaosDoty - ChaosTriangleDot3y)/2;
      momentaryChaosDoty = momentaryChaosDoty - halfDeltaDoty;   
    }
    
    if(momentaryChaosDoty < ChaosTriangleDot3y){
      
      halfDeltaDoty = (ChaosTriangleDot3y -momentaryChaosDoty)/2;
      momentaryChaosDoty = momentaryChaosDoty + halfDeltaDoty;
    }
    
    
    TotalChaosDots++;
    ChaosDots[TotalChaosDots] = new ChaosDot(momentaryChaosDotx,momentaryChaosDoty);
    stroke(0,255,0,100);
    line(momentaryChaosDotx,momentaryChaosDoty,ChaosTriangleDot3x,ChaosTriangleDot3y);
    stroke(255);
    stroke(255,0,0,100);
    line(momentaryChaosDotx,momentaryChaosDoty,deltaDotTempx,deltaDotTempy);
    stroke(255);    
     
  }
  
  //Matches the animation-Speed with the Mouse X Axis. 
  animationSpeed= map(mouseX, 0, width, 0, 1000);
  delay((int)animationSpeed);
}


//triangle(width - width + 5, height - 5, width -5, height -5, width / 2, height - height  + 5);    