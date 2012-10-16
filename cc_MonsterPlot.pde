/**
 		The class <b>MonsterPlot</b> Plots data for the monster page 
 		*/


public class cc_MonsterPlot {
  private static final float GRAPH_DATA_STROKE_WIDTH=0.00694;
  private static final int GRAPH_DATA_COLOR=220;
  private static final float GRAPH_DATA_LABELS_SIZE=0.00694;
  private static final float HOW_MUCH_LABEL_IS_UNDER_PLOT=0.06;  
  private static final float X_LEFT_PROPORTION_INNER= 0.1;
  private static final float X_RIGHT_PROPORTION_INNER= 0.1;
  private static final float Y_UPPER_PROPORTION_INNER= 0.15;
  private static final float Y_LOWER_PROPORTION_INNER= 0.15;
  private static final float DISTANCE_LABEL_FROM_PLOT= 0.03;
  private static final float TEXT_FACTOR=0.007;
  private static final float STROKE_1_PROPORTION=0.001;
  private static final float LINE_PROPORITON=3.0;
  private static final int OP=50;


  private int leftX;
  private int rightX;
  private int upperY;
  private int lowerY;
  private int innerLeftX;
  private int innerRightX;
  private int innerUpperY;
  private int innerLowerY;
  private cc_PlotDataManager dataManager1;
  private cc_PlotDataManager dataManager2;
  private cc_MonsterScroll scroll;
  private float x, y;
  private float intervalYear=5;
  private float max;
  private float refX;


  public cc_MonsterPlot(int leftX, int rightX, int upperY, int lowerY) {
    this.leftX=leftX;
    this.rightX=rightX;
    this.upperY=upperY;
    this.lowerY=lowerY;
    innerLeftX=round(leftX+(rightX-leftX)*X_LEFT_PROPORTION_INNER);
    innerRightX=round(rightX-(rightX-leftX)*X_RIGHT_PROPORTION_INNER);
    innerUpperY=round(upperY+(lowerY-upperY)*Y_UPPER_PROPORTION_INNER);
    innerLowerY=round(lowerY-(lowerY-upperY)*Y_LOWER_PROPORTION_INNER);
    scroll=new cc_MonsterScroll(innerLeftX, innerRightX, innerLowerY, lowerY);
  }

  public void setupDataMonster1(String monster1){
    dataManager1=new cc_PlotDataManager(monster1, context);
    dataManager1.setData(cc_PlottedData.NUMBER_FILMS);
  }
  public void setupDataMonster2(String monster2){
    dataManager2=new cc_PlotDataManager(monster2, context);
    dataManager2.setData(cc_PlottedData.NUMBER_FILMS);
  }


  public void monsterSetup() {
    scroll.scrollSetup();
  }

  public void monsterDraw() {
    pushStyle();
    fill(0);
    rectMode(CORNERS);
    rect(leftX, upperY, rightX, lowerY);
    popStyle();
    max=getMax();
    scroll.scrollDraw();
    drawYaxe();
    drawLabels();
    drawDataPlot1();
    if(dataManager2!=null)
      drawDataPlot2();
  }

  private void drawDataPlot1() {
    pushStyle();
    smooth();
    strokeWeight(LINE_PROPORITON*(rightX-leftX)*STROKE_1_PROPORTION);
    beginShape();
    stroke(60, 200, 20);
    fill(60, 200, 20, OP);
    x = map(scroll.getMinYear(), scroll.getMinYear(), scroll.getMaxYear(), innerLeftX, innerRightX); 
    y = map(0, dataManager1.getDataMin(), max, innerLowerY, innerUpperY);
    vertex(x, y);
    for (int i=0;i<dataManager1.datasetSize();i++) {
      if ((i>=scroll.getMinYear()-1890)&&(i<=scroll.getMaxYear()-1890)) {
        x = map(dataManager1.getX(i), scroll.getMinYear(), scroll.getMaxYear(), innerLeftX, innerRightX); 
        y = map(dataManager1.getY(i), dataManager1.getDataMin(), max, innerLowerY, innerUpperY);
        if (x>0)
          vertex(x, y);
      }
    } 
    x = map(scroll.getMaxYear(), scroll.getMinYear(), scroll.getMaxYear(), innerLeftX, innerRightX); 
    y = map(0, dataManager1.getDataMin(), max, innerLowerY, innerUpperY);
    vertex(x, y);
    endShape();
    popStyle();
  }

