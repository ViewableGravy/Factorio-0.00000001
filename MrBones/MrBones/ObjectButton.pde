
public abstract class ObjectButton {

  protected WorldObject obj;
  protected int _width, _height;
  protected PVector center;
  protected int _spacing;
  protected String name, desc;
  protected color _colour;
  public ObjectButton(PVector pos, int width, int height, String name, String Desc, int spacing, color colour) {
    _spacing = spacing;
    center = pos;
    _width = width;
    _height = height;
    _colour = colour;
  }

  public abstract WorldObject GetObjs();

  public void display() {
    pushMatrix();
    fill(_colour);
    rect(center.x, center.y, _width,_height);
    popMatrix();  
}

  protected boolean OnShape(float mousex, float mousey) { //<>//
    boolean onShape = false;
    if (mousex > (center.x) && mousex < (center.x + _width) && mousey < (center.y + _height) && mousey > (center.y)) {
      onShape = true;
    }
    return onShape;
  }
}
