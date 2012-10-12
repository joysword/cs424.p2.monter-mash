class Top10Window {
	float x, y;
	float w, h;

	Top10Window(float _x, float _y, float _w, float _h) {
		x = _x;
		y = _y;
		w = _w;
		h = _h;
	}

	void render(int yearX) {
		pushStyle();

		fill(POP_UP_WINDOW_BG_COLOR);
		strokeWeight(BOARD_WEIGHT);
		stroke(WINDOW_BOARD_COLOR);
		rectMode(CORNER);
		rect(x,y,w,h);
		fill(POP_UP_WINDOW_TEXT_COLOR);
		textAlign(LEFT, CENTER);
		textSize(14*scale);
		int yearr = yearX/10*10;
		text("Top 10 Monsters of "+yearr+"'s", x+w*0.05, y+h*0.05);

		//main stuff

		popStyle();
	}
}