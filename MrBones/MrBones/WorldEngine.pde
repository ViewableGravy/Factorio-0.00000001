

public class WorldEngine {


  //private Thread engineThread = new Thread(new Runnable() { @Override public void run() { Tick(); } });
  ArrayList<WorldObject> objs;
  UI ui = new UI();
  boolean following = false;

  WorldEngine(ArrayList<WorldObject> obj) {
    objs = obj;
    // engineThread.start();
  }

  void Tick(float x, float y) {
    FollowMouse(x, y);
    DrawObjects();
  }

  void KeyPress(char key, float x, float y) {
    
    for (WorldObject object : objs) {
      if (key == 'r') {
        if ( object.GetFollowing() || object.OnShape(x, y) ) {
          object.RotateOnce();
        }
      }
    }
  }

  void RotateObject() {
    // condition: object must be aware of it's current direction
    // this will be done by the object storing it's rotation in degrees between 0 and 270
  }

  void FollowMouse(float x, float y) {
    //int i = 0;
    for (WorldObject object : objs) {
      // if (object.FollowMouse(x, y)) {
      //following = true;
      // } else if (i++ == objs.size() - 1) {
      //following = false;
      // }
      object.FollowMouse(x, y);
    }
  }

  void DrawObjects() {
    for (WorldObject object : objs) {
      object.DrawObject();
    }
    ui.DrawHotbar();
  }

  void MousePress(float x, float y) {

    if ( y > 500 && y < 600 ) 
    { 
      try 
      {
        for (WorldObject object : objs) 
        {
          if (object.GetFollowing()) 
          {
            throw new MrBonesException("an object is already selected");
          }
        }
        objs.add(ui.PurchaseItems(x, y));
      }
      catch(MrBonesException e) 
      {
        println(e);
      }
    } else 
    {
      for (WorldObject object : objs) 
      {
        object.PickPlaceObject(x, y);
        if (object.GetFollowing()) 
        {
          following = true;
        }
      }
    }
  }
}
