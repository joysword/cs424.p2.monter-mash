public class SingleMonsterPane {
  
  private cc_MonsterPlot plot1;
  private Map worldMap;
  private RadarChart radar;
  private ImageButton compareMonster;
  
  private float centerX;
  private float centerY;
  private float widthT;
  private float heightT;
 private boolean show=false;
  private color background;
  private monsterNode monster;
  private PImage hideButton;
  private PImage movieTape;
  
    public SingleMonsterPane(float centerX, float centerY, float widthT, float heightT, color background) {
    this.centerX=centerX;
    this.centerY=centerY;
    this.widthT=widthT;
    this.heightT=heightT;
     this.background=background;
     this.hideButton=loadImage("hideButton.png");
     this.movieTape=loadImage("movieTape.png");
     
     this.plot1=new cc_MonsterPlot(round(this.centerX-this.widthT/4-this.widthT/3/2),round(this.centerX-this.widthT/4+this.widthT/3/2),round(this.centerY+this.heightT/5-this.heightT/3/2),round(this.centerY+this.heightT/5
       +this.heightT/3/2),"vampire","zombie",context);
         // this.plot1=new cc_MonsterPlot(this.centerX-this.widthT/4,this.centerY+this.heightT/5,this.widthT/3,this.heightT/3,"vampire","zombie",context);

     plot1.monsterSetup();
     this.worldMap=new Map(loadShape("worldMap.svg"),this.centerX+this.widthT/7,this.centerY-this.heightT/5,this.widthT/3,this.heightT/3);
     this.radar=new RadarChart(this.centerX+this.widthT/7,this.centerY+this.heightT/5,this.heightT/6,5);
     this.compareMonster=new ImageButton(loadImage("compareMonster.png"), this.centerX+this.widthT*0.3, this.centerY+this.heightT*0.45, 3);
  }


  
  public void draw(){
  rectMode(CENTER);
    fill(this.background);
    rect(this.centerX, this.centerY, this.widthT, this.heightT);
    fill(255);
    rectMode(CENTER);
    rect(this.centerX+this.widthT/2*0.87,this.centerY,this.widthT/2*0.2,this.heightT);
    imageMode(CENTER);
    image(this.movieTape,this.centerX+this.widthT/2*0.87,this.centerY,this.widthT/2*0.2,this.heightT);
    textAlign(LEFT,CENTER);
    textSize(100/scaling);
    text(this.monster.monsterName,this.centerX-this.widthT/2+this.widthT/50,this.centerY-this.heightT/2+this.heightT/20);
  plot1.monsterDraw();
 worldMap.draw();
 radar.draw();
 compareMonster.draw();
  imageMode(CENTER);
  image(this.monster.avatar,this.centerX-this.widthT/4,this.centerY-this.heightT/4+this.heightT/20,this.monster.avatar.width/3,this.monster.avatar.height/3);
  image(this.hideButton,this.centerX-this.widthT*0.47,this.centerY+this.heightT*0.44,this.hideButton.width/scaling*2,this.hideButton.height/scaling*2);
}
  
  public void show(){
  this.show=true;}
  
  public void hide(){
  this.show=false;
  }
  
  public void setMonster(monsterNode monster){
  this.monster = monster;
  }
  
  public void checkHideButton(float myX, float myY){
  if(myX>this.centerX+this.widthT*0.47-this.hideButton.width/scaling && myX<this.centerX+this.widthT*0.47+this.hideButton.width/scaling
  && myY>this.centerY+this.heightT*0.44-this.hideButton.height/scaling && myY<this.centerY+this.heightT*0.44+this.hideButton.height/scaling){
  this.hide();}
  }
}

