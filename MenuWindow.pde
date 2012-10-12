class MenuWindow {

	float x, y;

  	float w; // width

  	float lineH;

  	float h;

	ys_Button[] popUpButton;

	boolean isDisplay;

	int num;

	MenuWindow(float _x, float _y, float _w, int n, float btn_h, String[] strs) {

		x = _x;
		y = _y;
		w = _w;
		lineH = btn_h;

		num = n;
		h = lineH * num;

		popUpButton = new ys_Button[num];

		for (int i=0;i<num;i++) {
			popUpButton[i] = new ys_Button(x, y + i * lineH, w, lineH, strs[i]);
		}

		isDisplay = false;
	}


	void render() {
		if (isDisplay) {
		    for (int i=0;i<num;i++) {
		        popUpButton[i].render();
		    }
		}
	}

	void update(float posx, float posy) {

	}

	void setPos(float _x, float _y, int type) {
		switch (type) {
			case UPPER_LEFT:
				x = _x;
				y = _y;
				break;
			case UPPER_RIGHT:
				x = _x - w;
				y = _y;
				break;
			case LOWER_LEFT:
				x = _x;
				y = _y - h;
				break;
			case LOWER_RIGHT:
				x = _x - w;
				y = _y - h;
				break;
		}
		println("("+x+", "+y+")");
		for (int i=0;i<num;i++) {
			popUpButton[i].setPos(x, y + i * lineH);
		}
	}

	void shutDown() {
		isDisplay = false;
	}

	void turnOn() {
		isDisplay = true;
	}

	boolean getIsDisplay() {
		return isDisplay;
	}

	boolean checkIn(float _x, float _y) {
		if (_x > x && _y > y && _x < x + w && _y < y + h)
			return true;
		return false;
	}
}