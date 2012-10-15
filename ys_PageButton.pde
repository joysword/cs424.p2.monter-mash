class ys_PageButton {

  int page; // which page are we in
  int pageCount; // how many pages do we have

  float x; // left-lower corner of pageUp
  float y; // left-lowe corner of pageUp
  float w; // width
  float diff; // distance between pageUp and pageDown

  ys_PageButton(float _x, float _y, float _w, float _diff, int n) {
    x = _x;
    y = _y;
    w = _w;
    diff = _diff;

    pageCount = n; // We have n pages in total
    page = 0;
  }

  private void render() {
    pushStyle();
    fill(127);
    noStroke();
    triangle(x, y, x+w, y, x+w*0.5, y-w*0.5); // pageUp
    triangle(x, y+diff, x+w, y+diff, x+w*0.5, y+w*0.5+diff); // pageDown
    popStyle();
  }

  public void update(float _x, float _y) {
    // if this is being displayed and no other window is overlaping this {
    if (_x>= x && _x <= x+w && _y >= y - w * 0.5 && _y <= y) {
      if (page > 0) {
        page--;
      }
    } 
    else if (_x>= x && _x <= x + w && _y >= y + diff * 0.5 && _y <= y + diff + w * 0.5) {
      if (page<pageCount-1) {
        page++;
      }
    }
    //}
  }

  public int getPage() {
    return page;
  }
}

