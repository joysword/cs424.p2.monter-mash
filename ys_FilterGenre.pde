class FilterGenre {
  float x, y, w, h;

  int checkItemCount; // number of level

  CheckItem[] checkItemsForFilterGenre;

  FilterGenre(float _x, float _y, float _w, float _h, int n) {	

    x = _x;
    y = _y;
    w = _w;
    h = _h;
    checkItemCount = n;

    checkItemsForFilterGenre = new CheckItem[checkItemCount];

    for (int i=0;i<checkItemCount;i++) {
      //change
      checkItemsForFilterGenre[i] = 
        new CheckItem(x + (i % NUMBER_EACH_LINE) * (CHECK_BOX_WIDTH*RELATIVE_WIDTH), y + i / NUMBER_EACH_LINE * (CHECK_BOX_WIDTH + 8*scale) + TITLE_TO_BOX, CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * (RELATIVE_WIDTH-2*scale), h, 
      GENRE_TYPE[i]); //change

    }
  }
  void render() {
    pushStyle();
    noStroke();
    fill(TEXT_COLOR);
    textAlign(LEFT);
    textSize(24*scale);
    text(FILTER_GENRE_TXT[LA], x, y); //change
    popStyle();
    for (int i=0;i<checkItemCount;i++) {
      checkItemsForFilterGenre[i].render();
    }
  }

  // change
  int InWhich(float _x, float _y) {
    for (int i=0;i<checkItemCount;i++) {
      if (checkItemsForFilterGenre[i].isIn(_x, _y)) {
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
      if (checkItemsForFilterGenre[i].isIn(_x, _y)) {
        checkItemsForFilterGenre[i].switchCheck();

        // comment out these statements if users are allowed to select multiple
        if (checkItemsForFilterGenre[i].getIsCheck()) {
          for (int j=0;j<checkItemCount;j++) {
            if (j != i) {
              checkItemsForFilterGenre[j].uncheckIt();
            }
          }
        }
        //
        break;
      }
    }
  }

  ArrayList<ys_IdGenrePair> getList(cc_DatabaseManager db) {
    // foreach CheckItem, sum all their list to return
    ArrayList<ys_IdGenrePair> listt = new ArrayList<ys_IdGenrePair>();
    for (int i=0;i<checkItemCount;i++) {
      if (checkItemsForFilterGenre[i].isCheck()) {
        //listt.addAll(db.getFilmAndGenre(genre[i]));
      }
    }
    return listt;
  }

  int getGenreType() {
    for (int i=0;i<checkItemCount;i++) {
      if (checkItemsForFilterGenre[i].getIsCheck()) return i;
    }
    return -1;
  }
}

