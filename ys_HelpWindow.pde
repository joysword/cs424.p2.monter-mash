class ys_HelpWindow
{
  float x, y; //left-top corner
  float w, h; // width and height
  
  boolean isDisplay; // whether this window is being displayed
  
  String content; // what to show in this window
  
  ys_HelpWindow(float _x, float _y, float _w, float _h, String helpContent)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    
    content = helpContent;
    
    isDisplay = false;
  }

  public void render() {
    if (isDisplay)
    {
      pushStyle();
      fill(0); //change
      strokeWeight(3*scale);
      stroke(#ff3399);
      rectMode(CORNER);
      rect(x,y,w,h);
      fill(#ff6600);
      textAlign(CENTER,CENTER);
      text(content, x+w*0.5, y+h*0.5);
      popStyle();
    }
    
  }
  
  private void switchDisplay()
  {
    isDisplay = !isDisplay;
  }
  
  boolean getIsDisplay() {
    return isDisplay;
  }
}
