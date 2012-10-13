public class Key {
  private float cornerX;
  private float cornerY;
  private float dimension;
  private color col;
  private String label;
  boolean longKey=false;
  boolean isSpace=false;

  public Key(String label, float cornerX, float cornerY, float dimension, color col) {
    this.cornerX=cornerX;
    this.cornerY=cornerY;
    this.dimension=dimension;
    this.col=col;
    this.label=label;
  }

  public void draw() {
   
    noStroke();
    rectMode(CORNER);
    fill(this.col);
    if(this.isSpace){rect(this.cornerX, this.cornerY, this.dimension*6, this.dimension);}
    else if(!this.longKey){
    rect(this.cornerX, this.cornerY, this.dimension, this.dimension);}
    
  else{rect(this.cornerX, this.cornerY, this.dimension*2, this.dimension);}
    
    fill(0);
    textSize(dimension/3);
    textAlign(CENTER, CENTER);
    if(!this.longKey){
    text(this.label, this.cornerX+this.dimension/2,this.cornerY+this.dimension/2 );}
        else{text(this.label, this.cornerX+this.dimension,this.cornerY+this.dimension/2 );}
    }
    
   public boolean checkOn(float myX, float myY){
         if(this.isSpace){
         if(myX>this.cornerX && myX<this.cornerX+this.dimension*6
   && myY>this.cornerY && myY<this.cornerY+this.dimension){return true;}
   else{return false;}
         }
     if(!this.longKey){
   if(myX>this.cornerX && myX<this.cornerX+this.dimension
   && myY>this.cornerY && myY<this.cornerY+this.dimension){return true;}
   else{return false;}}
      else{
    if(myX>this.cornerX && myX<this.cornerX+this.dimension*2
   && myY>this.cornerY && myY<this.cornerY+this.dimension*2){return true;}
   else{return false;}
   }
   
   }
   
   public void setLong(){
   this.longKey=true;}
  }

