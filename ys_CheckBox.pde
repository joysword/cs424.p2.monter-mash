class CheckBox {

  float x, y, w, h;

  boolean isCheck;
  //boolean canCheck;

  CheckBox(float x, float y, float w, float h)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    isCheck = false;
  }

  public void checkIt()
  {
    isCheck = true;
  }

  public void uncheckIt()
  {
    isCheck = false;
  }

  public void switchCheck()
  {
    isCheck = ! isCheck;
  }

  public boolean getIsCheck()
  {
    return isCheck;
  }

  public void render()
  {
    pushStyle();
    noFill();
    stroke(150); //change
    strokeWeight(2*scale);
    rectMode(CORNER);
    rect(x, y, w, h);
    if (isCheck)
    {
      line(x, y, x+w, y+h);
      line(x, y+h, x+w, y);
    }
    popStyle();
  }

  public float getW()
  {
    return w;
  }

  public boolean isIn(float _x, float _y) {
    if (_x > x && _x < x+w && _y > y && _y < y+h) {
      return true;
    }
    else {
      return false;
    }
  }
}

