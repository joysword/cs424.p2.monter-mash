public class Keyboard {
  private float cornerX;
  private float cornerY;
  private float keyDimension;
  private color col;
  
  private Key space;

  private ArrayList firstRow;
  private ArrayList secondRow;
  private ArrayList thirdRow;

  public Keyboard(float cornerX, float cornerY, float keyDimension, color col) {
    this.firstRow=new ArrayList();
    this.secondRow=new ArrayList();
    this.thirdRow=new ArrayList();
    this.cornerX=cornerX;
    this.cornerY=cornerY;
    this.keyDimension=keyDimension;
    this.col=col;

    this.firstRow.add(new Key("Q", this.cornerX, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("W", this.cornerX+1*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("E", this.cornerX+2*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("R", this.cornerX+3*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("T", this.cornerX+4*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("Y", this.cornerX+5*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("U", this.cornerX+6*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("I", this.cornerX+7*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("O", this.cornerX+8*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    this.firstRow.add(new Key("P", this.cornerX+9*this.keyDimension*1.1, this.cornerY, this.keyDimension, this.col));
    

    this.secondRow.add(new Key("A", this.cornerX+this.keyDimension*0.6, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("S", this.cornerX+this.keyDimension*0.6+1*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("D", this.cornerX+this.keyDimension*0.6+2*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("F", this.cornerX+this.keyDimension*0.6+3*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("G", this.cornerX+this.keyDimension*0.6+4*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("H", this.cornerX+this.keyDimension*0.6+5*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("J", this.cornerX+this.keyDimension*0.6+6*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("K", this.cornerX+this.keyDimension*0.6+7*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("L", this.cornerX+this.keyDimension*0.6+8*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    this.secondRow.add(new Key("backspace", this.cornerX+this.keyDimension*0.6+9*this.keyDimension*1.1, this.cornerY+1*this.keyDimension*1.1, this.keyDimension, this.col));
    ((Key)this.secondRow.get(9)).setLong();


    this.thirdRow.add(new Key("Z", this.cornerX+1*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
    this.thirdRow.add(new Key("X", this.cornerX+2*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
    this.thirdRow.add(new Key("C", this.cornerX+3*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
    this.thirdRow.add(new Key("V", this.cornerX+4*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
    this.thirdRow.add(new Key("B", this.cornerX+5*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
    this.thirdRow.add(new Key("N", this.cornerX+6*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
    this.thirdRow.add(new Key("M", this.cornerX+7*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
        this.thirdRow.add(new Key("enter", this.cornerX+8*this.keyDimension*1.1, this.cornerY+2*this.keyDimension*1.1, this.keyDimension, this.col));
            ((Key)this.thirdRow.get(7)).setLong();
space=new Key("spacebar", this.cornerX+2.5*this.keyDimension*1.1, this.cornerY+3*this.keyDimension*1.1, this.keyDimension, this.col);
space.isSpace=true;

  }

  public void draw() {
     //print("spazio "+space.checkOn(mouseX,mouseY));
    for (int i=0;i<firstRow.size();i++) {
      ((Key)firstRow.get(i)).draw();
    }
    for (int i=0;i<secondRow.size();i++) {
      ((Key)secondRow.get(i)).draw();
    }
    for (int i=0;i<thirdRow.size();i++) {
      ((Key)thirdRow.get(i)).draw();
    }
     space.draw();
  }
  
 

  public String checkPress(float myX, float myY) {
    for (int i=0;i<firstRow.size();i++) {
      if (((Key)firstRow.get(i)).checkOn(myX, myY)) {
        return ((Key)firstRow.get(i)).label;
      }
    }

for (int i=0;i<secondRow.size();i++) {
    if (((Key)secondRow.get(i)).checkOn(myX, myY)) {
      return ((Key)secondRow.get(i)).label;
    }
}

for (int i=0;i<thirdRow.size();i++) {
    if (((Key)thirdRow.get(i)).checkOn(myX, myY)) {
      return ((Key)thirdRow.get(i)).label;
    }
}

if(space.checkOn(myX, myY)){return " ";}
    return "";
  }
}

