public class SingleMoviePane{
  
 private float centerX;
 private float centerY;
 private float widthS;
 private float heightS;
 private PShape ciack;
 
 private Keyboard keyboard;
 private Movie movie;
 private SuggestionBox suggestionBox;
 
public SingleMoviePane(float centerX, float centerY, float widthS, float heightS, Movie movie){
this.centerX=centerX;
this.centerY=centerY;
this.widthS=widthS;
this.heightS=heightS;

this.keyboard=new Keyboard(this.centerX-this.widthS/2+this.widthS*0.705, this.centerY-this.heightS/2+this.heightS*0.5, this.heightS/15, color(255));
this.movie=movie;
this.suggestionBox= new SuggestionBox(this.centerX-this.widthS/2+this.widthS*0.85,  this.centerY-this.heightS/2+this.heightS*0.2,this.widthS*0.2,this.heightS*0.08);
this.ciack=loadShape("ciack2.svg");
}

public void draw(){
   rectMode(CENTER);
   fill(0);
   stroke(0,255,0);
   rect(this.centerX,this.centerY,this.widthS,this.heightS);
   line(this.centerX-this.widthS/2+this.widthS*0.7,this.centerY-this.heightS/2,this.centerX-this.widthS/2+this.widthS*0.7,this.centerY+this.heightS/2);
   shapeMode(CENTER);
   shape(this.ciack,this.centerX-this.widthS/2+this.widthS*0.35,this.centerY,this.widthS*0.7,this.heightS*1.04);
   //rect(width/2,height/2,width/6*4,height*0.95);
   this.keyboard.draw();
   this.suggestionBox.draw();
   
   
   fill(255);
   textAlign(LEFT,CENTER);
   textSize(200/scaling);
   text(this.movie.title,this.centerX-this.widthS/2+this.widthS*0.05,this.centerY-this.heightS/2+this.heightS*0.35);
   text("("+this.movie.year+")",this.centerX-this.widthS/2+this.widthS*0.05+textWidth(this.movie.title)+this.widthS/40,this.centerY-this.heightS/2+this.heightS*0.35);
  textSize(130/scaling);
   text("Genre: "+this.movie.genre,this.centerX-this.widthS/2+this.widthS*0.05,this.centerY-this.heightS/2+this.heightS*0.50);
   text("Running time: "+this.movie.runtime+"minutes",this.centerX-this.widthS/2+this.widthS*0.05,this.centerY-this.heightS/2+this.heightS*0.60);
   text("Plot: "+this.movie.description,this.centerX-this.widthS/2+this.widthS*0.05,this.centerY-this.heightS/2+this.heightS*0.70);
      text("Certificate: "+this.movie.certificate,this.centerX-this.widthS/2+this.widthS*0.05,this.centerY-this.heightS/2+this.heightS*0.80);
      text("Budget: "+this.movie.budget,this.centerX-this.widthS/2+this.widthS*0.05,this.centerY-this.heightS/2+this.heightS*0.90);


}
}
