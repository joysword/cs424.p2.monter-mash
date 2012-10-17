public class SingleMonsterPane {

  private cc_MonsterPlot plot1;
  // private Map worldMap;
  //private Chart ;
  private Top5Genres top5Genres;
  private ImageButton compareMonster1, compareMonster2;
  private MatchTaxonomy matchTax;

  private float centerX;
  private float centerY;
  private float widthT;
  private float heightT;
  private boolean show=false;
  private color background;
  private monsterNode monster;
  private monsterNode monster_2;
  private PShape hideButton;
  private PImage movieTape;
  private boolean firstTime=true;
  private String monster1="vampire";
  private String monster2="zombie";

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
    round(this.centerY+this.heightT/5-this.heightT/3*0.7), round(this.centerY+this.heightT/5+this.heightT/4));
    //this.worldMap=new Map(loadShape("worldMap.svg"), this.centerX+this.widthT/7, this.centerY-this.heightT/5, this.widthT/3, this.heightT/3);
    //this.radar=new RadarChart(this.centerX+this.widthT/7, this.centerY+this.heightT/5, this.heightT/6, 5.0);
    this.top5Genres=new Top5Genres(this.centerX+this.widthT/7, this.centerY+this.heightT/4*0.89, this.heightT, this.heightT/3*1.1);
    this.compareMonster1=new ImageButton(loadShape("compareMonster.svg"), this.centerX+this.widthT*0.35, this.centerY+this.heightT*0.45, this.heightT/6, this.heightT/20);
     this.compareMonster2=new ImageButton(loadShape("compareMonster2.svg"), this.centerX+this.widthT*0.41, this.centerY+this.heightT*0.45, this.heightT/6, this.heightT/20);

  }


  public void setFirstTime() {
    firstTime=true;
  }


  private void setupMonster1(){
    plot1.setupDataMonster1(matchName(monster1));
    top5Genres.setupDataMonster1(matchName(monster1));
  }
  
  private void setupMonster2(){
    plot1.setupDataMonster2(matchName(monster2));
    top5Genres.setupDataMonster2(matchName(monster2));
  }
  
  
  public void draw() {
    pushStyle();

    if (firstTime) {
      setupMonster1();
      //setupMonster2();
      firstTime=false;
      plot1.monsterSetup();
    }


    rectMode(CENTER);
    fill(this.background);
    rect(this.centerX, this.centerY, this.widthT, this.heightT);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(this.heightT/20);
    fill(255, 0, 0);
    text(MOST_KWORDS[LA], this.centerX+this.widthT/7, this.centerY-this.heightT*0.4);
    text(MOST_GENRES[LA], this.centerX+this.widthT/7, this.centerY-this.heightT*0.025);
 

    fill(255);
    rectMode(CENTER);
    // rect(this.centerX+this.widthT/2*0.87, this.centerY, this.widthT/2*0.2, this.heightT);
    imageMode(CENTER);
    //image(this.movieTape, this.centerX+this.widthT/2*0.87, this.centerY, this.widthT/2*0.2, this.heightT);
    textAlign(LEFT, CENTER);
    textSize(this.heightT/20);
    if(this.monster_2==null){
    text(this.monster.monsterName, this.centerX-this.widthT/2+this.widthT/50, this.centerY-this.heightT/2+this.heightT/12);}
    else{text(this.monster.monsterName, this.centerX-this.widthT/2+this.widthT/50, this.centerY-this.heightT/2+this.heightT/12);
    text("vs", this.centerX-this.widthT/2+this.widthT/50, this.centerY-this.heightT/2+this.heightT/5.5);
  text(this.monster_2.monsterName, this.centerX-this.widthT/2+this.widthT/50, this.centerY-this.heightT/2+this.heightT/3.5);}
    plot1.monsterDraw();
      textAlign(CENTER, CENTER);
    textSize(this.heightT/20);
    fill(255, 0, 0);
       text(NUMBER_MOVIE[LA], this.centerX-this.widthT/4, this.centerY-this.heightT*0.025);
    //worldMap.draw();
    //radar.draw();
    top5Genres.draw();
    compareMonster1.draw();
        compareMonster2.draw();

    imageMode(CENTER);
    if(this.monster_2==null){image(this.monster.avatar, this.centerX-this.widthT/4, this.centerY-this.heightT/3+this.heightT/20, this.heightT/3.3,this.heightT/3.3);}
    else{ 
    image(this.monster.avatar, this.centerX-this.widthT/4-this.widthT/13, this.centerY-this.heightT/3+this.heightT/20,  this.heightT/3.3,this.heightT/3.3);
    image(this.monster_2.avatar, this.centerX-this.widthT/4+this.widthT/13, this.centerY-this.heightT/3+this.heightT/20,  this.heightT/3.3,this.heightT/3.3);}

    fill(255);
    shape(this.hideButton, this.centerX+this.widthT*0.47, this.centerY+this.heightT*0.44, this.heightT/15, this.heightT/15);
    textAlign(CENTER, BOTTOM);
    textSize(this.heightT/24);
    
       if(this.monster_2==null){
    text(plot1.dataManager1.db.getPureKeywords(matchTax.matchName(monster.monsterName)), this.centerX+this.widthT/7, this.centerY-this.heightT/15);}
else{
text(plot1.dataManager1.db.getPureKeywords(matchTax.matchName(monster.monsterName)), this.centerX+this.widthT/15, this.centerY-this.heightT/15);
   text(plot1.dataManager1.db.getPureKeywords(matchTax.matchName(monster_2.monsterName)), this.centerX+this.widthT/4, this.centerY-this.heightT/15);}

    popStyle();
  }

  public void show() {
    this.show=true;
  }

  public void hide() {
    this.show=false;
  }

  public void setMonster(monsterNode monster) {
    this.monster = monster;
    monster1=monster.monsterName;
  }

  public void checkHideButton(float myX, float myY) {
    if (myX>this.centerX+this.widthT*0.47-this.heightT/15/2 && myX<this.centerX+this.widthT*0.47+this.heightT/15/2
      && myY>this.centerY+this.heightT*0.44-this.heightT/15/2 && myY<this.centerY+this.heightT*0.44+this.heightT/15/2) {
      this.hide();
      ui.getMonsterPage().getTaxonomy().indexMoving=-1;
    }
  }

  public cc_MonsterPlot getPlot() {
    return plot1;
  }

  private String matchName(String value) {
    return MatchTaxonomy.matchName(value);
  }
}

