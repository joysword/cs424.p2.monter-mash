class FilterMonster {
	float x,y,w,h;

	int checkItemCount; // number of level

	CheckItem[] checkItemsForFilterMonster;

	String[] monster;

	FilterMonster(float _x, float _y, float _w, float _h, int n) {

		x = _x;
		y = _y;
		w = _w;
		h = _h;
		checkItemCount = n;

		checkItemsForFilterMonster = new CheckItem[checkItemCount];
		
		for (int i=0;i<checkItemCount;i++) {
			//change
			checkItemsForFilterMonster[i] = 
				new CheckItem(x + (i % 5) * (CHECK_BOX_WIDTH*8) * scale, y + (i / 5 * (CHECK_BOX_WIDTH+2) + 12) * scale, CHECK_BOX_WIDTH, CHECK_BOX_WIDTH * 7, h, MONSTER_TYPE[i]); //change
		}

		monster = new String[checkItemCount];
		for (int i=0;i<checkItemCount;i++) {
			monster[i] = MONSTER_TYPE[i];
		}
	}
	void render() {
		pushStyle();
		noStroke();
		fill(CHECK_ITEM_COLOR);
		textAlign(LEFT);
		text("Monsters:",x,y); //change
		popStyle();
		for (int i=0;i<checkItemCount;i++) {
			checkItemsForFilterMonster[i].render();
		}
	}
	// change
	int InWhich(float _x, float _y) {
		for (int i=0;i<checkItemCount;i++) {
			if (checkItemsForFilterMonster[i].isIn(_x, _y)) {
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
			if (checkItemsForFilterMonster[i].isIn(_x, _y)) {
				checkItemsForFilterMonster[i].switchCheck();
				break;
			}
		}
	}

	ArrayList<Integer> getList(ys_DatabaseManager db) {
		// foreach CheckItem, sum all their list to return
		ArrayList<Integer> listt = new ArrayList<Integer>();
		for (int i=0;i<checkItemCount;i++) {
			if (checkItemsForFilterMonster[i].isCheck()) {
				listt.addAll(db.getFilmForMonster(monster[i]));
			}
		}
		return listt;
	}
	
}