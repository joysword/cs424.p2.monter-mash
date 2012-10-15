public class RadarChart {

  private float centerX;
  private float centerY;
  private float diameter;
  private float angle;
  private float dimension;
  private RadarDataManager radarDataManager;

  public RadarChart(float centerX, float centerY, float diameter, float dimension) {
    this.centerX=centerX;
    this.centerY=centerY;
    this.diameter=diameter;
    this.dimension=dimension;
    this.angle=360/this.dimension;
  }

  public void setupData(String monster) {
    radarDataManager=new RadarDataManager(monster);
  }

  public void draw() {
    stroke(255);
    strokeWeight(25/scaling);
    point(this.centerX, this.centerY);
    this.drawAxis();
    //this.drawShape(radarDataManager.getXdataPop(),radarDataManager.getDataMax(cc_PlottedData.POPULARITY),20,100,30,100,50,100,90,100);
    this.drawShape(1, 1, 20, 100, 30, 100, 50, 100, 90, 100);
    this.drawLabels("Label 1", "Label 2", "Label 3", "Label 4", "Label 5");
  }

  private float getX(float ang, float len) {
    return (centerX + (len * cos(radians(ang))));
  }

  private float getY(float ang, float len) {
    return (centerY + (len * sin(radians(ang))));
  }   

  private void drawAxis() {
    stroke(255);
    strokeWeight(10/scaling);
    for (int i=0;i<this.dimension;i++) {
      line(this.centerX, this.centerY, this.getX(0+this.angle*i, diameter), this.getY(this.angle*i, diameter));
    }
  }

  private float[] drawPoint(float value, float maximum, float angle) {
    float[] pointPos= {
      0, 0
    };

    stroke(255, 0, 0);
    float mappedValue=map(value, 0, maximum, 0, this.diameter);
    pointPos[0]=getX(angle, mappedValue);
    pointPos[1]=getY(angle, mappedValue);
    strokeWeight(40/scaling);
    point(pointPos[0], pointPos[1]);
    return pointPos;
  }
  private void drawShape(float v1, float m1, float v2, float m2, float v3, float m3, float v4, float m4, float v5, float m5) {
    float[] point1, point2, point3, point4, point5;
    point1=this.drawPoint(v1, m1, this.angle);
    point2=this.drawPoint(v2, m2, this.angle*2);
    point3=this.drawPoint(v3, m3, this.angle*3);
    point4=this.drawPoint(v4, m4, this.angle*4);
    point5=this.drawPoint(v5, m5, this.angle*5);
    strokeWeight(20/scaling);
    line(point1[0], point1[1], point2[0], point2[1]);
    line(point2[0], point2[1], point3[0], point3[1]);
    line(point3[0], point3[1], point4[0], point4[1]);
    line(point4[0], point4[1], point5[0], point5[1]);
    line(point5[0], point5[1], point1[0], point1[1]);
  }

  public void drawLabels(String l1, String l2, String l3, String l4, String l5) {
    fill(255);
    textSize(40/scaling);
    textAlign(LEFT, CENTER);
    text(l1, getX(0, this.diameter)+this.diameter/15, getY(0, this.diameter));
    text(l2, getX(this.angle, this.diameter), getY(this.angle, this.diameter)+this.diameter/15);
    textAlign(RIGHT, CENTER);
    text(l3, getX(this.angle*2, this.diameter)-this.diameter/30, getY(this.angle*2, this.diameter));
    text(l4, getX(this.angle*3, this.diameter)-this.diameter/30, getY(this.angle*3, this.diameter));
    textAlign(LEFT, BOTTOM);
    text(l5, getX(this.angle*4, this.diameter), getY(this.angle*4, this.diameter)-this.diameter/30);
  }
}

