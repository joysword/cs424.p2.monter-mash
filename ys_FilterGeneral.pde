class FilterGeneral {
  float x, y, w, h;

  int checkItemCount; // number of level

  CheckItem[] checkItems;

  FilterGeneral(float _x, float _y, float _w, float _h, int n) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    checkItemCount = n;

    checkItems = new CheckItem[checkItemCount];

    for (int i=0;i<checkItemCount;i++) {
      //change
      checkItems[i] =
        new CheckItem(x + (i % NUMBER_EACH_LINE_GENERAL) * (CHECK_BOX_WIDTH*RELATIVE_WIDTH_GENERAL), y + (i / NUMBER_EACH_LINE_GENERAL * (CHECK_BOX_WIDTH + 8*scale) + TITLE_TO_BOX), CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * (RELATIVE_WIDTH_GENERAL-1*scale), h, 
      FILTER_TYPE[i]); //change
    }

    for (int i=0;i<checkItemCount;i++) {
      if (FILTER_TYPE[i][0] == " CERTIFICATE") {
        checkItems[i].switchCheck();
      }
    }
  }

  void render() {
    pushStyle();
    noStroke();
    fill(TEXT_COLOR);
    textAlign(LEFT);
    textSize(24*scale);
    text(FILTER_GENERAL_TXT[LA], x, y); //change
    popStyle();
    for (int i=0;i<checkItemCount;i++) {
      checkItems[i].render();
    }
  }
  // change
  int InWhich(float _x, float _y) {
    for (int i=0;i<checkItemCount;i++) {
      if (checkItems[i].isIn(_x, _y)) {
        return i;
      }
    }
    return -1;
  }
  boolean checkIn(float _x, float _y) {
    return false;
  }
  void update(float _x, float _y) {
    for (int i=0;i<checkItemCount;i++) {
      if (checkItems[i].isIn(_x, _y)) {
        checkItems[i].switchCheck();

        // comment out this 'if' statement if users are allowed to select multiple
        if (checkItems[i].getIsCheck()) {
          for (int j=0;j<checkItemCount;j++) {
            if (j != i) {
              checkItems[j].uncheckIt();
            }
          }
        }
        //
        else {
          boolean allGone = true;
          for (int j=0;j<checkItemCount;j++) {
            if (checkItems[i].getIsCheck()) {
              allGone = false;
              break;
            }
          }
          if (allGone) checkItems[i].checkIt();
        }
        //
        break;
      }
    }
  }

  int getFilterType() {
    for (int i=0;i<checkItemCount;i++) {
      if (checkItems[i].getIsCheck()) return i;
    }
    return -1;
  }
}

