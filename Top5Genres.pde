public class Top5Genres {
  private float centerX;
  private float centerY;
  private float widthG;
  private float heightG;
  private float barWidth;

  private float maxYvalue=50;
  cc_DatabaseManager db;

  private ArrayList<StringCountPair> genresNames;//cointains names of top 5 genres for the selected monster
 

  public Top5Genres(float centerX, float centerY, float widthG, float heightG) {
    this.centerX=centerX;
    this.centerY=centerY;
    this.widthG=widthG;
    this.heightG=heightG;
    this.barWidth=this.widthG/20;
    db=new cc_DatabaseManager(context);
   
  }

  public void draw() {
    fill(0);
    stroke(255);
    strokeWeight(2/scaling);
    rectMode(CENTER);
    rect(this.centerX, this.centerY, this.widthG, this.heightG);

    drawlabels();

    for (int i=0;i<5;i++) {
      if(genresNames.size()>i){
      fill(255);
      textAlign(CENTER, TOP);
      textSize(this.widthG/30);
      text(genresNames.get(i).getString(), this.centerX-this.widthG/2+this.widthG/6*(i+1), this.centerY+this.heightG/2);

      float value=map((genresNames.get(i).getCount()), 0, this.maxYvalue, 0, this.heightG);
      rectMode(CENTER);
      fill(255, 0, 0);
      rect(this.centerX-this.widthG/2+this.widthG/6*(i+1), this.centerY+this.heightG/2-value/2, this.barWidth, value);
      }  
  }
  }

  public void setupDataMonster1(String monster1) {
     genresNames=db.getGenresTOP5(monster1);
     if(genresNames.size()>0)
     maxYvalue=genresNames.get(0).getCount();
  }
  
  public void setupDataMonster2(String monster2) {
     genresNames=db.getGenresTOP5(monster2);
     maxYvalue=genresNames.get(0).getCount();
  }

  public void drawlabels(){
    for (int i=0;i<=this.maxYvalue;i++) {
      textSize(this.widthG/30);
      textAlign(RIGHT, CENTER);
      fill(255);
      if (i%5==0) {
        print("C");
        text(i, this.centerX-this.widthG/2, this.centerY+this.heightG/2-map(i, 0, this.maxYvalue, 0, this.heightG));
        line(this.centerX-this.widthG/2, this.centerY+this.heightG/2-map(i, 0, this.maxYvalue, 0, this.heightG), this.centerX+this.widthG/2, this.centerY+this.heightG/2-map(i, 0, this.maxYvalue, 0, this.heightG));
      }
    }
  }
}

