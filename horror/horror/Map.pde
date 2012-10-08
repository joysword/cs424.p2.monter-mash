
public class Map {
  private PShape worldMap;
  private float centerX;
  private float centerY;
  private float widthM;
  private float heightM;
 
 public Map(PShape worldMap, float centerX,float centerY,float widthM,float heightM){
    this.worldMap=worldMap;
   this.centerX=centerX;
   this.centerY=centerY;
   this.widthM= widthM;
   this.heightM = heightM;
}

  void draw() {
    fill(#d5d5e5);
    noStroke();
    rectMode(CENTER);
    rect(this.centerX,this.centerY,this.widthM,this.heightM);
    shapeMode(CENTER);
    shape(this.worldMap,this.centerX,this.centerY,this.widthM,this.heightM);
  }
}


