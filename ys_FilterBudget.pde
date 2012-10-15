class FilterBudget {
  float x, y, w, h;

  int checkItemCount; // number of level

  CheckItem[] checkItemsForFilterBudget;

  float[] lowerBound;

  float[] upperBound;

  FilterBudget(float _x, float _y, float _w, float _h, int n) {

    x = _x;
    y = _y;
    w = _w;
    h = _h;
    checkItemCount = n;

    checkItemsForFilterBudget = new CheckItem[checkItemCount];
    lowerBound = new float[checkItemCount];
    upperBound = new float[checkItemCount];
    for (int i=0;i<checkItemCount;i++) {
      //change
      checkItemsForFilterBudget[i] = 
        new CheckItem(x + (i % NUMBER_EACH_LINE) * (CHECK_BOX_WIDTH*RELATIVE_WIDTH) * scale, y + (i / NUMBER_EACH_LINE * (CHECK_BOX_WIDTH+2) + TITLE_TO_BOX) * scale, CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * (RELATIVE_WIDTH-1), h, 
      (i == 0)?"High":((i==1)?"Low":"None")); //change
      lowerBound[i] = i+0.1;//change
      upperBound[i] = i+1;//change
    }
  }
  void render() {
    pushStyle();
    noStroke();
    fill(CHECK_ITEM_COLOR);
    textAlign(LEFT);
    text("Budget:", x, y); //change
    popStyle();
    for (int i=0;i<checkItemCount;i++) {
      checkItemsForFilterBudget[i].render();
    }
  }
  boolean checkIn(float _x, float _y) {
    return false;
  }
  void update(float _x, float _y) {
    for (int i=0;i<checkItemCount;i++) {
      if (checkItemsForFilterBudget[i].isIn(_x, _y)) {
        checkItemsForFilterBudget[i].switchCheck();
        break;
      }
    }
  }

  ArrayList<ys_IdBudgetPair> getList(cc_DatabaseManager db) {
    ArrayList<ys_IdBudgetPair> listt = new ArrayList<ys_IdBudgetPair>();
    for (int i=0;i<checkItemCount; i++) {
      if (checkItemsForFilterBudget[i].isCheck()) {
        //listt.addAll(db.getFilmAndBudget(lowerBound[i], upperBound[i]));
      }
    }
    return listt;
  }
}

