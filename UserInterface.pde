//
//
// This class contains everything relevant to user interface and interaction
// It is constructed at the start of the program (in setup())

class UserInterface {
  
  // define every elements of user interface
  ys_MonsterPage monsterPage;
  ys_MoviePage moviePage;
  ys_HelpWindow helpWindow;
  ys_FirstPage firstPage;

  ys_LeftBar leftBar;
  
  UserInterface() {
    
    monsterPage = new ys_MonsterPage();
    moviePage = new ys_MoviePage();
    firstPage = new ys_FirstPage(RIGHT_BAR_WIDTH);
    helpWindow = new ys_HelpWindow(HELP_WINDOW_x, HELP_WINDOW_y, HELP_WINDOW_w, HELP_WINDOW_h, HELP_WINDOW_c, HELP_BTN_x, HELP_BTN_y, HELP_BTN_w, HELP_BTN_h);

    leftBar = new ys_LeftBar(LEFT_MENU_WIDTH, BTN_NUMBER, BTN_H, LEFT_BTN_NAME);
  }
  
  
  void render() {
    
    // render everything here
    switch (currentPage){
      case (FIRST_PAGE):
        firstPage.render();
        break;
      case (MOVIE_PAGE):
        moviePage.render();
        break;

      case (MONSTER_PAGE):
        monsterPage.render();
        break;
    }


    // always render Left Bar last
    leftBar.render();
  }
  
  public void updateHelpWindow(float posx, float posy) {
    helpWindow.update(posx, posy);
  }

  public void updateFirstPage(float posx, float posy) {
    if (currentPage == FIRST_PAGE) {
      firstPage.update(posx, posy);
    }
  }

  public void updateLeftBar(float posx) {
    leftBar.update(posx);
  }

}
