
public class Grid {
  
   public float cols, rows, hei, wid;
   public int spacing;
   
   Grid(int _wid, int _hei, int _spacing) {
     spacing = _spacing;
     hei = _hei;
     wid = _wid;
     cols = wid/_spacing;
     rows = hei/_spacing;
   }
   
   public void DrawGrid() {
     for (int i = 0; i < cols; i++) {
       line(i*spacing,0,i*spacing,hei); 
     }
     for (int j = 0; j < cols; j++) {
       line(0,j*spacing,wid,j*spacing); 
     }
   }
   
   
}
