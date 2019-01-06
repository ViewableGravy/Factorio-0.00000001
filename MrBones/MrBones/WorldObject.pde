
public enum Direction {
  up, 
    right, 
    down, 
    left;

  public int GetDirection() {
    switch(this) {
    case  up: 
      return 0;
    case right:
      return 90;
    case down:
      return 180;
    case left: 
      return 270;
    default:
      return 0;
    }
  }

  static final Direction[] VALUES = values();
  public Direction incrementDirection() 
  {
    if (VALUES[ordinal()] == left) {
      return VALUES[ordinal() - 3];
    } else {
      return VALUES[ordinal()+1];
    }
  }
  // public Direction decrementDirection() { return VALUES[ordinal()-1]; }
}

public class WorldObject {

  protected PVector center, offset;
  protected String name, desc;
  protected Direction direction = Direction.up; // number dictating rotation in degrees. valid inputs are 90,180,270,0;
  protected boolean placed;
  protected int _width, _height;
  protected int _spacing;

  WorldObject(String _name, String _desc, int __width, int __height, int spacing) {
    center = new PVector(0, 0);
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

  public void FollowMouse(float x, float y) {
    if (!placed) {
      AlignWithGrid(x - offset.x, y - offset.y);
    }
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

  public boolean IsRotatableObject() {
    return true;
  }

  public void DrawObject() {
    pushMatrix();
    float topx = center.x - _width + _spacing/2;
    float topy = center.y - _height + _spacing/2;
    PickColour();
    rect(topx, topy, _width, _height);
    fill(0, 0, 255);
    if (IsRotatableObject()) {
      switch(direction) {
      case up: 
        triangle(topx + _width/3, topy, topx + _width/2, topy + _height/3, topx + (2 * _width/3), topy);
        break;
      case right:
        triangle(topx + _width, topy + _height/3, topx + (2*_width/3), topy + _height/2, topx + _width, topy + (2*_height/3));
        break;
      case down:
        triangle(topx + _width/3, topy + _height, topx + _width/2, topy + (2*_height/3), topx + (2 * _width/3), topy + _height);
        break;
      case left:
        triangle(topx, topy + _height/3, topx + _width/3, topy + _height/2, topx, topy + (2*_height/3));
        break;
      }
    }
    popMatrix();
  }

  public boolean OnShape(float mousex, float mousey) {
    boolean onShape = false;
    if (mousex > (center.x - _width + _spacing/2) && mousex < (center.x + _spacing/2) && mousey < (center.y + _spacing/2) && mousey > (center.y - _height + _spacing/2)) {
      onShape = true;
    }
    return onShape;
  }

  public void RotateOnce() {
    direction = direction.incrementDirection();
  }
}
