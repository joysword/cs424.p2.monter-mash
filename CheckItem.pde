class CheckItem {
  
  float x, y;
  float w, h;

  CheckBox cb;
  
  Label lbl;
  
  CheckItem(float _x, float _y, float w1, float w2, float _h, String strr) { 
    cb = new CheckBox(_x, _y, w1, _h);
    lbl = new Label(_x+w1, _y, w2, _h, strr);
    
    x = _x;
    y = _y;
    w = w1+w2;
    h = _h;
  }
     
  public void render() {
    cb.render();
    lbl.render();
  }
  
  public boolean getIsCheck() {
    return cb.getIsCheck();
  }
  public boolean isCheck() {
    return cb.getIsCheck();
  }
  
  public void checkIt()
  {
    cb.checkIt();
  }
  
  public void uncheckIt()
  {
    cb.uncheckIt();
  }

  public void switchCheck()
  {
    cb.switchCheck();
  }
  
  public float getX()
  {
    return x;
  }
  public float getY()
  {
    return y;
  }
  public float getCBW()
  {
    return cb.getW();
  }
  public float getH()
  {
    return h;
  }
  public boolean isIn(float _x, float _y) {
    return cb.isIn(_x, _y);
  } 
}