class ys_Label {
  
  PVector pos;
  PVector size;
  String txt;
  
  boolean isClick;
  boolean canClick;
  
  ys_Label (float x, float y, float w, float h, String str)
  {
    pos = new PVector(x,y);
    size = new PVector(w,h);
    txt = str;
  }
  
  ys_Label (PVector p, PVector s, String str)
  {
    pos = p;
    size = s;
    txt = str;
  }
  
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
  
  
  public void render()
  {
    pushStyle();
    textAlign(LEFT,CENTER);
    fill(0);
    
    text(txt, pos.x+1*scale, pos.y+size.y/2);
    popStyle();
  }
  
  public String getTxt() {
    return txt;
  }
}
    
