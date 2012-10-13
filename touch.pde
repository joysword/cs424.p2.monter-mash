void touchDown(int ID, float xPos, float yPos, float xWidth, float yWidth) {

	if (xPos < LEFT_BAR_DEFAULT_WIDTH) {
		global_leftBarClick = true;
	}

	if (currentPage == FIRST_PAGE && ui.getFirstPage().getIsSelecting() == false && ui.getFirstPage().getDisplayMode() == YEAR_MODE) {

		if (xPos >= ui.getFirstPage().getRange().getLeftLock().getX()-RANGE_LOCK_W-10*scale && xPos <= ui.getFirstPage().getRange().getLeftLock().getX()+RANGE_LOCK_W+10*scale
	      && yPos >= ui.getFirstPage().getRange().getLeftLock().getY()-RANGE_LOCK_H-10*scale && yPos <= ui.getFirstPage().getRange().getLeftLock().getY()+RANGE_LOCK_H+10*scale)
	    {
	      global_isDragLeft = true;
	      //println(isDragLeft);
	    } 
	    else if (xPos >= ui.getFirstPage().getRange().getRightLock().getX()-RANGE_LOCK_W-10*scale && xPos <= ui.getFirstPage().getRange().getRightLock().getX()+RANGE_LOCK_W+10*scale
	      && yPos >= ui.getFirstPage().getRange().getRightLock().getY()-RANGE_LOCK_H-10*scale && yPos <= ui.getFirstPage().getRange().getRightLock().getY()+RANGE_LOCK_H+10*scale)
	    {
	      global_isDragRight = true;
	      println(global_isDragRight);
	      //println(isDragRight);
	    }
	}
}

void touchUp(int ID, float xPos, float yPos, float xWidth, float yWidth){

	global_isDragLeft = false;
	global_isDragRight = false;
  //
  ui.updateFirstPage(xPos, yPos);

  //
  //ui.updateMoviePage(xPos, yPos);

  //
  //ui.updateMOnsterPage(xPos, yPos);

  //
  if (global_leftBarClick) {
  	ui.updateLeftBar(xPos, yPos);
  }
  global_leftBarClick = false;
}

void touchMove(int ID, float xPos, float yPos, float xWidth, float yWidth){
	if (global_isDragLeft) {
    	ui.getFirstPage().updateRangeL(xPos);
    	//println("update");
    }
    if (global_isDragRight) {
    	ui.getFirstPage().updateRangeR(xPos);
    	//println("update");
  	}
}// touchMove

