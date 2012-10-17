class FilterFormat {
  float x, y, w, h;

  int checkItemCount; // number of formats

  CheckItem[] checkItemsForFilterFormat;

  int[] kindId;

  FilterFormat(float _x, float _y, float _w, float _h, int n) {

    x = _x;
    y = _y;
    w = _w;
    h = _h;
    checkItemCount = n;

    checkItemsForFilterFormat = new CheckItem[checkItemCount];

    for (int i=0;i<checkItemCount;i++) {
      //change
      //checkItemsForFilterFormat[i] = 
        //new CheckItem(x + (i % NUMBER_EACH_LINE) * (CHECK_BOX_WIDTH*RELATIVE_WIDTH) * scale, y + (i / NUMBER_EACH_LINE * (CHECK_BOX_WIDTH+2) + TITLE_TO_BOX) * scale, CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * (RELATIVE_WIDTH-1), h, 
      //KIND_TYPE[i]); //change
    }

    kindId = new int[checkItemCount];
    kindId[0] = 1; //movie
    kindId[1] = 3; //tv movie
    kindId[2] = 4; //video movie
  }
  void render() {
    pushStyle();
    noStroke();
    fill(CHECK_ITEM_COLOR);
    textAlign(LEFT);
    text("Format: (choose one)", x, y); //change
    popStyle();
    for (int i=0;i<checkItemCount;i++) {
      checkItemsForFilterFormat[i].render();
    }
  }

  // change
  int InWhich(float _x, float _y) {
    for (int i=0;i<checkItemCount;i++) {
      if (checkItemsForFilterFormat[i].isIn(_x, _y)) {
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
      if (checkItemsForFilterFormat[i].isIn(_x, _y)) {
        checkItemsForFilterFormat[i].switchCheck();
        break;
      }
    }
  }

  ArrayList<Integer> getList(cc_DatabaseManager db) {
    // foreach CheckItem, sum all their list to return
    ArrayList<Integer> listt = new ArrayList<Integer>();
    for (int i=0;i<checkItemCount;i++) {
      if (checkItemsForFilterFormat[i].isCheck()) {
        //listt.addAll(db.getFilmForKind(kindId[i]));
      }
    }
    return listt;
  }
}

