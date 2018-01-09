class ChaosTriangle{
  
  int dot1x;
  int dot1y;
  int dot2x;
  int dot2y;
  int dot3x;
  int dot3y;
   
  //Constructor
  ChaosTriangle(int tempdot1x, int tempdot1y,int tempdot2x, int tempdot2y,int tempdot3x, int tempdot3y){ 

    dot1x = tempdot1x;
    dot1y = tempdot1y;
    dot2x = tempdot2x;
    dot2y = tempdot2y;
    dot3x = tempdot3x;
    dot3y = tempdot3y;
  }
  
  //Draws the Triangle
  void display(){
    triangle(dot1x,dot1y,dot2x,dot2y,dot3x,dot3y);    
  }
  
  
}