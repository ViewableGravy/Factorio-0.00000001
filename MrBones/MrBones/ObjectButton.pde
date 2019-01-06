
public class ObjectButton {

  private WorldObject obj;
  private int _width, _height;
  private PVector center;
  private int _spacing;
  private String name, desc;
  public ObjectButton(PVector pos, int width, int height, String name, String Desc, int spacing) {
    _spacing = spacing;
    center = pos;
    _width = width;
    _height = height;
  }

  public WorldObject GetObjs() {
    // make inherited and change depending on what it is meant to return in child classes
    //return new Chest(name, desc, _spacing);
    return new WorldObject("name", "A random object (1)", 40, 40, grid.spacing);
  }

  public void display() {
    rect(center.x, center.y, _width,_height);
  }

  private boolean OnShape(float mousex, float mousey) {
    boolean onShape = false;
    if (mousex > (center.x) && mousex < (center.x + _width) && mousey < (center.y + _height) && mousey > (center.y)) {
      onShape = true;
    }
    println(onShape,center.x,center.y,_height,_width);
    return onShape;
  }
}
