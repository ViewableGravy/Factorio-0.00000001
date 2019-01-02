

// #1 : create a grid *Tick*
// #2 : Creating a placeholder object *Tick*
//   #1 : make object follow mouse *Tick*
//   #2 : make object place when clicked *Tick*
//   #3 : make object pickable when clicked *Tick*
// #3 : making object snap to said grid *tick*
// #4 : make object place snapped to grid *tick*
 
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
  worldengine.DrawObjects();
  worldengine.Tick(mouseX,mouseY);
}

void mousePressed() {
 worldengine.MousePress(mouseX,mouseY);
}
