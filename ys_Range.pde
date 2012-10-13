class ys_Range {
  
  float x, y;
  float w, h;
  
  ys_TimeLock leftLock, rightLock;
  
  ys_Range(float _x, float _y, float _w, float _h, float lockw, float lockh) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    leftLock = new ys_TimeLock(x, y,lockw, lockh);
    rightLock = new ys_TimeLock(x+w, y, lockw, lockh);
  }
  
  
  // need change
  public void render() {
    pushStyle();
    
    noFill();
    stroke(RANGE_COLOR);
    strokeWeight(h);
    
    line(x,y,x+w, y);
    
    for (int column = 1890; column < 2013; column++) {
      if (column%10 == 0) {
        float xx = map(column, 1890, 2013, x, x+w);
        line(xx, y-h, xx, y+h);
        //text(years[column], x, (plotY2 + textAscent() + 7)*scale);
      }
    }
  
    popStyle();
    leftLock.render();
    rightLock.render();
  }
  
  public ys_TimeLock getLeftLock() {
    return leftLock;
  }
  
  public ys_TimeLock getRightLock() {
    return rightLock;
  }
  
  // need change
  public void update(float _x, int l_r) {

    if (ui.getFirstPage().getDisplayMode() == YEAR_MODE) { 
      int Year = (int) map(_x, x,x+w, YEAR_MIN, YEAR_MAX);
      if (l_r == 0) {
        if (Year < YEAR_MIN) Year = YEAR_MIN;
        if (Year >= ui.getFirstPage().getPlot(1).getShowYearMax()) Year = ui.getFirstPage().getPlot(1).getShowYearMax()-1;
      leftLock.setX(w*(Year-YEAR_MIN)/(YEAR_MAX-YEAR_MIN) + x);
      ui.getFirstPage().getPlot(1).setShowYearMin(Year);
      ui.getFirstPage().getPlot(2).setShowYearMin(Year);
    } else if (l_r == 1) {
      if (Year > YEAR_MAX) Year = YEAR_MAX;
      if (Year <= ui.getFirstPage().getPlot(1).getShowYearMin()) Year = ui.getFirstPage().getPlot(1).getShowYearMin()+1;
      rightLock.setX(w*(Year-YEAR_MIN)/(YEAR_MAX-YEAR_MIN) + x);
      ui.getFirstPage().getPlot(1).setShowYearMax(Year);
      ui.getFirstPage().getPlot(2).setShowYearMax(Year);
    }
   }
  }
  
  // return to default position (when enter Decade Mode)
  public void resume() {
    //leftLock.resume();
    //rightLock.resume();
    //ui.getFirstPage().getPlot().setShowYear(yearMin, yearMax);
  }
}
