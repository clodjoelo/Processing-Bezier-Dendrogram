class Node {
  int totalChild;
  float hght;
  float startYChildren;
  float parentEndY;
  float parentStartY;
  Bezier parent;
  ArrayList<Bezier> children = new ArrayList<Bezier>();
  color col;
  float parentEndX;
  float parentStartX;
  float childEndX;
  float gapChildren;
  int index;
   
   Node(int _c, float _y, float _h,color _cl,float _gP, int _iN){
     totalChild = _c;
     startYChildren = _y;
     hght = _h;
     col = _cl;
     gapChildren = _gP;
     parentEndX = 300;
     parentStartX = 100;
     childEndX = 500;
     parentStartY = height/2;
     gapChildren = _gP;
     index = _iN;
   }
   
  /*start point of children plus half of their vertical
  space = the end point of the primary branch*/
   public void setYPos(){
      parentEndY = startYChildren +hght/2; 
   }
   
   /*now we have our end point we can set the beziers*/
   public void setBezierOne(){
     String name = "Branch "+index;
     parent = new Bezier(parentEndY,parentStartY,parentEndX,parentStartX,180,0.03,col,name);
     parent.setVec2d();
   }
   
   /*and for children beziers we keep a consitent gap*/
   public void setChildBeziers(){
     float currentY = startYChildren;
     String name = "Child of Branch "+index;
     for(int i = 0; i<totalChild; i++){
          children.add(new Bezier(currentY,parentEndY,childEndX,parentEndX,180,0.03,col,name));
          currentY+=gapChildren;
     } 
     for(Bezier b : children){ 
         b.setVec2d();
     }
   }
   
   void displayBezier(){
     parent.isHoverWordParent();
     parent.display();
     parent.nameParent(); 
     for(Bezier b : children){
         b.isHoverWord();
         b.display();
         b.name();
     }
   }
   
}
