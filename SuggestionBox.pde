public class SuggestionBox {
  private float centerX;
  private float centerY;
  private float widthB;
  private float heightB;
  private String input;
  private String inputTaken;
  private ArrayList<StringCountPair> movieTitles;
  private ArrayList<StringCountPair> suggestions;
  private cc_DatabaseManager db;


  boolean onSuggestion[]= {
    false, false, false
  };


  public SuggestionBox(float centerX, float centerY, float widthB, float heightB) {
    db=new cc_DatabaseManager(context);
    this.centerX=centerX;
    this.centerY=centerY;
    this.widthB=widthB;
    this.heightB=heightB;
    this.input="";
    this.inputTaken="";
    //this.movieTitles=db.getFilmList();
    this.suggestions=new ArrayList<StringCountPair>();
  }

  public void setInput(String input) {
    this.input=input;
  }
  public void draw() {
    fill(255);
    rectMode(CENTER);
    rect(this.centerX, this.centerY, this.widthB, this.heightB);
    textSize(this.heightB*0.8);
    textAlign(LEFT, CENTER);
    fill(0);

    text(this.input, this.centerX-this.widthB/2, this.centerY);
    //spostare solo a click mouse
    if (!this.suggestions.isEmpty() && input.length()!=0) { 
      print("\ninput: "+input);
      this.drawSuggestions();
    }
    //inutile farlo a ogni draw
  }

  public void checkSuggestions() {
    this.suggestions=getMatch(this.input);
  }

  public void drawSuggestions() {
    for (int i=0;i<3 && i<this.suggestions.size();i++) {
      rectMode(CENTER);
      fill(255);
      rect(this.centerX, this.centerY+this.heightB*(i+1), this.widthB, this.heightB);
      textSize(this.heightB*0.8);
      textAlign(LEFT, CENTER);
      fill(0);

      text(suggestions.get(i).getString(), this.centerX-this.widthB/2, this.centerY+this.heightB*(i+1));
    }
  }

  public int checkOnSuggestion(float myX, float myY) {

    for (int i=0;i<this.suggestions.size();i++) {
      if (myX>centerX-this.widthB && myX<centerX+this.widthB
        && myY>this.centerY-this.heightB/2+this.heightB*(i+1) && myY<this.centerY+this.heightB/2+this.heightB*(i+1)) {
        print("\n"+i);
        return i;
      }
    }
    return -1;
  }

  public ArrayList getMatch(String query) {
    String movie = null;
    query = query.toLowerCase();
    ArrayList matched=db.getFilmList(query);
    /*
    ArrayList matched = new ArrayList();
    for (int i=0; i<this.movieTitles.size(); i++) {
      movie = ((String)movieTitles.get(i).getString()).toLowerCase();
      if (movie.contains(query)) {
        matched.add((String)movieTitles.get(i).getString());
      }
    }*/
    return matched;
  }
}

