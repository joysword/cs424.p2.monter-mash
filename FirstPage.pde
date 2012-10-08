//
//
// need change
// currently it has random position values

class ys_FirstPage {

	private float uix;

	private ys_CheckItem[] filters;

	private boolean isSelecting0;
  private boolean isSelecting1;

	private ys_FirstPage(float _w) {

		uix = Width - _w;

		filters = new ys_CheckItem[HOW_MANY_FILTERS];
		for (int i=0;i<HOW_MANY_FILTERS;i++) {
			filters[i] = new ys_CheckItem(FILTER_X, FILTER_Y + FILTER_DIFF * i, CHECK_BOX_WIDTH, LABEL_WIDTH, CHECK_ITEM_HEIGHT, FILTER_TXT[i]);
		}

		isSelecting0 = false;
    isSelecting1 = false;

	}

	void render() {
		// render graph1
		//graph[0].render(0);
		//graph[1].render(1);

    renderUI();

    if (isSelecting0) {
      renderUI0();
    }
    else if (isSelecting1) {
      renderUI1();
    }
	}

	private void updateGraph(float posx, float posy) {
    if (posx >= uix && posy < Height * 0.5) {
		  // update graph[0] and graph[1]
    }
	}

	private void updateInterface(float posx, float posy) {
    if (posx >= uix && posy < Height * 0.5) {
      isSelecting0 = !isSelecting0;
      if (isSelecting0) {
        isSelecting1 = false;
      }
    }
    else if (posx >= uix && posy > Height * 0.5) {
      isSelecting1 = !isSelecting1;
      if (isSelecting1) {
        isSelecting0 = false;
      }
    }
	}

  private void renderUI() {
    pushStyle();
    noStroke();
    fill(#342C2C); /// change change change change change
    rectMode(CORNERS);
    rect(uix, 0, Width, Height);
    textAlign(LEFT);
    for (int i=0;i<HOW_MANY_FILTERS;i++) {
      fill(#01b2f1);
      text(FILTER_TXT[i],uix+25*scale, 20*scale + i * 35*scale);
      fill(#00611c);
      text(FILTER_TXT[i],uix+25*scale, Height * 0.5 + 20*scale + i * 35*scale);
    }
    strokeWeight(2*scale);
    stroke(#ff6600);
    line(uix,Height * 0.5, Width, Height* 0.5);
    popStyle();
  }

  private void renderUI0() {
    pushStyle();
    noStroke();
    fill(20);
    rectMode(CORNERS);
    rect(uix-500*scale, Height*0.4, uix, Height);
    textAlign(LEFT);
    fill(#01b2f1);
    text("Select Filters for Graph 1:", uix-500*scale+50*scale, 300*scale);
  }

  private void renderUI1() {
    pushStyle();
    noStroke();
    fill(20);
    rectMode(CORNERS);
    rect(uix-500*scale, Height*0.4, uix, Height);
    textAlign(LEFT);
    fill(#00611c);
    text("Select Filters for Graph 2:", uix-500*scale+50*scale, 300*scale);
  }

  void update(float posx, float posy) {
    updateGraph(posx, posy);
    updateInterface(posx, posy);
  }
}