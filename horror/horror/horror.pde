int scaling=7;

boolean taxonomyTab=true;
boolean movieTab=false;
boolean showTop10=false;

SingleMoviePane moviePane;
Movie movie;
Top10Pane top10Pane;

monsterTaxonomy taxonomy;
PApplet context = this;
ScrollMouseManager scrollMouseManager;
ImageButton movieButton;
ImageButton taxonomyButton;
ImageButton top10Button;


void setup() {
  size(8160/scaling, 2304/scaling);
  scrollMouseManager=new ScrollMouseManager();

  movieButton=new ImageButton(loadShape("movieButton.svg"), width/12, height/2, width/6, height/6);
taxonomyButton=new ImageButton(loadShape("taxonomyButton.svg"), width/12, height/3, width/6, height/6);
top10Button=new ImageButton(loadShape("showTop10.svg"), width/12, height/12, width/6, height/6);

  movie =new Movie("Tutti belli Malucelli", 2012, "horror", 60, "very good movie", "PG13", 3000);
  moviePane= new SingleMoviePane(width/2, height/2, width/6*4, height*0.95, movie);
top10Pane= new Top10Pane(width/2,height/2,width/6*4,height*0.8);
  taxonomy=new monsterTaxonomy(width/2, height/2, width/6*4, height*0.95, color(255));
  taxonomy.setup();
}

void draw() {
  background(0);


  //linee per aiutarsi

  stroke(255, 0, 0);
  strokeWeight(1);
  line(0, height/3, width, height/3);
  line(0, 2*height/3, width, 2*height/3);

  for (int i=1;i<6;i++) {
    line(i*width/6, 0, i*width/6, height);
  } 

taxonomyButton.draw();
  movieButton.draw();
  top10Button.draw();
  
  if (taxonomyTab) {
    taxonomy.draw();
  }
  else if(movieTab){
    moviePane.draw();
  }
  
  if(showTop10){top10Pane.draw();}
  
}

void mousePressed() {

  if(top10Button.checkOn(mouseX, mouseY)){
  if(showTop10){showTop10=false;}
  else{showTop10=true;}
}
  
  if (movieButton.checkOn(mouseX, mouseY)) {
    movieTab=true;
    taxonomyTab=false;
  }
  else if(taxonomyButton.checkOn(mouseX, mouseY)){
      taxonomyTab=true;
    movieTab=false;
     }
 

  if (taxonomyTab) { 
    if (this.taxonomy.singleMonsterPane.show) {
      this.taxonomy.singleMonsterPane.checkHideButton(mouseX, mouseY);
    }
    scrollMouseManager.knobPressed(taxonomy.getMonsterPane().getPlot(), mouseX, mouseY);
  }

  else if (movieTab) {
    String a= moviePane.keyboard.checkPress(mouseX,mouseY);
if(a=="backspace" && moviePane.suggestionBox.input.length()>0){moviePane.suggestionBox.input=moviePane.suggestionBox.input.substring(0, moviePane.suggestionBox.input.length()-1);}

else{
    if (a!="") {
      print("sonooooo\n");
      moviePane.suggestionBox.setInput(moviePane.suggestionBox.input+a);
    }
    if (moviePane.suggestionBox.input!="") {
      print("\n"+moviePane.suggestionBox.input);
      moviePane.suggestionBox.checkSuggestions();
    } 
    int check=moviePane.suggestionBox.checkOnSuggestion(mouseX, mouseY);
    if (check!=-1 && moviePane.suggestionBox.suggestions.size()>0) {
      moviePane.suggestionBox.inputTaken=(String)moviePane.suggestionBox.suggestions.get(check);
      print("\n"+check+moviePane.suggestionBox.inputTaken);
      moviePane.suggestionBox.input="";
      moviePane.suggestionBox.suggestions.clear();
    }
  }}
}

void mouseDragged() {
   if (taxonomyTab) { 
  if (!this.taxonomy.singleMonsterPane.show) { 
    taxonomy.dragNodes(mouseX, mouseY);
  }
  if (taxonomy.getMonsterPane().getPlot().isSelected()) {
    scrollMouseManager.knobDragged(taxonomy.getMonsterPane().getPlot(), mouseX);
  }
   }
   
   
}

void mouseReleased() {
  //if(!this.taxonomy.singleMonsterPane.show){
  if (!this.taxonomy.singleMonsterPane.show) { 
    taxonomy.selectNodes(mouseX, mouseY);
    taxonomy.noMoving();
  }
  taxonomy.indexMoving=-1;
  scrollMouseManager.knobReleased(taxonomy.getMonsterPane().getPlot(), mouseX);
}


//}

