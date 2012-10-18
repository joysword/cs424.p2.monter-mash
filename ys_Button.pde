class ys_Button {
  float x, y;
  float h; // height
  float w;
  int colour;
  String[] name; // title

    ys_Button(float _x, float _y, float _w, float _h, String[] _name) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    name = new String[2];

    name[0] = _name[0];
    name[1] = _name[1];

    colour = BUTTON_COLOR;
  }

  void render(boolean isLeft, int fontsize) {

    pushStyle();
    noStroke();
    fill(colour);
    rectMode(CORNER);
    rect(x, y, w, h);
    fill(TEXT_COLOR);
    textSize(fontsize*scale);
    if (isLeft) {
      textAlign(LEFT, CENTER);
      text(name[LA], x + w*0.05, y + h * 0.5);
    }
    else {
      textAlign(CENTER, CENTER);
      text(name[LA], x + w*0.5, y + h * 0.5);
    }

    popStyle();
  }

  public float getHeight() {
    return h;
  }

  void setPos(float _x, float _y) {
    x = _x;
    y = _y;
  }

  boolean checkIn(float _x, float _y) {
    if (_x > x && _x < x+w && _y > y && _y < y+h) {
      return true;
    }
    return false;
  }

  public void setName(int yearr, int i) {
    if (i == 0) {// first pop up button
      name[0] = "Top 10 Monsters of " + (yearr/10*10) + "'s";
      name[1] = "出镜率最高的10种怪物 (" + (yearr/10*10) + "'s)";
    }
    else if (i == 3) {
      //name[0] = "Show events of " + (yearr/10*10) + "'s";
      //name[1] = (yearr/10*10) + "年代大事件";
      name[0]=setEvent(yearr/10*10);
      name[1]=setEventCH(yearr/10*10);
    }
  }

  public String setEvent(int yearr){
      if(yearr==1890)
        return "First Lumière brothers movie";
      else if(yearr==1910)
        return "World War I in 1914";
      else if(yearr==1940)
        return "1945: Japan Atomic Bombing";
      else if(yearr==1960)
        return "1969: Moon Landing"; 
      else if(yearr==1970)
        return "The Exorcist"; 
      else if(yearr==1980)
        return "Chernobyl Disaster"; 
      else if(yearr==1990)
        return "Bram Stoker's Dracula";
      else return "No events for this decade!";
  }

  public String setEventCH(int yearr){
      if(yearr==1890)
        return "First Lumière brothers movie";
      else if(yearr==1910)
        return "World War I in 1914";
      else if(yearr==1940)
        return "1945: Japan Atomic Bombing";
      else if(yearr==1960)
        return "1969: Moon Landing"; 
      else if(yearr==1970)
        return "The Exorcist"; 
      else if(yearr==1980)
        return "Chernobyl Disaster"; 
      else if(yearr==1990)
        return "Bram Stoker's Dracula";
      else return "No events for this decade!";
  }
}