class ys_HelpWindow
{
  float x, y; //left-top corner
  float w, h; // width and height
  
  float btnX, btnY; // where the window trigger button is
  float btnW, btnH; // width and height of the button 
  
  boolean isDisplay; // whether this window is being displayed
  
  String helpContent; // what to show in this window
  
  ys_HelpWindow(float _x, float _y, float _w, float _h, String content, float bx, float by, float bw, float bh)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    helpContent = content;
    
    isDisplay = false;
    
    btnX = bx;
    btnY = by;
    
    btnW = bw;
    btnH = bh;
  }

  public void render() {
    pushStyle();
    if (isDisplay)
    {
    }
    pushStyle();
  }
  
  private void switchDisplay()
  {
    isDisplay = !isDisplay;
  }
  
  void drawButton()
  {
    pushStyle();
    noStroke();
    fill(127);
    rectMode(CORNER);
    rect(btnX, btnY, btnW, btnH);
    fill(0);
    textSize(10*scale);
    textAlign(CENTER, CENTER);
    text("CREDITS", btnX+btnLen/2, btnY+btnLen/2);
    popStyle();
  }
  
  
  
  //
  // need to change
  //
  //
  //
  void update(float _x, float _y)
  {
    if (_x >= btnX && _x <= btnX+btnLen && _y >= btnY && _y <= btnY+btnLen) {
      switchActive();
    }
  }
  
  boolean getIsDisplay() {
    return isActive;
  }
}
