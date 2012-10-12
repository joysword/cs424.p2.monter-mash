//
//
// need change
// currently it has random position values

class ys_FirstPage {

	private float rightX;

	private float filterX, filterY, filterW, filterH;

	private float btnx, btny, btnw, btnh;

	private boolean isSelecting[];

  private ys_FirstPageFilter[] filter;

  FirstPlot plot;

  ys_DatabaseManager db;

  MenuWindow popUp;

	ys_FirstPage(float _w) {

		rightX = Width - _w;

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

    db = new ys_DatabaseManager(applet); //change

    plot = new FirstPlot();
	}

	void render() {
		// render graph
		//graph[0].render(0);
		//graph[1].render(1);
    plot.render();

    // render right bar
    renderRight();

    // render filter panel
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        renderFilter(i);
        break;
      }
    }
	}

  void update(float posx, float posy) {
    updateGraph(posx, posy);
    updateInterface(posx, posy);
  }

	private void updateGraph(float posx, float posy) {
    if (posx >= rightX && posy < Height * 0.5) {
		  // pop up window when click certain year
    }
	}

	private void updateInterface(float posx, float posy) {
    float eachHeight = Height / (HOW_MANY_GRAPH+0.0);
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
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        filter[i].update(posx, posy, db);
        break; // only 1 is under attack
      }
    }
	}

  private void renderRight() {
    pushStyle();
    noStroke();
    fill(#342C2C); //change change change change change
    rectMode(CORNERS);
    rect(rightX, 0, Width, Height);
    textAlign(LEFT);
    for (int i=0;i<HOW_MANY_FILTERS;i++) {
      fill(#01b2f1);
      text(FILTER_TXT[i],rightX+25*scale, 20*scale + i * 35*scale);
      fill(#29C567);
      text(FILTER_TXT[i],rightX+25*scale, Height * 0.5 + 20*scale + i * 35*scale);
    }
    strokeWeight(2*scale);
    stroke(#ff6600);
    line(rightX,Height * 0.5, Width, Height* 0.5);
    popStyle();
  }

  private void renderFilter(int i) {
    filter[i].render(i);
  }
}