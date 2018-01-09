class ChaosDot{
  
  float ChaosDotx;
  float ChaosDoty;
  
 ChaosDot(float tempChaosDotx, float tempChaosDoty ){
   
   ChaosDotx = tempChaosDotx;
   ChaosDoty = tempChaosDoty;
 
 }
 
 void display(){
  
   strokeWeight(2);
   stroke(random(0,255),random(0,255),random(0,255),random(0,255));
   point(ChaosDotx,ChaosDoty);
   
 }
  
  
}