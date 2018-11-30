

public class WorldObject {

  private PVector center;
  private String name, desc;
  private boolean placed;

  WorldObject(int _x, int _y, String _name, String _desc) {
    center = new PVector(_x, _y);
    name = _name;
    desc = _desc;
    placed = false;
  }

  public void FollowMouse() {
    if (!placed) {
      center.x = mouseX;
      center.y = mouseY;
    }
  }

  public void PickPlaceObject() {
    if (placed == false) {
      placed = true;
    } else {
      if (dist(mouseX, mouseY, center.x, center.y) < 10) {
        placed = false;
      }
    }
  }

  public void DrawObject() {
    println(center.x);
    ellipse(center.x, center.y, 10, 10);
  }
}
