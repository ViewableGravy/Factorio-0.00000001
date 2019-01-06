

public class Hotbar {
  int _x, _y, _width, _height;
  ObjectButton objectButtons[] = new ObjectButton[1];
  public Hotbar(int x, int y, int wid, int hei,int spacing) {
    _x = x;
    _y = y;
    _width = wid;
    _height = hei;
    objectButtons[0] = new ObjectButton(new PVector(_x,_y),_width,_height, "name", "a random chest", spacing); ;
  }
  
  public void Display() {
    //rect(_x,_y,_width,_height);
     for (ObjectButton button : objectButtons) {
      button.display(); 
     }
  }
  
  public void Display(int r, int g, int b) {
   pushMatrix();
   fill(r,g,b);
   rect(_x,_y,_width,_height);
   popMatrix();
  }
  
  public WorldObject SelectObject(float mousex, float mousey) {
    for (ObjectButton button : objectButtons) {
     if (button.OnShape(mousex,mousey)) {
      return button.GetObjs(); 
     }
    }
    return null;
  }
  public boolean Clicked(float mousex,float mousey) {
    return mousex < _x + _width && mousex > _x && mousey < _y + _height && mousey > _y;
  }
}
