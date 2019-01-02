

public class Hotbar {
  int _x, _y, _width, _height;
  public Hotbar(int x, int y, int wid, int hei) {
    _x = x;
    _y = y;
    _width = wid;
    _height = hei;
  }
  
  public void Display() {
    rect(_x,_y,_width,_height);
  }
  
  public void Display(int r, int g, int b) {
   pushMatrix();
   fill(r,g,b);
   rect(_x,_y,_width,_height);
   popMatrix();
  }
  
  public boolean Clicked(float mousex,float mousey) {
    return mousex < _x + _width && mousex > _x && mousey < _y + _height && mousey > _y;
  }
}
