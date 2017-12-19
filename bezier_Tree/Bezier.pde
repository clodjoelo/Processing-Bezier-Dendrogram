

class Bezier {
  Vec2D orig;
  Vec2D dest;
  float anchorOneX;
  float anchorOneY;
  float anchorTwoX;
  float anchorTwoY;
  float controlPointOneX;
  float controlPointOneY;
  float controlPointTwoX;
  float controlPointTwoY;
  float angle1;
  float angle2;
  color nodeColor;
  String branchName;
  boolean hoverWord = false;
  float thickness;
  
  
     Bezier(float _endY,float _startY,float _endX,float _startX,float _ang2,float _ang1,color _nC, String _bN) {  
         anchorOneY =_startY;
         anchorTwoY = _endY;
         anchorOneX =_startX;
         anchorTwoX=_endX;
         angle1 = _ang1;
         angle2 = _ang2;
         nodeColor = _nC;
         branchName = _bN;
         thickness = 1;
     }
       
     void setVec2d(){
       orig = new Vec2D (anchorOneX,anchorOneY);
       dest = new Vec2D (anchorTwoX,anchorTwoY);
       setLength(orig,dest);
  }
 
 /*find the length in a straight line between 
 origin and end poin of bezier*/    
  void setLength(Vec2D o, Vec2D d){
    float lngth = o.distanceTo(d);
    setAngle(lngth);
  }
  
 /*finalise or angles so that we can define
  polar co-ordinates that become our control points
  = 1 angle from the start point of bezier and 1 angle
  from end point of bezier pointed at radius extacly 
   half of the straight line distance between the two
   gives us the nice "s" shape"
 */    
  void setAngle(float l){
     if(anchorTwoY>anchorOneY){
       angle1 = 357;
     }
       float theta1 = radians(angle1);
       float theta2 = radians(angle2);
       float halfway = l/2;
       setControlPoints(theta1,theta2,halfway);
  }
  
  /*now that we know the distance and angles for the two control
 points we set as as polar co-ords 
 then convert to cartesian */   
  
  void setControlPoints(float t1,float t2, float h){ 
    Vec2D polar1 = new Vec2D (h,t1);
    Vec2D circ1 = new Vec2D (polar1.copy().toCartesian());
    Vec2D polar2 = new Vec2D (h,t2);
    Vec2D circ2 = new Vec2D (polar2.copy().toCartesian());
   
    controlPointOneX = orig.x+circ1.x;
    controlPointOneY = orig.y+circ1.y;
    controlPointTwoX = dest.x+circ2.x;
    controlPointTwoY = dest.y+circ2.y;
   }
   
   void name(){
     fill(255);
     ellipse(dest.x,dest.y,5,5);
     textSize(10);
     text(branchName,dest.x+5,dest.y+3);
   }
   
   void isHoverWord(){
    float wdth = textWidth(branchName);
     if(mouseX>dest.x+5 && mouseX< dest.x+5+wdth && mouseY>dest.y-5 && mouseY < dest.y+3){
        thickness = 3;
     }
     else{
       thickness = 1;
     } 
   }
   
   void isHoverWordParent(){
     textSize(12);
    float wdth = textWidth(branchName)+4;
     if(mouseX>dest.x-wdth && mouseX<dest.x && mouseY>dest.y-5 && mouseY < dest.y+3){
        thickness = 3;
     }
     else{
       thickness = 1;
     } 
   }
   
   void nameParent(){
     fill(255);
     ellipse(dest.x,dest.y,5,5);
     textSize(12);
     float wdth = textWidth(branchName)+4;
     text(branchName,dest.x-wdth,dest.y+3);
   }
   
   void display(){
     noFill();
     stroke(nodeColor);
     strokeWeight(thickness);
     bezier(orig.x,orig.y,controlPointOneX,controlPointOneY,controlPointTwoX,controlPointTwoY,dest.x,dest.y);
     noStroke();
   }
   
  
}
