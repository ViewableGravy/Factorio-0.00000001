

public class WorldObject {

  private PVector center, offset;
  private String name, desc;
  private boolean placed;
  private int _width, _height;
  private int _spacing;

  WorldObject(String _name, String _desc, int __width, int __height, int spacing) {
    center = new PVector(0,0);
    name = _name;
    desc = _desc;
    placed = false;
    _spacing = spacing;
    offset = new PVector(0, 0);
    try {
      if (__width % spacing != 0) {
        throw new IllegalArgumentException();
      }
      _width = __width;
      _height = __height;
    }
    catch(Exception e) {
      println("invalid object dimensions");
    }
  }
  
  public boolean GetFollowing() {
    return !placed;
  }

  public boolean FollowMouse(float x, float y) {
    if (!placed) {
      AlignWithGrid(x - offset.x, y - offset.y);
      return true;
    }
    return false;
  }

  private void AlignWithGrid(float x, float y) {
    for (int i = 0; i < _spacing; i++) {
      if ((round(x) - i) % _spacing == 0) {
        center.x = (round(x) - i) + _spacing/2;
      }
      if ((round(y) - i) % _spacing == 0) {
        center.y = (round(y) - i) + _spacing/2;
      }
    }
  }

  public void PickPlaceObject(float mousex, float mousey) {
    if (placed == false) {
      offset.setMag(0);
      placed = true;
    } else {
      if (OnShape(mousex, mousey))
      {
        SetOffset(mousex, mousey);
        placed = false;
      }
    }
  }

  public void SetOffset(float mousex, float mousey) {
    PVector mouse = new PVector(mousex, mousey);
    offset = mouse.sub(center);
  }

  public void PickColour() {
    if (!placed) {
      fill(255, 0, 0);
    } else {
      fill(0, 255, 0);
    }
  }

  public void DrawObject() {
    pushMatrix();
    PickColour();
    rect(center.x - _width + _spacing/2, center.y - _height + _spacing/2, _width, _height);
    popMatrix();
  }

  public boolean OnShape(float mousex, float mousey) {
    boolean onShape = false;
    if (mousex > (center.x - _width + _spacing/2) && mousex < (center.x + _spacing/2) && mousey < (center.y + _spacing/2) && mousey > (center.y - _height + _spacing/2)) {
      onShape = true;
    }
    return onShape;
  }
}
