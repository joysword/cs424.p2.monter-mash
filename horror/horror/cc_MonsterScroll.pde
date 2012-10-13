public class cc_MonsterScroll {

  private float leftX;
  private float rightX;
  private float upperY;
  private float lowerY;
  private float lowerYScroll;
  private float upperYScroll;
  private cc_KnobScroll rightKnob;
  private cc_KnobScroll leftKnob;
  private float centerY, radius;
  private boolean selectedRect;
  // note upperY is InnerLowerY of MonsterPlot
  public cc_MonsterScroll(float leftX, float rightX, float upperY, float lowerY) {
    this.leftX=leftX;
    this.rightX=rightX;
    this.upperY=upperY;
    this.lowerY=lowerY;
    lowerYScroll=upperY+(lowerY-upperY)/2;
    upperYScroll=lowerY-(lowerY-upperY)/4;
    rightKnob=new cc_KnobScroll(leftX, rightX, upperYScroll, lowerYScroll, rightX-30,this);
    leftKnob=new cc_KnobScroll(leftX, rightX, upperYScroll, lowerYScroll, leftX+60,this);
    centerY=upperYScroll+(lowerYScroll-upperYScroll)/2;
    radius=lowerYScroll-upperYScroll;
  }

  public void scrollSetup() {
    rightKnob.knobSetup();
    leftKnob.knobSetup();
  }

  public void scrollDraw() {
    println(selectedRect);
    pushStyle();
    fill(100);
    noStroke();
    ellipse(leftX, centerY, radius, radius);
    ellipse(rightX, centerY, radius, radius);
    rectMode(CORNERS);
    rect(leftX, lowerYScroll, rightX, upperYScroll);
    if(selectedRect) fill(230,230,200,100);
    else fill(200, 20, 20, 100);
    rect(leftKnob.getX(), lowerYScroll, rightKnob.getX(), upperYScroll);
    popStyle();
    drawYears();
    rightKnob.knobDraw();
    leftKnob.knobDraw();
  }

  public void drawYears() {
    float year_interval=122;
    float ix=leftX;
    float l=rightX-leftX;
    float interval=l/year_interval;
    int stroke_weight=round((lowerY-upperY)/30);
    pushStyle();
    stroke(0);
    strokeWeight(stroke_weight);
    for (int i=0;i<year_interval;i++) {
      line(ix, lowerYScroll, ix, upperYScroll);
      ix+=interval;
    }
    popStyle();
  }


  public float getUpperYScroll() {
    return upperYScroll;
  }

  public float getLowerYScroll() {
    return lowerYScroll;
  }

  public float getRightX() {
    return rightX;
  }

  public float getLeftX() {
    return leftX;
  }

  public int getMinYear() {
    float k=leftKnob.getX()-leftX;
    float l=(rightX-leftX);
    return round(122*k/l)+1890;
  }

  public int getMaxYear() {
    float k=rightKnob.getX()-leftX;
    float l=(rightX-leftX);
    return round(122*k/l)+1890;
  }

  public boolean inKnobLeftMouse(float posX,float posY) {
    return leftKnob.inKnobMouse(posX,posY);
  }

  public boolean inKnobRightMouse(float posX, float posY) {
    return rightKnob.inKnobMouse(posX,posY);
  }


  public void setKnobLeftSelected(boolean value,float posX){
    leftKnob.setKnobSelected(value,posX);
  }
  public void setKnobRightSelected(boolean value,float posX){
    rightKnob.setKnobSelected(value,posX);
  }
  
  public void setRectSelected(boolean value){
    selectedRect=value;
  }
  
  public boolean isSelected(){
    return selectedRect;
  }
  
  public boolean isRectSelected(float posX,float posY){
   return (posX>leftKnob.getX()+(leftKnob.getX()-rightKnob.getX())/2 && posX<rightKnob.getX()-(leftKnob.getX()-rightKnob.getX())/2 && posY>lowerYScroll && posY<upperYScroll);
  }
  
  public void setKnobs(float minValue, float maxValue, float posX){
    if(posX-minValue>=leftX&&posX-maxValue<=rightX){
     rightKnob.setX(maxValue,posX);
     leftKnob.setX(minValue,posX);
    }
  }
  
  public float getActualKnobXRight(){
    return rightKnob.getX();
  }
  
  public float getActualKnobXLeft(){
   return leftKnob.getX(); 
  }
  
  public boolean overlappedKnobs(){
    float rightExtremeX=rightKnob.getX()+radius;
    float leftExtremeX=leftKnob.getX()-radius;
    if(rightKnob.isSelected())
      return mouseX<=leftExtremeX;
    if(leftKnob.isSelected())
      return mouseX>=rightExtremeX;
    return false;
  }
  
}

