//
//
// need change
// currently it has random position values

class ys_FirstPage {

  private float rightX, rightY1, rightY2;

  private float filterX, filterY, filterW, filterH;

  private float btnx, btny, btnw, btnh;

  private boolean isSelecting[];

  private ys_FirstPageFilter[] filter;

  private FirstPlot plot1;

  private FirstPlot plot2;

  //private cc_DatabaseManager db;

  private MenuWindow popUp;

  private ys_Button yearBtn;

  private ys_Button tabularBtn;

  private ys_Button decadeBtn;

  private ys_Range range;

  private boolean isDrag;

  private int displayMode;

  ////////////////

  public ys_FirstPage(float _w, float _y1, float _y2) {

    rightX = Width - _w;
    rightY1 = _y1;
    rightY2 = _y2;

    filterX = rightX - FIRST_PAGE_FILTER_W - 5*scale;
    filterY = FIRST_PAGE_FILTER_Y;
    filterW = FIRST_PAGE_FILTER_W;
    filterH = FIRST_PAGE_FILTER_H;

    btnx = filterX+filterW*FPF_BTN_X_RELATIVE;
    btny = filterY+filterH*FPF_BTN_Y_RELATIVE;
    btnw = FPF_BTN_W;
    btnh = FPF_BTN_H;

    filter = new ys_FirstPageFilter[HOW_MANY_GRAPH];
    isSelecting = new boolean[HOW_MANY_GRAPH];
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      isSelecting[i] = false;
      filter[i] = new ys_FirstPageFilter(filterX, filterY, filterW, filterH, btnx, btny, btnw, btnh);
    }

    //db = new cc_DatabaseManager(applet);

    //db = ui.getDB(); //change

    plot1 = new FirstPlot(PLOT_1_X1, PLOT_1_Y1, PLOT_1_X2, PLOT_1_Y2, 1);

    plot2 = new FirstPlot(PLOT_2_X1, PLOT_2_Y1, PLOT_2_X2, PLOT_2_Y2, 2);

    popUp = new MenuWindow(0, 0, POP_UP_MENU_W, POP_UP_MENU_N, POP_UP_BUTTON_H, POP_UP_BUTTON_NAME);

    yearBtn = new ys_Button(YEAR_BUTTON_X, YEAR_BUTTON_Y, YEAR_BUTTON_W, YEAR_BUTTON_H, "Year");

    tabularBtn = new ys_Button(TABULAR_BUTTON_X, TABULAR_BUTTON_Y, TABULAR_BUTTON_W, TABULAR_BUTTON_H, "Tabular");

    decadeBtn = new ys_Button(DECADE_BUTTON_X, DECADE_BUTTON_Y, DECADE_BUTTON_W, DECADE_BUTTON_H, "Decade");

    range = new ys_Range(RANGE_X, RANGE_Y, RANGE_W, RANGE_H, RANGE_LOCK_W, RANGE_LOCK_H);

    isDrag = false;

