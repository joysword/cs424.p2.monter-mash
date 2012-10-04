void touchDown(int ID, float xPos, float yPos, float xWidth, float yWidth) { 
}

void touchUp(int ID, float xPos, float yPos, float xWidth, float yWidth){
  noFill();
  stroke(255,0,0);
  ellipse( xPos, yPos, xWidth * 2, yWidth * 2 );

  //
  ui.updateHelpWindow(xPos, yPos);
}

void touchMove(int ID, float xPos, float yPos, float xWidth, float yWidth){
}// touchMove

