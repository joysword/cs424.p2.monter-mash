public class ImageButton {
  private PImage picture;
  private float centerX;
  private float centerY;
  private float scaleFactor;
  private float widthP;
  private float heightP;

  public ImageButton(PImage picture, float centerX, float centerY, float scaleFactor) {
    this.picture=picture;
    this.centerX=centerX;
    this.centerY=centerY;
    this.scaleFactor=scaleFactor;
    this.widthP=this.picture.width/this.scaleFactor;
    this.heightP=this.picture.height/this.scaleFactor;
  }

  public void draw() {
    imageMode(CENTER);
    image(this.picture, this.centerX, this.centerY, this.widthP, this.heightP);
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

