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
   
  }
  
  // return to default position (when enter Decade Mode)
  public void resume() {
    //leftLock.resume();
    //rightLock.resume();
    //ui.getFirstPage().getPlot().setShowYear(yearMin, yearMax);
  }
}
