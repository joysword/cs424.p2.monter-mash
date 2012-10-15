public class ImageButton {
  private PShape picture;
  private float centerX;
  private float centerY;
  private float widthP;
  private float heightP;

  public ImageButton(PShape picture, float centerX, float centerY, float widthP, float heightP) {
    this.picture=picture;
    this.centerX=centerX;
    this.centerY=centerY;
    this.widthP=widthP;
    this.heightP=heightP;
  }

  public void draw() {
    shapeMode(CENTER);
    shape(this.picture, this.centerX, this.centerY, this.widthP, this.heightP);
  }

  public  boolean checkOn(float myX, float myY) {
    if (myX>this.centerX-this.widthP/2 && myX<this.centerX+this.widthP/2
      && myY>this.centerY-this.heightP/2 && myY<this.centerY+this.heightP/2)
    {
      return true;
    }
    else {
      return false;
    }
  }
}