  private void drawDataPlot2() {
    pushStyle();
    smooth();
    strokeWeight(LINE_PROPORITON*(rightX-leftX)*STROKE_1_PROPORTION);

    beginShape();
    stroke(200, 60, 20);
    fill(200, 60, 20, OP);
    x = map(scroll.getMinYear(), scroll.getMinYear(), scroll.getMaxYear(), innerLeftX, innerRightX); 
    y = map(0, dataManager2.getDataMin(), max, innerLowerY, innerUpperY);
    vertex(x, y);
    for (int i=0;i<dataManager2.datasetSize();i++) {
      if ((i>=scroll.getMinYear()-1890)&&(i<=scroll.getMaxYear()-1890)) {
        x = map(dataManager2.getX(i), scroll.getMinYear(), scroll.getMaxYear(), innerLeftX, innerRightX); 
        y = map(dataManager2.getY(i), dataManager2.getDataMin(), max, innerLowerY, innerUpperY);
        if (x>0)
          vertex(x, y);
      }
    } 
    x = map(scroll.getMaxYear(), scroll.getMinYear(), scroll.getMaxYear(), innerLeftX, innerRightX); 
    y = map(0, dataManager2.getDataMin(), max, innerLowerY, innerUpperY);
    vertex(x, y);
    endShape();
    popStyle();
  }

  private void drawYaxe() {
    float volumeInterval=20;
    pushStyle();
    float volumeIntervalMinor=10;
    fill(0);
    setFontSize();
    textAlign(RIGHT);
    strokeWeight((rightX-leftX)*STROKE_1_PROPORTION); 
    stroke(GRAPH_DATA_COLOR);
    fill(GRAPH_DATA_COLOR);

    strokeWeight((rightX-leftX)*STROKE_1_PROPORTION);
    for (float v = 0; v <= max; v += volumeIntervalMinor) {
      if (v % volumeIntervalMinor == 0) {     // If a tick mark
        float y = map(v, 0, max, innerLowerY, innerUpperY);  
        if (v % volumeInterval == 0) {        // If a major tick mark
          float textOffset = textAscent()/2;  // Center vertically
          if (v == 0) {
            textOffset = 0;                   // Align by the bottom
          } 
          else if (v == max) {
            textOffset = textAscent();        // Align by the top
          }

          text(floor(v), innerLeftX -(rightX-leftX)*0.02, y + textOffset);
          line(innerLeftX -(rightX-leftX)*0.01, y, innerLeftX, y);     // Draw major tick
        } 
        else {
          line(innerLeftX -(rightX-leftX)*0.005, y, innerLeftX, y);     // Draw minor tick
        }
      }
    }

    popStyle();
  }

  private void drawLabels() {
    pushStyle();
    fill(GRAPH_DATA_COLOR);
    stroke(GRAPH_DATA_COLOR);
    setFontSize();
    textAlign(CENTER, TOP);
    strokeWeight((rightX-leftX)*STROKE_1_PROPORTION); 
    x = map(1890, dataManager1.getYearMin(), dataManager1.getYearMax(), innerLeftX, innerRightX);
    text(1890, x, innerLowerY+(lowerY-upperY)*DISTANCE_LABEL_FROM_PLOT);
    line(x, innerUpperY, x, innerLowerY);
    float x;
    for (int i=0;i<dataManager1.datasetSize();i++) {
      if ((i%intervalYear==0)) {
        x = map(dataManager1.getX(i), dataManager1.getYearMin(), dataManager1.getYearMax(), innerLeftX, innerRightX);
        text(dataManager1.getX(i), x, innerLowerY+(lowerY-upperY)*DISTANCE_LABEL_FROM_PLOT);
        line(x, innerUpperY, x, innerLowerY);
      }
    }
    popStyle();
  }

  private void drawTitle() {
  }

  public void setFontSize() {
    float fontSizeFloat=height*TEXT_FACTOR;
    textSize(fontSizeFloat);
  }

  private float getMax() {
    if (dataManager2==null)
      return dataManager1.getDataMax();
    if (dataManager2.getDataMax()>dataManager1.getDataMax())
      return dataManager2.getDataMax();
    else return dataManager1.getDataMax();
  }

  public boolean inKnobLeftMouse(float posX, float posY) {
    return scroll.inKnobLeftMouse(posX, posY);
  }

  public boolean inKnobRightMouse(float posX, float posY) {
    return scroll.inKnobRightMouse(posX, posY);
  }

  public void setKnobLeftSelected(boolean value, float posX) {
    scroll.setKnobLeftSelected(value, posX);
  }

  public void setKnobRightSelected(boolean value, float posX) {
    scroll.setKnobRightSelected(value, posX);
  }

  public void setRectSelected(boolean value) {
    scroll.setRectSelected(value);
  }

  public boolean isRectSelected(float posX, float posY) {
    return scroll.isRectSelected(posX, posY);
  }

  public void setRefX(float minValue, float maxValue, float xPos) {
    scroll.setKnobs(minValue, maxValue, xPos);
  }

  public boolean isSelected() {
    return scroll.isSelected();
  }

  public float getActualKnobXRight() {
    return scroll.getActualKnobXRight();
  }

  public float getActualKnobXLeft() {
    return scroll.getActualKnobXLeft();
  }
}

