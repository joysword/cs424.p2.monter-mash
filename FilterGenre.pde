class FilterGenre {
	float x,y,w,h;

	int checkItemCount; // number of level

	CheckItem[] checkItemsForFilterGenre;

	String[] genre;

	FilterGenre(float _x, float _y, float _w, float _h, int n) {	

		x = _x;
		y = _y;
		w = _w;
		h = _h;
		checkItemCount = n;

		checkItemsForFilterGenre = new CheckItem[checkItemCount];
		
		for (int i=0;i<checkItemCount;i++) {
			//change
			checkItemsForFilterGenre[i] = 
				new CheckItem(x + (i % NUMBER_EACH_LINE) * (CHECK_BOX_WIDTH*RELATIVE_WIDTH) * scale, y + (i / NUMBER_EACH_LINE * (CHECK_BOX_WIDTH+2) + TITLE_TO_BOX) * scale, CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * (RELATIVE_WIDTH-1), h, 
				 GENRE_TYPE[i]); //change
		}

		genre = new String[checkItemCount];
		for (int i=0;i<checkItemCount;i++) {
			genre[i] = GENRE_TYPE[i];
		}

	}
	void render() {
		pushStyle();
		noStroke();
		fill(CHECK_ITEM_COLOR);
		textAlign(LEFT);
		text("Genres:",x,y); //change
		popStyle();
		for (int i=0;i<checkItemCount;i++) {
			checkItemsForFilterGenre[i].render();
		}
	}

	// change
	int InWhich(float _x, float _y) {
		for (int i=0;i<checkItemCount;i++) {
			if (checkItemsForFilterGenre[i].isIn(_x, _y)) {
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
			if (checkItemsForFilterGenre[i].isIn(_x, _y)) {
				checkItemsForFilterGenre[i].switchCheck();
				break;
			}
		}
	}
	
	ArrayList<ys_IdGenrePair> getList(cc_DatabaseManager db) {
		// foreach CheckItem, sum all their list to return
		ArrayList<ys_IdGenrePair> listt = new ArrayList<ys_IdGenrePair>();
		for (int i=0;i<checkItemCount;i++) {
			if (checkItemsForFilterGenre[i].isCheck()) {
				//listt.addAll(db.getFilmAndGenre(genre[i]));
			}
		}
		return listt;
	}
}