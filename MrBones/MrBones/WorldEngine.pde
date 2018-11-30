

public class WorldEngine {
 
  
  private Thread engineThread = new Thread(new Runnable() { @Override public void run() { Tick(); } });
  WorldObject obj1;
  
  WorldEngine(WorldObject obj) {
    obj1 = obj;
    engineThread.start();
  }
  
  void Tick() {
    obj1.FollowMouse();
  }
  
  void DrawObjects() {
    obj1.DrawObject();
  }
  
  void MousePress() {
    obj1.PickPlaceObject();
  }
  
}
