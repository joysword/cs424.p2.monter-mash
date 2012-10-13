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

	private FirstPlot plot;

	private ys_DatabaseManager db;

	private MenuWindow popUp;

	private ys_Button yearBtn;

	private ys_Button tabularBtn;

	private ys_Button decadeBtn;

////////////////

	public ys_FirstPage(float _w) {

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

		popUp = new MenuWindow(0, 0, POP_UP_MENU_W, POP_UP_MENU_N, POP_UP_BUTTON_H, POP_UP_BUTTON_NAME);

		yearBtn = new ys_Button(YEAR_BUTTON_X, YEAR_BUTTON_Y, YEAR_BUTTON_W, YEAR_BUTTON_H,"Year");

		tabularBtn = new ys_Button(TABULAR_BUTTON_X, TABULAR_BUTTON_Y, TABULAR_BUTTON_W, TABULAR_BUTTON_H, "Tabular");

		decadeBtn = new ys_Button(DECADE_BUTTON_X, DECADE_BUTTON_Y, DECADE_BUTTON_W, DECADE_BUTTON_H, "Decade");
	}

	void render() {
		// render graph
		//graph[0].render(0);
		//graph[1].render(1);
		plot.render();

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
				if (plot.getDisplayMode() == YEAR_MODE) {
					int year_ = plot.getYear(posx, posy);
					if (year_!=-1) {
						int type = (posx<rightX*0.6)? ( (posy<Height*0.5)?UPPER_LEFT:LOWER_LEFT ):( (posy<Height*0.5)?UPPER_RIGHT:LOWER_RIGHT );
						popUp.setPos(posx, posy, type);
						popUp.turnOn(year_);
					}
				}
				else if (plot.getDisplayMode() == DECADE_MODE) {
					int year_ = plot.getDecade(posx, posy);
					if (year_!=-1) {
						int type = (posx<rightX*0.6)? ( (posy<Height*0.5)?UPPER_LEFT:LOWER_LEFT ):( (posy<Height*0.5)?UPPER_RIGHT:LOWER_RIGHT );
						popUp.setPos(posx, posy, type);
						popUp.turnOn(year_);
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
				filter[i].update(posx, posy, db);
				canSeeButton = false;
				break; // only 1 is under attack
			}
		}

		// buttons
		if (canSeeButton) {
			if (yearBtn.checkIn(posx, posy)) {
				plot.setDisplayMode(YEAR_MODE);
			}
			else if (decadeBtn.checkIn(posx, posy)) {
				plot.setDisplayMode(DECADE_MODE);
			}
			else if (tabularBtn.checkIn(posx, posy)) {
				plot.setDisplayMode(TABULAR_MODE);
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

	public FirstPlot getPlot() {
		return plot;
	}
}