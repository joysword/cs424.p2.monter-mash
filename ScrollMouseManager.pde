public class ScrollMouseManager {
  float minValue;
  float maxValue;
  public ScrollMouseManager() {
  }

  public void knobPressed(cc_MonsterPlot plot, float posX, float posY) {
    minValue=mouseX-plot.getActualKnobXLeft();
    maxValue=mouseX-plot.getActualKnobXRight();
    if (plot.inKnobLeftMouse(posX, posY)) {
      plot.setKnobLeftSelected(true, posX);
    }
    else if (plot.inKnobRightMouse(posX, posY)) {
      plot.setKnobRightSelected(true, posX);
    }
    else if (plot.isRectSelected(posX, posY)) {
      plot.setRectSelected(true);
    }
  }

  public void knobReleased(cc_MonsterPlot plot, float posX) {
    plot.setKnobLeftSelected(false, posX);
    plot.setKnobRightSelected(false, posX);
    plot.setRectSelected(false);
  }

  public void knobDragged(cc_MonsterPlot plot, float xPos) {
    plot.setRefX(minValue, maxValue, xPos);
    plot.setPositions(xPos);
  }
} 


