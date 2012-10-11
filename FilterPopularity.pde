class FilterPopularity {
	float x,y,w,h;

	int checkItemCount; // number of levels

	CheckItem[] checkItemsForFilterPopularity;

	int[] lowerBound;

	int[] upperBound;

	FilterPopularity(float _x, float _y, float _w, float _h, int n) {

		x = _x;
		y = _y;
		w = _w;
		h = _h;
		checkItemCount = n;

		checkItemsForFilterPopularity = new CheckItem[checkItemCount];
		lowerBound = new int[checkItemCount];
		upperBound = new int[checkItemCount];
		for (int i=0;i<checkItemCount;i++) {
			//change
			checkItemsForFilterPopularity[i] = 
				new CheckItem(x + (i % 5) * (CHECK_BOX_WIDTH*8) * scale, y + (i / 5 * (CHECK_BOX_WIDTH+2) + 12) * scale, CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * 7, h, String.valueOf((i+0.1)*100)+'~'+String.valueOf((i+1)*100)); //change
			lowerBound[i] = i*100;
			upperBound[i] = (i+1)*100;
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
			checkItemsForFilterPopularity[i].render();
		}

	}
	// change
	int InWhich(float _x, float _y) {
		for (int i=0;i<checkItemCount;i++) {
			if (checkItemsForFilterPopularity[i].isIn(_x, _y)) {
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
			if (checkItemsForFilterPopularity[i].isIn(_x, _y)) {
				checkItemsForFilterPopularity[i].switchCheck();
				break;
			}
		}
	}

	ArrayList<ys_IdPopularityPair> getList(ys_DatabaseManager db) {
		// foreach CheckItem, sum all their list to return
		ArrayList<ys_IdPopularityPair> listt = new ArrayList<ys_IdPopularityPair>();
		for (int i=0;i<checkItemCount; i++) {
			if (checkItemsForFilterPopularity[i].isCheck()) {
				listt.addAll(db.getFilmAndPopularity(lowerBound[i], upperBound[i]));
			}
		}
		return listt;
	}
}