//
//
// need change
// currently it has random position values

class ys_FirstPage {

	private float rightX;

	private float filterX, filterY, filterW, filterH;

	private float btnx, btny, btnw, btnh;

	private ys_CheckItem[] filters;

	private boolean isSelecting[];

  private ys_FirstPageFilter[] filter;

  ys_DatabaseManager db;

	ys_FirstPage(float _w) {

		rightX = Width - _w;

		filterX = rightX - FIRST_PAGE_FILTER_W;
		filterY = FIRST_PAGE_FILTER_Y;
		filterW = FIRST_PAGE_FILTER_W;
		filterH = FIRST_PAGE_FILTER_H;

		btnx = filterX+filterW*FPF_BTN_X_RELATIVE;
		btny = filterY+filterH*FPF_BTN_Y_RELATIVE;
		btnw = FPF_BTN_W;
		btnh = FPF_BTN_W;

		filters = new ys_CheckItem[HOW_MANY_FILTERS];
		for (int i=0;i<HOW_MANY_FILTERS;i++) {
			filters[i] = new ys_CheckItem(FILTER_X, FILTER_Y + FILTER_DIFF * i, CHECK_BOX_WIDTH, LABEL_WIDTH, CHECK_ITEM_HEIGHT, FILTER_TXT[i]);
		}

    isSelecting = new boolean[HOW_MANY_GRAPH];
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
		  isSelecting[i] = false;
    }

    db = new ys_DatabaseManager(applet); //change

    filter = new ys_FirstPageFilter[HOW_MANY_GRAPH];
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      filter[i] = new ys_FirstPageFilter(filterX, filterY, filterW, filterH, btnx, btny, btnw, btnh);
    }

	}

	void render() {
		// render graph1
		//graph[0].render(0);
		//graph[1].render(1);

    renderRight();

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
      }

      // only one can be chosen
      if (isSelecting[i]) {
        for (int j=0;j<HOW_MANY_GRAPH;j++) {
          if (j != i) isSelecting[j] = false;
        }
      }
    }
    for (int i=0;i<HOW_MANY_GRAPH;i++) {
      if (isSelecting[i]) {
        filter[i].update(posx, posy);
      }
    }
	}

  private void renderRight() {
    pushStyle();
    noStroke();
    fill(#342C2C); /// change change change change change
    rectMode(CORNERS);
    rect(rightX, 0, Width, Height);
    textAlign(LEFT);
    for (int i=0;i<HOW_MANY_FILTERS;i++) {
      fill(#01b2f1);
      text(FILTER_TXT[i],rightX+25*scale, 20*scale + i * 35*scale);
      fill(#00611c);
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