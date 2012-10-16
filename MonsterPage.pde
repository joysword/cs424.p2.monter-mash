float distanceX, distanceY;
int monsterToSelect=1;

class MonsterPage {
  boolean taxonomyTab;
  boolean movieTab;
  boolean showTop10;
float finalX, finalY;
  SingleMoviePane moviePane;
  Movie movie;
  Top10Pane top10Pane;

  monsterTaxonomy taxonomy;
  PApplet context;
  ScrollMouseManager scrollMouseManager;



  MonsterPage() {
    taxonomyTab = true;
    movieTab = false;
    showTop10 = false;

    context = applet;

    scrollMouseManager = new ScrollMouseManager();

    

    movie = new Movie("Tutti belli Meluelli", 2012, "horror", 60, "very good movie", "PG13", 3000);
    moviePane = new SingleMoviePane(width/2, height/2, width/6*4, height*0.95, movie);
    top10Pane = new Top10Pane(width/2, height/2, width/6*4, height*0.8);
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
    //taxonomyButton.draw();
    //movieButton.draw();
    //top10Button.draw();

    //if (taxonomyTab) {
      taxonomy.draw();
    //}
    /*else if (movieTab) {
      moviePane.draw();
    }*/
/*
    if (showTop10) {
      top10Pane.draw();
    }
    */
  }

  void mousePressed_(float xPos, float yPos) {
    print("\n moving: "+taxonomy.indexMoving);
    /*
    if (top10Button.checkOn(posx, posy)) {
      if (showTop10) {
        showTop10 = false;
      }
      else {
        showTop10 = true;
      }
      
    }
    */
    /*
    if (movieButton.checkOn(posx, posy)) {
      movieTab = true;
      taxonomyTab = false;
    }
    else if (taxonomyButton.checkOn(posx, posy)) {
      taxonomyTab = true;
      movieTab = false;
    }*/

   if (taxonomyTab) { 
      taxonomy.noMoving();
    if (this.taxonomy.singleMonsterPane.show) {
      this.taxonomy.singleMonsterPane.checkHideButton(xPos, yPos);
      if(this.taxonomy.singleMonsterPane.compareMonster1.checkOn(xPos, yPos)){
      this.taxonomy.singleMonsterPane.hide();
      monsterToSelect=1;}
      
      else if(this.taxonomy.singleMonsterPane.compareMonster2.checkOn(xPos, yPos)){
      this.taxonomy.singleMonsterPane.hide();
      monsterToSelect=2;}
      
    }
    scrollMouseManager.knobPressed(taxonomy.getMonsterPane().getPlot(), xPos, yPos);
  }

  else if (movieTab) {
    String a= moviePane.keyboard.checkPress(xPos, yPos);
    if (a=="backspace" ) {
      if(moviePane.suggestionBox.input.length()>0){
      moviePane.suggestionBox.input=moviePane.suggestionBox.input.substring(0, moviePane.suggestionBox.input.length()-1);}
    else{int j=1;}
  }

    else {
      if (a!="") {
        print("sonooooo\n");
        moviePane.suggestionBox.setInput(moviePane.suggestionBox.input+a);
      }
      if (moviePane.suggestionBox.input!="") {
        print("\n"+moviePane.suggestionBox.input);
        moviePane.suggestionBox.checkSuggestions();
      } 
      int check=moviePane.suggestionBox.checkOnSuggestion(xPos, yPos);
      if (check!=-1 && moviePane.suggestionBox.suggestions.size()>0) {
        moviePane.suggestionBox.inputTaken=(String)moviePane.suggestionBox.suggestions.get(check);
        print("\n"+check+moviePane.suggestionBox.inputTaken);
        moviePane.suggestionBox.input="";
        moviePane.suggestionBox.suggestions.clear();
      }
    
    }}
    
      for (int i=0;i<taxonomy.nodesList.size();i++) {

      if (((monsterNode)taxonomy.nodesList.get(i)).checkOn(xPos, yPos)){
  finalX=((monsterNode)taxonomy.nodesList.get(i)).centerX;
    finalY=((monsterNode)taxonomy.nodesList.get(i)).centerY;
    distanceX=finalX-xPos;
    distanceY=finalY-yPos;
    taxonomy.indexMoving=i;
  break;}}
  
  //print("\nx "+finalX+" y "+finalY);
  
   print("\n moving: "+taxonomy.indexMoving); 
  }

  void mouseDragged_(float posx, float posy) {
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
   if (taxonomy.indexMoving!=-1) {
         print("\naaa "+abs(xPos-finalX));

     if((abs(xPos-finalX)<taxonomy.nodeDiameterChild/2 || abs(yPos-finalY)<taxonomy.nodeDiameterChild/2)){print("\nmosso"); 
    
     if(monsterToSelect==1){
     taxonomy.singleMonsterPane.monster1=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving)).monsterName;
      taxonomy.singleMonsterPane.monster=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving));
     taxonomy.singleMonsterPane.setupMonster1();
   taxonomy.singleMonsterPane.show();}
 
 if(monsterToSelect==2){
     taxonomy.singleMonsterPane.monster2=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving)).monsterName;
      taxonomy.singleMonsterPane.monster_2=((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving));
     taxonomy.singleMonsterPane.setupMonster2();
   taxonomy.singleMonsterPane.show();}
   
 }
    //print(""+((monsterNode)taxonomy.nodesList.get(taxonomy.indexMoving)).moving);
  

    taxonomy.selectNodes(xPos, yPos);
    taxonomy.noMoving();
  }
  taxonomy.indexMoving=-1;
  scrollMouseManager.knobReleased(taxonomy.getMonsterPane().getPlot(), xPos);
  }

  monsterTaxonomy getTaxonomy() {
    return taxonomy;
  }
}

