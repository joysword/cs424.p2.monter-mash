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
  
  ys_LeftMenu(float _w, int n, float btn_h, String[] strs) {
    // width, number, height, names

    x = LEFT_BAR_DEFAULT_WIDTH;
    y = 0;
    w = _w;
    h = Height;

    num = n;

    leftButton = new ys_Button[num];

    for (int i=0;i<num;i++) {
      leftButton[i] = new ys_Button(x, y + h * 0.5 - num/2.0*btn_h + i * btn_h, w, btn_h, strs[i]);
    }
  }
  
  void render() {
    
    pushStyle();
    
    fill(POP_UP_COLOR); // need change
    noStroke();
    rectMode(CORNER);
    rect(x,y, w, h);

    popStyle();

    for (int i=0;i<num;i++) {
        leftButton[i].render();
    }
  }

  void update(float posx, float posy) {
    if(posx>x && posx<x+w && posy>y && posy<y+h) {
      for (int i=0;i<num;i++) {
        float yy = y + h*0.5 - num/2.0*leftButton[i].getHeight() + i*leftButton[i].getHeight();
        if (posy > yy && posy < yy + leftButton[i].getHeight()) {
          if (i<3) {currentPage = i;}
          else if (i == 3) {
            ui.getHelpWindow().switchDisplay();
          } // on -> off, off -> on
          break;
        }
      }
    }
  }
}
