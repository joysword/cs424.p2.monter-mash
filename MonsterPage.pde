float distanceX, distanceY;
int monsterToSelect=1;

class MonsterPage {
  boolean taxonomyTab;
  boolean movieTab;
  boolean showTop10;
float finalX, finalY;
  SingleMoviePane moviePane;

  monsterTaxonomy taxonomy;
  PApplet context;
  ScrollMouseManager scrollMouseManager;



  MonsterPage() {
    taxonomyTab = true;
    movieTab = false;
    showTop10 = false;

    context = applet;

    scrollMouseManager = new ScrollMouseManager();

    

    //movie = moviePane.suggestionBox.suggestions.get(0);
    taxonomy = new monsterTaxonomy(width*0.5, height*0.57, width*0.95, height*0.79, color(255));
    taxonomy.setup();
  }

  void render() {

    pushStyle();

    fill(TITLE_COLOR);
    textSize(TITLE_SIZE);
    textAlign(CENTER,CENTER);
    text("MADDENED MUSCLE MONSTER MASH MUSEUM", width*0.5, height*0.07);

    popStyle();
    taxonomy.draw();
  }

  void mousePressed_(float xPos, float yPos) {
   if (taxonomyTab) { 
      taxonomy.noMoving();
    if (this.taxonomy.singleMonsterPane.show) {
      
      
      
      
    }
    scrollMouseManager.knobPressed(taxonomy.getMonsterPane().getPlot(), xPos, yPos);
  }
    
  if(this.taxonomy.singleMonsterPane.show==false){
      for (int i=0;i<taxonomy.nodesList.size();i++) {

      if (((monsterNode)taxonomy.nodesList.get(i)).checkOn(xPos, yPos)){
  finalX=((monsterNode)taxonomy.nodesList.get(i)).centerX;
    finalY=((monsterNode)taxonomy.nodesList.get(i)).centerY;
    distanceX=finalX-xPos;
    distanceY=finalY-yPos;
    taxonomy.indexMoving=i;
  break;}}}
  
  //print("\nx "+finalX+" y "+finalY);
  }

  void mouseDragged_(float posx, float posy) {
    scrollMouseManager.knobDragged2(taxonomy.getMonsterPane().getPlot(), posx);
    if (taxonomyTab) {
      if (!this.taxonomy.singleMonsterPane.show) {
        taxonomy.dragNodes(posx, posy);
      }
      if (taxonomy.getMonsterPane().getPlot().isSelected()) {
        scrollMouseManager.knobDragged(taxonomy.getMonsterPane().getPlot(), posx);
      }
    }
  }

  void mouseReleased_(float xPos, float yPos) {
    if (this.taxonomy.singleMonsterPane.show) {
      if(this.taxonomy.singleMonsterPane.compareMonster1.checkOn(xPos, yPos)){
      this.taxonomy.singleMonsterPane.hide();
      monsterToSelect=1;}
      
      else if(this.taxonomy.singleMonsterPane.compareMonster2.checkOn(xPos, yPos)){
      this.taxonomy.singleMonsterPane.hide();
      monsterToSelect=2;}
      
      this.taxonomy.singleMonsterPane.checkHideButton(xPos, yPos);}
      
   if (taxonomy.indexMoving!=-1) {

     if(((abs((xPos+distanceX)-finalX)<=20/scaling || abs((yPos+distanceY)-finalY)<=20/scaling)  )&& 
     !this.taxonomy.singleMonsterPane.show && !this.taxonomy.singleMonsterPane.compareMonster1.checkOn(xPos, yPos) && !this.taxonomy.singleMonsterPane.compareMonster2.checkOn(xPos, yPos)){print("\nmosso"); 
    
     print(""+this.taxonomy.singleMonsterPane.show);
     if(monsterToSelect==1 && this.taxonomy.singleMonsterPane.show==false){
     taxonomy.singleMonsterPane.monster1=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving)).monsterName;
      taxonomy.singleMonsterPane.monster=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving));
     taxonomy.singleMonsterPane.setupMonster1();
   taxonomy.singleMonsterPane.show();
   this.taxonomy.singleMonsterPane.show=true;}

 
 if(monsterToSelect==2 && this.taxonomy.singleMonsterPane.show==false){
     taxonomy.singleMonsterPane.monster2=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving)).monsterName;
      taxonomy.singleMonsterPane.monster_2=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving));
     taxonomy.singleMonsterPane.setupMonster2();
   taxonomy.singleMonsterPane.show();
  this.taxonomy.singleMonsterPane.show=true;}
   
 }
    //print(""+((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving)).moving);
  
if(!this.taxonomy.singleMonsterPane.compareMonster1.checkOn(xPos, yPos)){
    taxonomy.selectNodes(xPos, yPos);}
    taxonomy.noMoving();
  }
  taxonomy.indexMoving=-1;
  scrollMouseManager.knobReleased(taxonomy.getMonsterPane().getPlot(), xPos);
  }

  monsterTaxonomy getTaxonomy() {
    return taxonomy;
  }
}

