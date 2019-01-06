
public class UI {

  Hotbar hotbar; 
  public UI() {
    hotbar = new Hotbar(50, 500, 500, 80, grid.spacing);
  }

  public WorldObject PurchaseItems(float mousex, float mousey) {
    WorldObject obj;
    /*
    if (StarterObjectSelected(mousex, mousey)) {
      obj = new WorldObject("name", "A random object (1)", 40, 40, grid.spacing);
       obj = SelectObject(mousex,mousey);
    } else {
        throw new MrBonesException("object cannot be added");
    }
    return obj;
    */
    
    if ((obj = SelectObject(mousex,mousey)) == null) {
        throw new MrBonesException("object cannot be added");
    }
    return obj;
  }


  public void DrawHotbar() {
    hotbar.Display(0, 0, 255);
  }

  public boolean StarterObjectSelected(float mousex, float mousey) {
    return hotbar.Clicked(mousex, mousey);
  }
  
  public WorldObject SelectObject(float mousex, float mousey) {
    return hotbar.SelectObject(mousex,mousey);
  }
}
