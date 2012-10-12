//
//
// render() need change
// currently it has random value


class ys_LeftBar {

	boolean isDisplay;

	ys_LeftMenu menu;

	ys_LeftBar(float _w, int n, float btn_h, String[] strs) {

		isDisplay = false;

		menu = new ys_LeftMenu(_w, n, btn_h, strs);
	}

	void render() {
		if (isDisplay == false) {
			pushStyle();

			fill(80);
			noStroke();
			rectMode(CORNER);
			rect(0, 0, LEFT_BAR_DEFAULT_WIDTH, Height);
			stroke(150);
			line(5*scale, Height * 0.5 - LEFT_BAR_DEFAULT_WIDTH+10*scale, LEFT_BAR_DEFAULT_WIDTH - 5*scale, Height * 0.5);
			line(5*scale, Height * 0.5 + LEFT_BAR_DEFAULT_WIDTH-10*scale, LEFT_BAR_DEFAULT_WIDTH - 5*scale, Height * 0.5);

			popStyle();
		}
		else {
			pushStyle();

			fill(80);
			noStroke();
			rectMode(CORNER);
			rect(0, 0, LEFT_BAR_DEFAULT_WIDTH, Height);
			stroke(150);
			line(5*scale, Height * 0.5, LEFT_BAR_DEFAULT_WIDTH - 5*scale, Height * 0.5 - LEFT_BAR_DEFAULT_WIDTH+10*scale);
			line(5*scale, Height * 0.5, LEFT_BAR_DEFAULT_WIDTH - 5*scale, Height * 0.5 + LEFT_BAR_DEFAULT_WIDTH-10*scale);

			stroke(200);
			line(LEFT_BAR_DEFAULT_WIDTH,0, LEFT_BAR_DEFAULT_WIDTH,Height);

			menu.render();

			popStyle();
		}

	}

	void update(float posx, float posy) {
		if (posx < LEFT_BAR_DEFAULT_WIDTH) {
			switchDisplay();
			if (!isDisplay) {
				ui.getHelpWindow().setNotDisplay();
			}
		}
		if (isDisplay) {
			menu.update(posx, posy);
		}
	}

	private void switchDisplay() {
		isDisplay = !isDisplay;
	}

	public boolean getIsDisplay() {
		return isDisplay;
	}
}