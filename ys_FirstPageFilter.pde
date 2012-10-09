class ys_FirstPageFilter {

	float x,y,w,h;
	FilterMonster monF;
	FilterGenre genF;
	FilterFormat forF;
	FilterQuality quaF;
	FilterPopularity popF;
	FilterBudget budF;

	String filter_temp;
	String filter_current;

	float btnx, btny, btnw, btnh;

	boolean isDisplay;

	ys_FirstPageFilter(float _x, float _y, float _w, float _h, float bx, float by, float bw, float bh) {

		x = _x;
		y = _y;
		w = _w;
		h = _h;

		btnx = bx;
		btny = by;
		btnw = bw;
		btnh = bh;

		// change construtor parameters
		monF = new FilterMonster();
		genF = new FilterGenre();
		forF = new FilterFormat();
		quaF = new FilterQuality();
		popF = new FilterPopularity();
		budF = new FilterBudget();

		isDisplay = false;
	}

	void render(int i) {
		pushStyle();
		fill(20); //change
		noStroke();
	    rectMode(CORNER);
	    rect(x, y, w, h);
	    textAlign(LEFT);
	    fill(#01b2f1);
	    text("Select Filters for Graph " + (i+1) + ":", x+20*scale, y+10*scale);
		popStyle();
		monF.render();
		genF.render();
		forF.render();
		quaF.render();
		popF.render();
		budF.render();
		fill(#ff0066); //change
		noStroke();
		rect(btnx, btny, btnw, btnh);
		textAlign(CENTER,CENTER);
		text("Confirm", btnx + btnw*0.5, btny + btnh*0.5);
	}


	void update(float posx, float posy) {
		updateFilter(posx, posy);
		updateConfirm(posx, posy);
	}

	// update all filters
	private void updateFilter(float x, float y) {
		boolean flag = false;
		if (monF.checkIn(x, y)) {
			monF.update(x,y);
			flag = true;
		}
		else if (genF.checkIn(x, y)) {
			genF.update(x,y);
			flag = true;
		}
		else if (forF.checkIn(x, y)) {
			forF.update(x,y);
			flag = true;
		}
		else if (quaF.checkIn(x, y)) {
			quaF.update(x,y);
			flag = true;
		}
		else if (popF.checkIn(x, y)) {
			popF.update(x,y);
			flag = true;
		}
		else if (budF.checkIn(x, y)) {
			budF.update(x,y);
			flag = true;
		}

		//combine all filters to become the final filter
		if (flag) {
			filter_temp = genF.getString() + ")AND(" + monF.getString() + ")AND(" + forF.getString() + ")AND(" + quaF.getString() + ")AND(" + popF.getString() + ")AND(" + budF.getString();
		}
	}

	// pass new filter to whoever needs it
	private void updateConfirm(float x, float y) {
		if (x>btnx && x < btnx + btnw && y>btny && y<btny + btnh) {
			filter_current = filter_temp;
			isDisplay = false;
		}
	}
}