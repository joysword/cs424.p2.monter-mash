class ys_FirstPageFilter {

	float x,y,w,h;

	FilterMonster monF;
	FilterGenre genF;
	FilterFormat forF;
	FilterQuality quaF;
	FilterPopularity popF;
	FilterBudget budF;

	ArrayList<ys_IdGenrePair> idGenre;
	ArrayList<ys_IdQualityPair> idQuality;
	ArrayList<ys_IdPopularityPair> idPopularity;
	ArrayList<ys_IdBudgetPair> idBudget;
	ArrayList<Integer> idFormat;

	//change
	ArrayList<Integer> idMonster;


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
		monF = new FilterMonster(x+FILTER_MONSTER_X_RELATIVE * w, y+FILTER_MONSTER_Y_RELATIVE * h, FILTER_MONSTER_W, FILTER_MONSTER_H, FILTER_MONSTER_NUM);
		genF = new FilterGenre(x+FILTER_GENRE_X_RELATIVE * w, y+FILTER_GENRE_Y_RELATIVE * h, FILTER_GENRE_W, FILTER_GENRE_H, FILTER_GENRE_NUM);
		forF = new FilterFormat(x+FILTER_FORMAT_X_RELATIVE * w, y+FILTER_FORMAT_Y_RELATIVE * h, FILTER_FORMAT_W, FILTER_FORMAT_H, FILTER_FORMAT_NUM);
		quaF = new FilterQuality(x+FILTER_QUALITY_X_RELATIVE * w, y+FILTER_QUALITY_Y_RELATIVE * h, FILTER_QUALITY_W, FILTER_QUALITY_H, FILTER_QUALITY_NUM);
		popF = new FilterPopularity(x+FILTER_POPULARITY_X_RELATIVE * w, y+FILTER_POPULARITY_Y_RELATIVE * h, FILTER_POPULARITY_W, FILTER_POPULARITY_H, FILTER_POPULARITY_NUM);
		budF = new FilterBudget(x+FILTER_BUDGET_X_RELATIVE * w, y+FILTER_BUDGET_Y_RELATIVE * h, FILTER_BUDGET_W, FILTER_BUDGET_H, FILTER_BUDGET_NUM);

		isDisplay = false;

		idGenre = new ArrayList<ys_IdGenrePair>();
		idQuality = new ArrayList<ys_IdQualityPair>();
		idPopularity = new ArrayList<ys_IdPopularityPair>();
		idBudget = new ArrayList<ys_IdBudgetPair>();

		idFormat = new ArrayList<Integer>();

		//change
		idMonster = new ArrayList<Integer>();

	}

	void render(int i) {
		pushStyle();
		fill(POP_UP_COLOR); //change
		noStroke();
	    rectMode(CORNER);
	    rect(x, y, w, h);
	    textAlign(LEFT, BOTTOM);
	    switch (i) {
	    	case 0:
	    	fill(#01b2f1);
	    	break;
	    	case 1:
	    	fill(#29C16B);
	    	break;
	    }
	    text("Select Filters for Graph " + (i+1) + ":", x+5*scale, y-5*scale);//change
		popStyle();
		fill(BUTTON_COLOR);
		noStroke();
		rect(btnx, btny, btnw, btnh);
		textAlign(CENTER,CENTER);
		fill(255);
		text("UPDATE", btnx + btnw*0.5, btny + btnh*0.5);

		monF.render();
		genF.render();
		forF.render();
		quaF.render();
		popF.render();
		budF.render();
	}


	void update(float posx, float posy, ys_DatabaseManager db) {

		if (x>btnx && x < btnx + btnw && y>btny && y<btny + btnh) {
			updateConfirm(posx, posy, db);
		}
		else {
			updateFilter(posx, posy);
		}
	}

	// update all filters
	private void updateFilter(float x, float y) {

		monF.update(x, y);
		genF.update(x, y);
		forF.update(x, y);
		quaF.update(x, y);
		popF.update(x, y);
		budF.update(x, y);
	}

	// update data to show
	private void updateConfirm(float x, float y, ys_DatabaseManager db) {
		filter_current = filter_temp;
		isDisplay = false;

		// update data
	}
}

