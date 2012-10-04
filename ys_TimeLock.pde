class ys_TimeLock {
  private float x;
  private float y;
  
  float init; // default position in x
  
  float w;
  float h;
  
  ys_TimeLock(float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    init = x;
  }
  
  public void updateTimeLock(float _x) {
    x = _x;
  }
  
  public void render()
  {
    pushStyle();
    fill(0);
    rectMode(CORNERS);
    ellipse(x,y,w*2,h*2);
    //rect(x-w*scale,y-h*scale,x+w*scale,y+h*scale);
    popStyle();
  }
  
  public float getX() {return x;}
  public float getY() {return y;}
  
  public void setX(float _x) {
    x = _x;
  }
  
  public void resume() {
    x = init;
  }
}
