
class TwoByTwoButton extends ObjectButton {
 
 TwoByTwoButton(PVector pos, int width, int height, String name, String Desc, int spacing, color colour) {
   super(pos,width,height,name,Desc,spacing, colour);
 }
 
 public WorldObject GetObjs() {
    return new WorldObject("name", "A random object (1)", 40, 40, grid.spacing, _colour);
 }
}
