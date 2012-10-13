class FilterQuality {
	float x,y,w,h;
	
	int checkItemCount; // number of level

	CheckItem[] checkItemsForFilterQuality;

	float[] lowerBound;

	float[] upperBound;

	FilterQuality(float _x, float _y, float _w, float _h, int n) {
		
		x = _x;
		y = _y;
		w = _w;
		h = _h;
		checkItemCount = n;
		
		checkItemsForFilterQuality = new CheckItem[checkItemCount];
		lowerBound = new float[checkItemCount];
		upperBound = new float[checkItemCount];
		for (int i=0;i<checkItemCount;i++) {
			//change
			checkItemsForFilterQuality[i] = 
				new CheckItem(x + (i % NUMBER_EACH_LINE) * (CHECK_BOX_WIDTH*RELATIVE_WIDTH) * scale, y + (i / NUMBER_EACH_LINE * (CHECK_BOX_WIDTH+2) + TITLE_TO_BOX) * scale, CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * (RELATIVE_WIDTH-1), h, 
				 String.valueOf(i+0.1)+'~'+String.valueOf(i+1)+".0"); //change
			lowerBound[i] = i+0.1;
			upperBound[i] = i+1;
		}

	}
	void render() {
		pushStyle();
		noStroke();
		fill(CHECK_ITEM_COLOR);
		textAlign(LEFT);
		text("Ratings:",x,y); //change
		popStyle();
		for (int i=0;i<checkItemCount;i++) {
			checkItemsForFilterQuality[i].render();
		}
	}

	// change
	int InWhich(float _x, float _y) {
		for (int i=0;i<checkItemCount;i++) {
			if (checkItemsForFilterQuality[i].isIn(_x, _y)) {
				return i;
			}
		}
		return -1;
	}

	boolean checkIn(float _x, float _y) {
		return false;
	}

	void update(float _x, float _y) {
		for (int i=0;i<checkItemCount;i++) {
			if (checkItemsForFilterQuality[i].isIn(_x, _y)) {
				checkItemsForFilterQuality[i].switchCheck();
				break;
			}
		}
	}

	ArrayList<ys_IdQualityPair> getList(cc_DatabaseManager db) {
		// foreach CheckItem, sum all their list to return
		ArrayList<ys_IdQualityPair> listt = new ArrayList<ys_IdQualityPair>();
		for (int i=0;i<checkItemCount; i++) {
			if (checkItemsForFilterQuality[i].isCheck()) {
				//listt.addAll(db.getFilmAndQuality(lowerBound[i], upperBound[i]));
			}
		}
		return listt;
	}
}