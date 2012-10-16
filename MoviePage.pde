class MoviePage {
  boolean taxonomyTab;
  boolean movieTab;
  boolean showTop10;

  SingleMoviePane moviePane;
  Movie movie;
  Top10Pane top10Pane;

  monsterTaxonomy taxonomy;
  PApplet context;
  ScrollMouseManager scrollMouseManager;
  


  MoviePage() {
    taxonomyTab = false;
    movieTab = true;
    showTop10 = false;

    context = applet;

    scrollMouseManager = new ScrollMouseManager();

    

    movie = new Movie("Tutti belli Meluelli", 2012, "horror", 60, "very good movie", "PG13", 3000);
    moviePane = new SingleMoviePane(width/2, height/2, width/6*4, height*0.95, movie);
    top10Pane = new Top10Pane(width/2, height/2, width/6*4, height*0.8);
    taxonomy = new monsterTaxonomy(width/2, height/2, width/6*4, height*0.95, color(255));
    taxonomy.setup();
  }

  void render() {
   

    if (taxonomyTab) {
      taxonomy.draw();
    }
    else if (movieTab) {
      moviePane.draw();
    }

    if (showTop10) {
      top10Pane.draw();
    }
  }

  void mousePressed_(float posx, float posy) {
    /*if (top10Button.checkOn(posx, posy)) {
      if (showTop10) {
        showTop10 = false;
      }
      else {
        showTop10 = true;
      }
    }

    if (movieButton.checkOn(posx, posy)) {
      movieTab = true;
      taxonomyTab = false;
    }
    else if (taxonomyButton.checkOn(posx, posy)) {
      taxonomyTab = true;
      movieTab = false;
    }
*/
    if (taxonomyTab) {
      if (taxonomy.singleMonsterPane.show) {
        taxonomy.singleMonsterPane.checkHideButton(posx, posy);
      }
      scrollMouseManager.knobPressed(taxonomy.getMonsterPane().getPlot(), posx, posy);
    }
    else if (movieTab) {
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
          moviePane.suggestionBox.inputTaken = moviePane.suggestionBox.suggestions.get(check).getString();
          print("\n" + check + moviePane.suggestionBox.inputTaken);
          moviePane.suggestionBox.input = "";
          moviePane.suggestionBox.suggestions.clear();
        }
      }
    }
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

  void mouseReleased_(float posx, float posy) {
    if (!this.taxonomy.singleMonsterPane.show) {
      taxonomy.selectNodes(posx, posy);
      taxonomy.noMoving();
    }
    taxonomy.indexMoving = -1;
    scrollMouseManager.knobReleased(taxonomy.getMonsterPane().getPlot(), posx);
  }

  monsterTaxonomy getTaxonomy() {
    return taxonomy;
  }
}

