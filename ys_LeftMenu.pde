//
//
// LeftMenu is for changing pages. It's located at the left most side of the screen
//

class ys_LeftMenu {
  
  float d_w; // defaulf width
  float w; // real width when activated
  
  boolean isDisplay;
  
  ys_LeftMenu (float _d, float _w) {
    w = _w;
    d_w = _d;
  }
  
  
  void render() {
    if (isDisplay) {
      pushStyle();
      
      fill(BG_COLOR);
      noStroke();
      rectMode(CORNER);
      rect(0,0,w,height);
      
      popStyle();
    }
    else {
      pushStyle();
      
      fill(BG_COLOR);
      noStroke();
      rectMode(CORNER);
      rect(0,0,d_w,height);
      
      popStyle();
    }
  }
}
