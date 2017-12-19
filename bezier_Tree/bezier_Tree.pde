/* spatial tree dendrogram
joel porter 2015-2017*/


import toxi.geom.*;
import toxi.math.*;
Data dataSet;



void setup(){
  size(700,720);
  dataSet = new Data();
  dataSet.setTrees();
}

void draw(){
  background(0,0,0);
  dataSet.displayNodes();
}
