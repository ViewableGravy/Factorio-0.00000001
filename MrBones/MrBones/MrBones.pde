
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
