class Label {
  
  float x, y, w, h;
  String txt;
  
  boolean isClick;
  
  Label (float _x, float _y, float _w, float _h, String strr)
  {
    x = _x;
    y =  _y;
    w = _w;
    h = _h;
    txt = strr;
  }
  
  /*
  public void setIsClick(boolean bb)
  {
    isClick = bb;
  }
  
  public boolean getIsClick()
  {
    return isClick;
  }
  
  public void setCanClick(boolean bb)
  {
    canClick = bb;
  }
  
  public boolean getCanClick()
  {
    return canClick;
  }
  
  public void ClickUnClick()
  {
    if (canClick)
    {
      isClick = !isClick;
    }
    else {println("can't click it");}
  }
  */
  
  public void render()
  {
    pushStyle();
    textAlign(LEFT,CENTER);
    fill(TEXT_COLOR); //change
    textSize(11*scale);
    text(txt, x+2*scale, y+h*0.5);
    popStyle();
  }
  
  public String getTxt() {
    return txt;
  }
}