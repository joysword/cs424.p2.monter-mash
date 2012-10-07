class ys_CheckItem {
  
  ys_CheckBox cb;
  
  ys_Label btn;
  
  float w;
  
  float x,y;
  
  float h;
  
  ys_CheckItem(float _x, float _y, float wid1, float wid2, float height, String str, boolean act) {
    cb = new ys_CheckBox(_x+wid1, _y, wid1, height);
    btn = new ys_Label(_x, _y, wid2, height, str);
    x = _x;
    y = _y;
    w = wid1+wid2;
    h = height;
  }
  
  ys_CheckItem(float _x, float _y, float wid1, float wid2, float height, String str) {
    cb = new ys_CheckBox(_x+wid1, _y, wid1, height);
    btn = new ys_Label(_x, _y, wid2, height, str);
    x = _x;
    y = _y;
    w = wid1+wid2;
    h = height;
  }
  
  public void render()
  {
    cb.render();
    btn.render();
  }
  
  public boolean isCheck()
  {
    return cb.getIsCheck();
  }
  
  public boolean canCheck()
  {
    return cb.getCanCheck();
  }
  
  public void setCheck(boolean bb)
  {
    cb.setIsCheck(bb);
  }
  
  public void CheckUnCheck()
  {
    cb.CheckUnCheck();
  }
  
  public void update(float mousex, float mousey)
  {
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
  
  public void setActive()
  {
    cb.setIsCheck(true);
  }
  
  public void setNotActive()
  {
    cb.setIsCheck(false);
  }
  
  public boolean getCheck()
  {
    return cb.getIsCheck();
  }
  
  public String getTxt() {
    return btn.getTxt();
  }
}
  