    displayMode = YEAR_MODE;
  }

  void render() {
    // render graph
    plot1.render();
    plot2.render();
    range.render();

    // render buttons
    yearBtn.render();
    tabularBtn.render();
    decadeBtn.render();
    // render right bar
    renderRight();

    // render filter panel
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        filter[i].render(i);
        break;
      }
    }
    popUp.render();
  }

  void update(float posx, float posy) {
    if (ui.getLeftBar().getIsDisplay() == false) {
      boolean selecting = false;
      for (int i=0;i<HOW_MANY_GRAPH;i++)
      {
        if (isSelecting[i]) {
          selecting = true;
          break;
        }
      }
      if (!selecting) {
        updateGraph(posx, posy);
      }
    }
    updateInterface(posx, posy);
  }

  private void updateGraph(float posx, float posy) {
    // if window is on -> turn if off
    if (popUp.getIsDisplayWindow() == true) {
      popUp.closeWindow();
    }
    // if window is not on
    else {
      // if menu is not on -> if not Tabular mode, turn menu on
      if (popUp.getIsDisplayMenu() == false) {
        // year mode
        if (displayMode == YEAR_MODE) {
          int year_ = plot1.getYear(posx, posy);
          if (year_!=-1) {
            int type = (posx<rightX*0.6)? ( (posy<Height*0.5)?UPPER_LEFT:LOWER_LEFT ):
            ( (posy<Height*0.5)?UPPER_RIGHT:LOWER_RIGHT );
            popUp.setPos(posx, posy, type);
            popUp.getButton().setName(year_); // change name by year
            popUp.turnOn(year_, 1);
          }
          else {
            year_ = plot2.getYear(posx, posy);
            if (year_!=-1) {
              int type = (posx<rightX*0.6)? ( (posy<Height*0.5)?UPPER_LEFT:LOWER_LEFT ):
              ( (posy<Height*0.5)?UPPER_RIGHT:LOWER_RIGHT );
              popUp.setPos(posx, posy, type);
              popUp.getButton().setName(year_); // change name by year
              popUp.turnOn(year_, 2);
            }
          }
        }
        
        else if (displayMode == DECADE_MODE) {
          int year_ = plot1.getDecade(posx, posy);
          if (year_!=-1) {
            int type = (posx<rightX*0.6)? ( (posy<Height*0.5)?UPPER_LEFT:LOWER_LEFT ):
            ( (posy<Height*0.5)?UPPER_RIGHT:LOWER_RIGHT );
            popUp.setPos(posx, posy, type);
            popUp.getButton().setName(year_); // change name by year
            popUp.turnOn(year_, 1);
          }
          else {
            year_ = plot2.getDecade(posx, posy);
            if (year_!=-1) {
              int type = (posx<rightX*0.6)? ( (posy<Height*0.5)?UPPER_LEFT:LOWER_LEFT ):
              ( (posy<Height*0.5)?UPPER_RIGHT:LOWER_RIGHT );
              popUp.setPos(posx, posy, type);
              popUp.getButton().setName(year_); // change name by year
              popUp.turnOn(year_, 2);
            }
          }
        }
      }
      // if menu is on
      else
      {
        // click inside -> open window and close menu
        if (popUp.checkIn(posx, posy)) {
          popUp.showWindow(posy);
        }
        popUp.shutDown();
      }
    }
  }

  private void updateInterface(float posx, float posy) {
    float eachHeight = Height / (HOW_MANY_GRAPH+0.0);

    // right bar
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (posx >= rightX && posy > eachHeight * i && posy < eachHeight * (i+1)) {
        isSelecting[i] = !isSelecting[i];
        if (isSelecting[i]) {
          for (int j=0;j<HOW_MANY_GRAPH;j++) {
            if (j != i) isSelecting[j] = false;
          }
        }
        break;
      }
    }

    boolean canSeeButton = true;
    // filter
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        filter[i].update(posx, posy, ui.getDB());
        canSeeButton = false;
        break; // only 1 is under attack
      }
    }

    // buttons
    if (canSeeButton) {
      if (yearBtn.checkIn(posx, posy)) {
        displayMode = YEAR_MODE;
      }
      else if (decadeBtn.checkIn(posx, posy)) {
        displayMode = DECADE_MODE;
        range.resume();
      }
      else if (tabularBtn.checkIn(posx, posy)) {
        displayMode = TABULAR_MODE;
        range.resume();
      }
    }
  }

  private void renderRight() {
    pushStyle();
    noStroke();
    fill(POP_UP_COLOR);
    rectMode(CORNERS);
    rect(rightX, rightY1, Width, rightY2);
    textAlign(LEFT);
    for (int i=0;i<HOW_MANY_FILTERS;i++) {
      fill(#01b2f1);
      text(FILTER_TXT[i], rightX+25*scale, rightY1 + 20*scale + i * 35*scale);
      fill(#29C567);
      text(FILTER_TXT[i], rightX+25*scale, (rightY1+rightY2) * 0.5 + 20*scale + i * 35*scale);
    }
    strokeWeight(BOARD_WEIGHT);
    stroke(BUTTON_COLOR);
    line(rightX, (rightY1+rightY2)*0.5, Width, (rightY1+rightY2)*0.5);
    line(rightX, rightY1, rightX, rightY2);
    popStyle();
  }

  public FirstPlot getPlot(int which) {
    if (which == 1) return plot1;
    return plot2;
  }

  public boolean getIsSelecting() {
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        return true;
      }
    }
    return false;
  }

  public ys_Range getRange() {
    return range;
  }

  public void updateRangeL(float _x) {
    range.update(_x, 0);
  }

  public void updateRangeR(float _x) {
    range.update(_x, 1);
  }

  public int getDisplayMode() {
    return displayMode;
  }
}
