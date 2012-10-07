class ys_CheckBox {
  
  PVector pos;
  PVector size;
  
  boolean isCheck;
  boolean canCheck;
  
  ys_CheckBox(float x, float y, float w, float h)
  {
    pos = new PVector(x,y);
    size = new PVector(w,h);
  }
  
  public void setIsCheck(boolean bb)
  {
    isCheck = bb;
  }
  
  public boolean getIsCheck()
  {
    return isCheck;
  }
  
  public void setCanCheck(boolean bb)
  {
    canCheck = bb;
  }
  
  public boolean getCanCheck()
  {
    return canCheck;
  }
  
  public void CheckUnCheck()
  {
    if (canCheck)
    {
      isCheck = !isCheck;
    }
    else {println("can't check it");}
  }
  
  public void render()
  {
    pushStyle();
    noFill();
    stroke(127);
    strokeWeight(1*scale);
    rectMode(CORNER);
    rect(pos.x, pos.y, size.x, size.y);
    if (isCheck)
    {
      line(pos.x, pos.y, pos.x+size.x, pos.y+size.y);
      line(pos.x, pos.y+size.y, pos.x+size.x, pos.y);
    }
    popStyle();
  }
  
  public float getW()
  {
    return size.x;
  }
}

