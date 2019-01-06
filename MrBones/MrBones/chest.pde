
public class Chest extends WorldObject {
  public Chest(String name, String desc, int spacing) {
    super(name, desc, spacing, spacing, spacing);
  }
  
  public @Override boolean IsRotatableObject() {
    return false;
  }
}
