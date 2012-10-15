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

  public void render()
  {
    pushStyle();
    textAlign(LEFT, CENTER);
    fill(TEXT_COLOR); //change
    textSize(14*scale);
    text(txt, x+2*scale, y+h*0.5);
    popStyle();
  }

  public String getTxt() {
    return txt;
  }
}

