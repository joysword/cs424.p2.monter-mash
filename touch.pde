void touchDown(int ID, float xPos, float yPos, float xWidth, float yWidth) {

	if (currentPage == FIRST_PAGE) {

		if (xPos >= ui.getFirstPage().getPlot().getRange().getLeftLock().getX()-RANGE_LOCK_W-10*scale && xPos <= ui.getFirstPage().getPlot().getRange().getLeftLock().getX()+RANGE_LOCK_W+10*scale
	      && yPos >= ui.getFirstPage().getPlot().getRange().getLeftLock().getY()-RANGE_LOCK_H-10*scale && yPos <= ui.getFirstPage().getPlot().getRange().getLeftLock().getY()+RANGE_LOCK_H+10*scale)
	    {
	      global_isDragLeft = true;
	      //println(isDragLeft);
	    } 
	    else if (xPos >= ui.getFirstPage().getPlot().getRange().getRightLock().getX()-RANGE_LOCK_W-10*scale && xPos <= ui.getFirstPage().getPlot().getRange().getRightLock().getX()+RANGE_LOCK_W+10*scale
	      && yPos >= ui.getFirstPage().getPlot().getRange().getRightLock().getY()-RANGE_LOCK_H-10*scale && yPos <= ui.getFirstPage().getPlot().getRange().getRightLock().getY()+RANGE_LOCK_H+10*scale)
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
  ui.updateLeftBar(xPos, yPos);
}

void touchMove(int ID, float xPos, float yPos, float xWidth, float yWidth){
	if (global_isDragLeft) {
    	ui.getFirstPage().getPlot().updateRangeL(xPos);
    	//println("update");
    }
    if (global_isDragRight) {
    	ui.getFirstPage().getPlot().updateRangeR(xPos);
    	//println("update");
  	}
}// touchMove

