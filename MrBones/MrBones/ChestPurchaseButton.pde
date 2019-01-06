
class ChestObjectButton extends ObjectButton {
 
 ChestObjectButton(PVector pos, int width, int height, String name, String Desc, int spacing,color colour) {
   super(pos,width,height,name,Desc,spacing, colour);
 }
 
 public WorldObject GetObjs() {
    return new Chest("Chest", "A Chest Object", _spacing, _colour);
 }
}
