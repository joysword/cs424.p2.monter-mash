class MenuWindow {

  float x, y;

  float w; // width

  float lineH;

  float h;

  ys_Button[] popUpButton;

  boolean isDisplayMenu;

  boolean isDisplayWindow;

  int num;

  int whichWindow;

  Top10Window top10Window;

  Top10Window top10AllWindow;

  int yearX;

  int which;


  MenuWindow(float _x, float _y, float _w, int n, float btn_h, String[] strs) {

    x = _x;
    y = _y;
    w = _w;
    lineH = btn_h;

    num = n;
    h = lineH * num;

    popUpButton = new ys_Button[num];

    for (int i=0;i<num;i++) {
      popUpButton[i] = new ys_Button(x, y + i * lineH, w, lineH, strs[i]);
    }

    isDisplayMenu = false;
    isDisplayWindow = false;

    whichWindow = -1;

    top10Window = new Top10Window(POP_UP_WINDOW_X, POP_UP_WINDOW_Y, POP_UP_WINDOW_W, POP_UP_WINDOW_H);

    top10AllWindow = new Top10Window(POP_UP_WINDOW_X, POP_UP_WINDOW_Y, POP_UP_WINDOW_W, POP_UP_WINDOW_H);
    
    which = 0;
  }


  void render() {
    // render Menu
    if (isDisplayMenu) {
      for (int i=0;i<num;i++) {
        popUpButton[i].render(false, 14);
      }
    }
    else if (isDisplayWindow) {
      switch (whichWindow) {
      case TOP_10_WINDOW:
        top10Window.render(yearX);
        break;
      case TOP_10_OVERALL:
        top10AllWindow.render(10000);
        println("render overall");
        break;
      }
    }
  }

  void update(float posx, float posy) {
  }

  void setPos(float _x, float _y, int type) {
    switch (type) {
    case UPPER_LEFT:
      x = _x;
      y = _y;
      break;
    case UPPER_RIGHT:
      x = _x - w;
      y = _y;
      break;
    case LOWER_LEFT:
      x = _x;
      y = _y - h;
      break;
    case LOWER_RIGHT:
      x = _x - w;
      y = _y - h;
      break;
    }
    println("("+x+", "+y+")");
    for (int i=0;i<num;i++) {
      popUpButton[i].setPos(x, y + i * lineH);
    }
  }

  void shutDown() {
    isDisplayMenu = false;
    top10Window.setInit();
    top10AllWindow.setInit();
  }

  void turnOn(int _x, int _which) {
    isDisplayMenu = true;
    yearX = _x;
    which = _which;
  }

  void closeWindow() {
    isDisplayWindow = false;
  }

  boolean getIsDisplayMenu() {
    return isDisplayMenu;
  }

  boolean getIsDisplayWindow() {
    return isDisplayWindow;
  }

  boolean checkIn(float _x, float _y) {
    if (_x > x && _y > y && _x < x + w && _y < y + h)
      return true;
    return false;
  }

  void showWindow(float _y) {
    isDisplayWindow = true;
    for (int i=0;i<POP_UP_MENU_N;i++) {
      if (_y < y + (i + 1)*lineH) {
        whichWindow = POP_UP_WINDOW[i];
        break;
      }
    }
  }

  ys_Button getButton() {
    return popUpButton[0];
  }
}

