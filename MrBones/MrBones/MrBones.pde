

// #1 : create a grid *Tick*
// #2 : Creating a placeholder object *Tick*
//   #1 : make object follow mouse *Tick*
//   #2 : make object place when clicked *Tick*
//   #3 : make object pickable when clicked *Tick*
// #3 : making object snap to said grid *tick*
// #4 : make object place snapped to grid *tick*
// #5 : directional placement
//    #1 : indicate direction *tick*
//    #2 : allow rotation using "r" *tick* //note: doesn't work with uneven shapes e.g. 2x3
// #6 : Purchase items *tick*
//   #1 : purchase generic item *tick*
//   #2 : choose item type (types of items); *tick*
// Future proof performance in relation to rendering
// this can probably be done by applying transformations and drawing as a PShape rather than just rect.
// this will take strain off CPU and utilise GPU.
//
// other things to consider is objects cannot be placed intersecting other objects
// consider implementing a quadtree system to reduce the load of this in the long run

// give specific items an inventory to hold things (such as other items for now but eventually only specific items)
 
 Grid grid = new Grid(600,600,20);
 WorldEngine worldengine; 

void setup() {
  
  size(600,600);
  grid.DrawGrid();
  ArrayList<WorldObject> objects = new ArrayList<WorldObject>();
  
  worldengine = new WorldEngine(objects);
  
}

void draw() {
  background(100);
  grid.DrawGrid();
  worldengine.Tick(mouseX,mouseY);
}

void mousePressed() {
 worldengine.MousePress(mouseX,mouseY);
}

void keyPressed() {
 worldengine.KeyPress(key, mouseX, mouseY); 
}
