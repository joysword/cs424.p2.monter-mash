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
    stroke(125);
    strokeWeight(h);
    
    line(x,y,x+w, y);
    
    for (int column = 0; column < columnCount; column++) {
      if (column%2 == 0) {
        float xx = map(years[column], yearMin, yearMax, x, x+w);
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
   if (ui.getYearMode() == YEAR_MODE) { 
    int Year = (int) map(_x, x,x+w, yearMin, yearMax);
    if (l_r == 0) {
      if (Year < yearMin) Year = yearMin;
      if (Year >= showYearMax) Year = showYearMax-1;
      leftLock.setX(w*(Year-1980)/29.0 + x);
      showYearMin = Year;
    } else if (l_r == 1) {
      if (Year > yearMax) Year = yearMax;
      if (Year <= showYearMin) Year = showYearMin+1;
      rightLock.setX(w*(Year-1980)/29.0 + x);
      showYearMax = Year;
    }
   }
  }
  
  // return to default position (when enter Decade Mode)
  public void resume() {
    leftLock.resume();
    rightLock.resume();
    showYearMin = yearMin;
    showYearMax = yearMax;
  }
}
    
