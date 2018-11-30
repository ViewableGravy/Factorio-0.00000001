

// #1 : create a grid *Tick*
// #2 : Creating a placeholder object *Tick*
//   #1 : make object follow mouse *Tick*
//   #2 : make object place when clicked *Tick*
//   #3 : make object pickable when clicked *Tick*
// #3 : making object snap to said grid
// #4 : make object place snapped to grid

// made a separate class and thread but because of how processing works, it cannot take or give inputs from the dislay
// unless it is through the draw function. Use Java instead since that is stupid lol.
 
 Grid grid = new Grid(600,600,20);
 WorldEngine worldengine; 
 WorldObject obj1 = new  WorldObject(10,10,"name","A random object");

void setup() {
  size(600,600);
  grid.DrawGrid();
  worldengine = new WorldEngine(obj1);
  
}

void draw() {
  background(100);
  grid.DrawGrid();
  worldengine.DrawObjects();
}

void mousePressed() {
 worldengine.MousePress(); 
}
