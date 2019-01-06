
public class Chest extends WorldObject {
  public Chest(String name, String desc, int spacing, color colour) {
    super(name, desc, spacing, spacing, spacing, colour);
  }
  
  public @Override boolean IsRotatableObject() {
    return false;
  }
}
