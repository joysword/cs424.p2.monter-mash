//
//
// This is main visualization page (timeline)
//

class ys_FirstPage {

  private float rightX, rightY1, rightY2; // right bar

  private float filterX, filterY, filterW, filterH; // filter panel

  private float btnx, btny, btnw, btnh; // filter button

  private boolean isSelecting[];

  private ys_FirstPageFilter[] filter;

  private FirstPlot plot1;
  private FirstPlot plot2;

  private MenuWindow popUp;

  private ys_Button yearBtn;
  private ys_Button tabularBtn;
  private ys_Button decadeBtn;

  private ys_Button yBtn;

  private ys_Button nextYearBtn;
  private ys_Button preYearBtn;
  private ys_Button nextDecadeBtn;
  private ys_Button preDecadeBtn;

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

    plot1 = new FirstPlot(PLOT_1_X1, PLOT_1_Y1, PLOT_1_X2, PLOT_1_Y2);

    plot2 = new FirstPlot(PLOT_2_X1, PLOT_2_Y1, PLOT_2_X2, PLOT_2_Y2);

    popUp = new MenuWindow(0, 0, POP_UP_MENU_W, POP_UP_MENU_N, POP_UP_BUTTON_H, POP_UP_BUTTON_NAME);

    yearBtn = new ys_Button(YEAR_BUTTON_X, YEAR_BUTTON_Y, YEAR_BUTTON_W, YEAR_BUTTON_H, "Year");
    tabularBtn = new ys_Button(TABULAR_BUTTON_X, TABULAR_BUTTON_Y, TABULAR_BUTTON_W, TABULAR_BUTTON_H, "Tabular");
    decadeBtn = new ys_Button(DECADE_BUTTON_X, DECADE_BUTTON_Y, DECADE_BUTTON_W, DECADE_BUTTON_H, "Decade");

    yBtn = new ys_Button(Y_BUTTON_X, Y_BUTTON_Y, Y_BUTTON_W, Y_BUTTON_H, "Y align");

    nextYearBtn = new ys_Button(NEXT_YEAR_BTN_X, NEXT_YEAR_BTN_Y, NEXT_YEAR_BTN_W, NEXT_YEAR_BTN_H, "Year +");
    preYearBtn = new ys_Button(PRE_YEAR_BTN_X, PRE_YEAR_BTN_Y, PRE_YEAR_BTN_W, PRE_YEAR_BTN_H, "Year -");
    nextDecadeBtn = new ys_Button(NEXT_DECADE_BTN_X, NEXT_DECADE_BTN_Y, NEXT_DECADE_BTN_W, NEXT_DECADE_BTN_H, "Decade +");
    preDecadeBtn = new ys_Button(PRE_DECADE_BTN_X, PRE_DECADE_BTN_Y, PRE_DECADE_BTN_W, PRE_DECADE_BTN_H, "Decade -");

    range = new ys_Range(RANGE_X, RANGE_Y, RANGE_W, RANGE_H, RANGE_LOCK_W, RANGE_LOCK_H);

    isDrag = false;

    displayMode = YEAR_MODE;
  }

  void render() {

    // render title
    renderTitle();

    // render graph
    plot1.render(0);
    plot2.render(1);

    // render range or paging buttons
    if (displayMode == YEAR_MODE) {
      range.render();
    }
    else if (displayMode == TABULAR_MODE) {
      nextYearBtn.render(false, 14);
      preYearBtn.render(false, 14);
      nextDecadeBtn.render(false, 14);
      preDecadeBtn.render(false, 14);
    }

    // render buttons
    yearBtn.render(false, 14);
    tabularBtn.render(false, 14);
    decadeBtn.render(false, 14);
    yBtn.render(false, 14);

    // render right bar
    renderRight();

    // render filter panel
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        filter[i].render(i);
        break;
      }
    }

    // render pop up menu
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
      updateInterface(posx, posy);
    }
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
            asdadsf
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
        println("filter 1: " + isSelecting[0] + "  filter 2: " + isSelecting[1]);
        break;
      }
    }

    boolean canSeeButton = true;
    // filter
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        canSeeButton = false;
        filter[i].update(posx, posy, ui.getDB(), i);
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
      else if (yBtn.checkIn(posx, posy)) {
        if (displayMode == YEAR_MODE) {
          plot1.switchSameY();
          plot2.switchSameY();
        }
      }
      else if (displayMode == TABULAR_MODE) {
        if (preDecadeBtn.checkIn(posx, posy)) {
          plot1.minusShowYearT(10);
          plot2.minusShowYearT(10);
        }
        else if (preYearBtn.checkIn(posx, posy)) {
          plot1.minusShowYearT(1);
          plot2.minusShowYearT(1);
        }
        else if (nextYearBtn.checkIn(posx, posy)) {
          plot1.plusShowYearT(1);
          plot2.plusShowYearT(1);
        }
        else if (nextDecadeBtn.checkIn(posx, posy)) {
          plot1.plusShowYearT(10);
          plot2.plusShowYearT(10);
        }
      }
    }
  }

  private void renderTitle() {
    pushStyle();
    noStroke();
    fill(TITLE_COLOR);
    textSize(TITLE_SIZE);
    textAlign(CENTER,CENTER);
    text("MELT METRIC MONSTER MASH MILLENNIUM", width*0.5, height*0.07);
  }
  private void renderRight() {
    pushStyle();
    noStroke();
    fill(POP_UP_COLOR);
    rectMode(CORNERS);
    rect(rightX, rightY1, Width, rightY2);
    textAlign(LEFT);
    textSize(14*scale);
    for (int i=0;i<HOW_MANY_FILTERS;i++) {
      //1
      fill(#01b2f1);
      text(filterTxt1[i], rightX+25*scale, rightY1 + 20*scale + i * height*0.15);

      //2
      fill(#29C567);
      text(filterTxt2[i], rightX+25*scale, (rightY1+rightY2) * 0.5 + 20*scale + i * height*0.15);
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

  public boolean getIsSelecting_1() {
    return isSelecting[0];
  }

  public boolean getIsSelecting_2() {
    return isSelecting[1];
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

  public ys_FirstPageFilter getFilter(int i) {
    return filter[i];
  }

  public void setNotSelecting() {
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      isSelecting[i] = false;
    }
  }
}

