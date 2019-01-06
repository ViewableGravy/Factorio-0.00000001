

public class Hotbar {
  int _x, _y, _width, _height;
  ObjectButton objectButtons[] = new ObjectButton[2];
  public Hotbar(int x, int y, int wid, int hei,int spacing) {
    _x = x;
    _y = y;
    _width = wid;
    _height = hei;
    objectButtons[0] = new ChestObjectButton(new PVector(_x,_y),_width/2,_height, "Chest Button", "An object to purchase chests from", spacing, color(0,144,144));
    objectButtons[1] = new TwoByTwoButton(new PVector(_x + _width/2, _y), _width/2,_height,"2x2 button", "a rotatable object", spacing, color(144,0,144));
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
