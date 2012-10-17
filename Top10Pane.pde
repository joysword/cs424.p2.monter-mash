monsterNode monster1, monster2;

public class Top10Pane {
  private float centerX;
  private float centerY;
  private float widthT;
  private float heightT;

  private float minimumLine;
  private float maximumLine;
  private float maximumNumber=40;
  private float barWidth=60/scaling;

  private ArrayList<monsterNode> topMonsters;
  private ArrayList<StringCountPair> numberMovies;
  private float nodeDiameterFather, nodeDiameterChild;
  private cc_DatabaseManager db;

  private Top10Pane(float centerX, float centerY, float widthT, float heightT,int min, int max) {
    this.centerX=centerX;
    this.centerY=centerY;
    this.widthT=widthT;
    this.heightT=heightT;
    this.minimumLine=this.centerY+this.heightT*0.4;
    this.maximumLine=this.centerY-this.heightT*0.25;
    db=new cc_DatabaseManager(context);
    nodeDiameterFather=this.heightT/7;
    nodeDiameterChild=this.heightT/10;
    topMonsters=new ArrayList<monsterNode>();
    numberMovies=db.getMonsterTOP10(min,max);
    if(numberMovies.size()>0)
      maximumNumber=numberMovies.get(0).getCount();
    maximumNumber=50;
  }

  public void draw() {
    pushStyle();
    rectMode(CENTER);
    fill(255);
    strokeWeight(40/scaling);
    stroke(0);
    rect(this.centerX, this.centerY, this.widthT, this.heightT);

    fill(0);
    rectMode(CORNERS);
    rect(this.centerX-this.widthT/2, this.minimumLine, this.centerX+this.widthT/2, this.centerY+this.heightT/2);
    rect(this.centerX-this.widthT/2, this.centerY-this.heightT/2, this.centerX+this.widthT/2, this.centerY-this.heightT/2+this.heightT*0.2);

    fill(255);
    textSize(120/scaling);
    textAlign(CENTER, CENTER);
    text("Top 10 monsters by number of movies", this.centerX, this.centerY-this.heightT*0.4225);

    strokeWeight(10/scaling);
    line(0, this.minimumLine, width, this.minimumLine);
    line(0, this.maximumLine, width, this.maximumLine);

    for (int i=0;i<this.topMonsters.size();i++) {
      float value=map((float)this.numberMovies.get(i).getCount(), 0, this.maximumNumber, this.minimumLine, this.maximumLine);

      rectMode(CORNERS);
      fill(0);
      noStroke();
      rect(centerX-this.widthT/11/2-this.widthT/11*this.topMonsters.size()/2+this.widthT/11*(i+1)-this.barWidth/2, value, 
      centerX-this.widthT/11/2-this.widthT/11*this.topMonsters.size()/2+this.widthT/11*(i+1)+this.barWidth/2, this.minimumLine);
      ((monsterNode)this.topMonsters.get(i)).setCenter(centerX-this.widthT/11/2-this.widthT/11*this.topMonsters.size()/2+this.widthT/11*(i+1), value-nodeDiameterChild/2);
      ((monsterNode)this.topMonsters.get(i)).draw();

      textSize(40/scaling);
      textAlign(CENTER, CENTER);
      text(numberMovies.get(i).getString(), centerX-this.widthT/11/2-this.widthT/11*this.topMonsters.size()/2+this.widthT/11*(i+1), value-nodeDiameterChild*1.5);
      text((int)Math.round((float)this.numberMovies.get(i).getCount()), centerX-this.widthT/11/2-this.widthT/11*this.topMonsters.size()/2+this.widthT/11*(i+1), value-nodeDiameterChild*1.25);
    }

    int siz=10;
    for (int i=0;i<siz;i++) {
      stroke(255, 0, 0);
      line(centerX-this.widthT/11/2-this.widthT/11*siz/2+this.widthT/11*(i+1), 0, centerX-this.widthT/11/2-this.widthT/11*siz/2+this.widthT/11*(i+1), height);
    }
    popStyle();
  }
}

