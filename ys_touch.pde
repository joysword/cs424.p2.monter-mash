
void touchDown(int ID, float xPos, float yPos, float xWidth, float yWidth) {

  if (currentPage == FIRST_PAGE) {
    if (ui.getFirstPage().getIsSelecting() == false && ui.getFirstPage().getDisplayMode() == YEAR_MODE) {

      if (yPos <= ui.getFirstPage().getRange().getY_High() + 4*scale && yPos >= ui.getFirstPage().getRange().getY_Low() - 4*scale ) {
        if (xPos >= ui.getFirstPage().getRange().getX_L() && xPos <= ui.getFirstPage().getRange().getX_R()) {
          if (isLeftLockCloser(xPos) == true) {
            global_isDragLeft = true;
          }
          else global_isDragRight = true;
        }
      }
    }
  }
  else if (currentPage == MONSTER_PAGE) {
    ui.getMonsterPage().mousePressed_(xPos, yPos);
  }
  else if (currentPage == MOVIE_PAGE) {
    ui.getMoviePage().mousePressed_(xPos, yPos);
  }
}

void touchUp(int ID, float xPos, float yPos, float xWidth, float yWidth) {

  global_isDragLeft = false;
  global_isDragRight = false;

  ui.updateLeftBar(xPos, yPos);
  //
  if (currentPage == FIRST_PAGE) {
    ui.updateFirstPage(xPos, yPos);
  }
  else if (currentPage == MONSTER_PAGE) {
    ui.getMonsterPage().mouseReleased_(xPos, yPos);
  }
  else if (currentPage == MOVIE_PAGE) {
    ui.getMoviePage().mouseReleased_(xPos, yPos);
  }
}

void touchMove(int ID, float xPos, float yPos, float xWidth, float yWidth) {

  if (currentPage == FIRST_PAGE) {
    if (global_isDragLeft) {
      ui.getFirstPage().updateRangeL(xPos);
      //println("update");
    }
    if (global_isDragRight) {
      ui.getFirstPage().updateRangeR(xPos);
      //println("update");
    }
  }
  if (currentPage == MONSTER_PAGE) {
    ui.getMonsterPage().mouseDragged_(xPos, yPos);
  }
  else if (currentPage == MOVIE_PAGE) {
    ui.getMoviePage().mouseDragged_(xPos, yPos);
  }
}// touchMove

boolean isLeftLockCloser(float x) {
  float l = x - ui.getFirstPage().getRange().getLeftLock().getX();
  float r = x - ui.getFirstPage().getRange().getRightLock().getX();
  if (l<0) l = -l;
  if (r<0) r = -r;
  return (l<r)? true:false;
}

