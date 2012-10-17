public class cc_KnobScroll {

  private float leftX;
  private float rightX;
  private float upperY;
  private float lowerY;
  private float centerX;
  private float centerY;
  private float radius;
  private float actualX;
  private boolean selected=false;
  private float posX;
  private boolean dontMove;
  private cc_MonsterScroll scroll;

  public cc_KnobScroll(float leftX, float rightX, float upperY, float lowerY, float centerX, cc_MonsterScroll scroll) {
    this.leftX=leftX;
    this.rightX=rightX;
    this.upperY=upperY;
    this.lowerY=lowerY;
    this.centerX=centerX;
    this.scroll=scroll;
    actualX=centerX;
  }

  public void knobSetup() {
    centerY=upperY+(lowerY-upperY)/2;
    radius=lowerY-upperY;
  }

  public void knobDraw(float posX) {
    int stroke_weight=round((upperY-lowerY)/20);
    pushStyle();
    strokeWeight(stroke_weight);
    fill(200, 20, 20, 150);
    noStroke();
    ellipseMode(CENTER);
    ellipse(this.actualX, this.centerY, this.radius, this.radius);
    popStyle();
  }

  //dovrebbe essere chiamato da mouseDragged!
  public void setPosition(float posX) {
    if (selected&&!scroll.overlappedKnobs(posX))
      if (posX<leftX)
        actualX=leftX;
      else if (posX>rightX)
        actualX=rightX;
      else actualX=posX;
  }

  public float getX() {
    return actualX;
  }

  public void setX(float value, float posX) {
    actualX=posX-value;
  }

  public boolean inKnobMouse(float posX, float posY) {
    float cx=posX-actualX;
    float cy=posY-centerY;
    return (cx*cx+cy*cy<=radius*radius);
  }

  public void setKnobSelected(boolean value, float posX) {
    this.posX=posX;
    selected=value;
  }

  public boolean isSelected() {
    return selected;
  }
}

