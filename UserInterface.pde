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

  cc_DatabaseManager db;
  
  UserInterface() {
    
    monsterPage = new ys_MonsterPage();
    moviePage = new ys_MoviePage();
    firstPage = new ys_FirstPage(RIGHT_BAR_WIDTH);
    
    // customize position
    //helpWindow = new ys_HelpWindow(HELP_WINDOW_x, HELP_WINDOW_y, HELP_WINDOW_w, HELP_WINDOW_h, HELP_WINDOW_c);
    helpWindow = new ys_HelpWindow((Width - HELP_WINDOW_w)*0.5, (Height-HELP_WINDOW_h)*0.5, HELP_WINDOW_w, HELP_WINDOW_h, HELP_WINDOW_c);

    leftBar = new ys_LeftBar(LEFT_MENU_WIDTH, BTN_NUMBER, BTN_H, LEFT_BTN_NAME);

    db = new cc_DatabaseManager(applet);
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


    // below are always render last
    leftBar.render();
    helpWindow.render();
  }

  public void updateFirstPage(float posx, float posy) {
    if (currentPage == FIRST_PAGE) {
      firstPage.update(posx, posy);
    }
  }

  public void updateLeftBar(float posx, float posy) {
    leftBar.update(posx, posy);
  }

  public ys_HelpWindow getHelpWindow() {
    return helpWindow;
  }

  public ys_FirstPage getFirstPage() {
    return firstPage;
  }

  public ys_LeftBar getLeftBar() {
    return leftBar;
  }

  public cc_DatabaseManager getDB() {
    return db;
  }

}
