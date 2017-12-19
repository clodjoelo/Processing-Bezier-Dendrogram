
class Data {
  int [] children = new int[5];
  color [] cols = new color[5];
  ArrayList<Node> nodes = new ArrayList<Node>();
  
  public void setTrees(){
   /*we have 5 primary branches
   we initialy set how many children they have
   with a limit to 50 total children*/
    children[0] = 10;
    children[1] = 27;
    children[2] = 3;
    children[3] = 6;
    children[4] = 4;
    
   /*set a color for branches*/
    cols[0] = color(244,140,18);
    cols[1] = color(162,244,18);
    cols[2] = color(18,220,244);
    cols[3] = color(244,18,18);
    cols[4] = color(18,93,244);
    
    /*we set a top point for the children branches
    and deduce the vertical space they take up*/
    float startY = 20;
    float gap = 12.4;
    float gapEnd = gap+5;
    for(int i = 0; i< children.length; i++){
       color c = cols[i];
       float hght = gap*children[i];
      nodes.add (new Node(children[i],startY,hght,c,gap,i));
      startY = startY+hght+gapEnd;
    }
    
   /*working in reverse we then find end point of the primary branch
   by finding the the vertical half way point of the the children branch
   then set all out beziers*/
    for(Node n : nodes){
      n.setYPos();
      n.setBezierOne();
      n.setChildBeziers();
    }
  }
  
  void displayNodes(){
      for(Node n : nodes){
         n.displayBezier();
      }
    }
}
