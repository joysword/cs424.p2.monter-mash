public class Plot{
 private float centerX;
private float centerY;
private float widthP;
private float heightP;

public Plot(float centerX, float centerY,float widthP,float heightP ){
this.centerX=centerX;
this.centerY=centerY;
this.widthP=widthP;
this.heightP=heightP;
}

public void draw(){
  fill(0);
  stroke(255);
  rectMode(CENTER);
  rect(this.centerX,this.centerY,this.widthP,this.heightP);
  
}
}


