# MrBones-2DRTSStyleWildRideThatNeverEnds
factorio amirite

this project is to essentially attempt to recreate the game factorio (with similar mechanics) using my current understanding of programming.
It is somewhat important to me that this project follows good conventions, utilises OOP and is as efficient as i can make it. 
This means that it must be as modular as possible.

List of Already implemented features include:
  - create a grid
  - Creating a placeholder object*
    - make object follow mouse 
    - make object place when clicked 
    - make object pickable when clicked 
  - making object snap to said grid 
  - make object place snapped to grid 
  - directional placement
    - indicate direction
    - allow rotation using "r"  //note: doesn't work with uneven shapes e.g. 2x3
  - Purchase items 
    - purchase generic item 
    - choose item type (types of items);
List of Items to implement include:
  - PShapes
    This is in my opinion essential to reduce the performance tax on CPU from translations and rendering. if i can perform translations to
    the shape on the GPU then it will reduce the tax from recreating a rectangle each frame at the specific coordinates. (I think)
  - Collision Detection
    Although i already have this implemented for clicking i think it would make more sense to create a QuadTree that stores all the shapes
    so that as the program expands it has a good foundation to reduce performance hits from collision detection.
    
