public class monsterNode {
  public String monsterName="vampire";
  private float centerX;
  private float centerY;
  private float diameter;
  //private color nodeColor;
  private PImage avatar;
  private monsterNode father;
private boolean moving;
private float displaceFatherX;
private float displacefatherY;
private boolean moved=false;

  public monsterNode(String monsterName, float centerX, float centerY, float diameter, PImage avatar) {
    this.monsterName=monsterName;
    this.centerX=centerX;
    this.centerY=centerY;
    this.diameter=diameter;
    //this.nodeColor=nodeColor;
    this.avatar=avatar;
         }
public void setCenter(float x_n, float y_n){
this.centerX=x_n;
this.centerY=y_n;
}
  public void draw() {
    noStroke();
   // fill(this.nodeColor);
    imageMode(CENTER);
    image(this.avatar,this.centerX,this.centerY,diameter,diameter);
    //ellipse(this.centerX, this.centerY, diameter, diameter);
    fill(0);
    if(this.father!=null){
    textSize(this.diameter/6);
    if(this.centerX>this.father.centerX){
       textAlign(LEFT, CENTER);
    text(this.monsterName,this.centerX+this.diameter*0.6,this.centerY);
    }
    else{
    textAlign(RIGHT, CENTER);
    text(this.monsterName,this.centerX-this.diameter*0.6,this.centerY);
    }
    }
  }
  public boolean   checkOn(float myX, float myY){
    if(dist(myX,myY,this.centerX,this.centerY)<this.diameter/2){return true;}
    else {return false;}
  }
  public void setFather(monsterNode father){
  this.father=father;}
}

public void setDisplace(float displaceFatherX, float displaceFatherY){

}

