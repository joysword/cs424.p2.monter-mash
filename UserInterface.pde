//
//
// This class contains everything relevant to user interface and interaction
// It is constructed at the start of the program (in setup())

class UserInterface() {
  
  // define every elements of user interface
  ys_MonsterPage monsterPage;
  ys_MoviePage moviePage;
  ys_HelpWindow helpWindow;
  
  UserInterface() {
    
    monsterPage = new ys_MonsterPage();
    moviePage = new ys_MoviePage();
    helpWindow = new ys_HelpWindow();
  }
  
  
  void render() {
    
    // render everything here

  }
}
