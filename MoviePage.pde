public class MoviePage {

  SingleMoviePane moviePane;
  Movie movie;

  monsterTaxonomy taxonomy;
  PApplet context;
  ScrollMouseManager scrollMouseManager;
  

  MoviePage() {

    context = applet;
    //movie = moviePane.suggestionBox.suggestions.get(0);
    scrollMouseManager = new ScrollMouseManager();

    moviePane = new SingleMoviePane(width*0.5, height*0.57, width*0.5, height*0.79, movie);
  }

  void render() {

    pushStyle();

    fill(TITLE_COLOR);
    textSize(TITLE_SIZE);
    textAlign(CENTER,CENTER);
    text("MONARCHY MOMENT MONSTER MASH MEMORY", width*0.5, height*0.07);

    popStyle();
    moviePane.draw();
  }


  void mousePressed_(float posx, float posy) {
      String a = moviePane.keyboard.checkPress(posx, posy);
      if (a == "backspace" && moviePane.suggestionBox.input.length()>0) {
        moviePane.suggestionBox.input = moviePane.suggestionBox.input.substring(0, moviePane.suggestionBox.input.length()-1);
      }
      else {
        if (a!="") {
          print("sonooooo\n");
          moviePane.suggestionBox.setInput(moviePane.suggestionBox.input+a);
        }
        if (moviePane.suggestionBox.input!="") {
          print("\n" + moviePane.suggestionBox.input);
          moviePane.suggestionBox.checkSuggestions();
        }
        int check = moviePane.suggestionBox.checkOnSuggestion(posx, posy);
        if (check!=-1 && moviePane.suggestionBox.suggestions.size() > 0) {
          moviePane.suggestionBox.inputTaken = moviePane.suggestionBox.suggestions.get(check).getTitle();
          print("\n" + check + moviePane.suggestionBox.inputTaken);
          moviePane.suggestionBox.input = "";
          moviePane.suggestionBox.suggestions.clear();
        }
      }
  }

  void mouseDragged_(float posx, float posy) {
  }

  void mouseReleased_(float posx, float posy) {
  }

  monsterTaxonomy getTaxonomy() {
    return taxonomy;
  }
}

