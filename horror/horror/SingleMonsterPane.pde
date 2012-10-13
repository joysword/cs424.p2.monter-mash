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
  private PShape hideButton;
  private PImage movieTape;
  private boolean firstTime=true;

  public SingleMonsterPane(float centerX, float centerY, float widthT, float heightT, color background) {
    this.centerX=centerX;
    this.centerY=centerY;
    this.widthT=widthT;
    this.heightT=heightT;
    this.background=background;
    this.hideButton=loadShape("hideButton.svg");
    this.movieTape=loadImage("movieTape.png");
    // this.plot1=new cc_MonsterPlot(this.centerX-this.widthT/4,this.centerY+this.heightT/5,this.widthT/3,this.heightT/3,"vampire","zombie",context);
    this.plot1=new cc_MonsterPlot(round(this.centerX-this.widthT/4-this.widthT/3/2), round(this.centerX-this.widthT/4+this.widthT/3/2), 
    round(this.centerY+this.heightT/5-this.heightT/3/2), round(this.centerY+this.heightT/5+this.heightT/4));
    this.worldMap=new Map(loadShape("worldMap.svg"), this.centerX+this.widthT/7, this.centerY-this.heightT/5, this.widthT/3, this.heightT/3);
    this.radar=new RadarChart(this.centerX+this.widthT/7, this.centerY+this.heightT/5, this.heightT/6, 5.0);
    this.compareMonster=new ImageButton(loadShape("compareMonster.svg"), this.centerX+this.widthT*0.35, this.centerY+this.heightT*0.45, 400/scaling,150/scaling);
  }


  public void setFirstTime() {
    firstTime=true;
  }

  public void draw() {
    if (firstTime) {
      plot1.setupData(matchName(monster.monsterName),"snake");
      radar.setupData(matchName(monster.monsterName));
      firstTime=false;
      plot1.monsterSetup();

    }
    rectMode(CENTER);
    fill(this.background);
    rect(this.centerX, this.centerY, this.widthT, this.heightT);
    fill(255);
    rectMode(CENTER);
    rect(this.centerX+this.widthT/2*0.87, this.centerY, this.widthT/2*0.2, this.heightT);
    imageMode(CENTER);
    image(this.movieTape, this.centerX+this.widthT/2*0.87, this.centerY, this.widthT/2*0.2, this.heightT);
    textAlign(LEFT, CENTER);
    textSize(100/scaling);
    text(this.monster.monsterName, this.centerX-this.widthT/2+this.widthT/50, this.centerY-this.heightT/2+this.heightT/20);
    plot1.monsterDraw();
    worldMap.draw();
    radar.draw();
    compareMonster.draw();
    imageMode(CENTER);
    image(this.monster.avatar, this.centerX-this.widthT/4, this.centerY-this.heightT/4+this.heightT/20, this.monster.avatar.width/3, this.monster.avatar.height/3);
    fill(255);
    shape(this.hideButton, this.centerX+this.widthT*0.47, this.centerY+this.heightT*0.44, 130/scaling, 130/scaling);
  }

  public void show() {
    this.show=true;
  }

  public void hide() {
    this.show=false;
  }

  public void setMonster(monsterNode monster) {
    this.monster = monster;
  }

  public void checkHideButton(float myX, float myY) {
    if (myX>this.centerX+this.widthT*0.47-130/scaling/2 && myX<this.centerX+this.widthT*0.47+130/scaling/2
      && myY>this.centerY+this.heightT*0.44-130/scaling/2 && myY<this.centerY+this.heightT*0.44+130/scaling/2) {
      this.hide();
        taxonomy.indexMoving=-1;
    }
  }

  public cc_MonsterPlot getPlot() {
    return plot1;
  }
  
  private String matchName(String value){
    return MatchTaxonomy.matchName(value);
  }
}

