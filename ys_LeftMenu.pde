//
//
// LeftMenu is for turning pages. It's located at the left most side of the screen
//

class ys_LeftMenu {

  float x, y;

  float w; // width

  float h;

  ys_Button[] leftButton;

  int num; // number of buttons
  
  ys_LeftMenu (float _w, int n, float btn_h, String[] strs) {
    // width, number, names

    x = LEFT_BAR_DEFAULT_WIDTH;
    y = 0;
    w = _w;
    h = Height;

    num = n;

    leftButton = new ys_Button[n];

    for (int i=0;i<num;i++) {
      leftButton[i] = new ys_Button(x, Height * 0.5 - num/2.0*btn_h + i * btn_h, w, btn_h, strs[i]);
    }
  }
  
  void render() {
    
    pushStyle();
    
    fill(#342C2C); // need change
    noStroke();
    rectMode(CORNER);
    rect(x,y, w, h);

    for (int i=0;i<num;i++) {
        leftButton[i].render();
    }
    
    popStyle();
  }
}
