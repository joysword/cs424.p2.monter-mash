class FilterMonster {
	float x,y,w,h;

	int n; // number of level

	CheckItem[] CheckItemsForFilterMonster;

	float[] lowerBound;

	float[] upperBound;

	FilterMonster(float _x, float _y, float _w, float _h, int n) {

	}
	void render() {

	}
	boolean checkIn(float _x, float _y) {
		return false;	
	}
	void update(float _x, float _y) {
		
	}
	String getQuery() {
		String str = "( mi.info>10"; // initiate with this IMPOSSIBLE rating, only in order to apply OR in following for condition
		for (int i=0;i<n;i++) {
			if (CheckItemsForFilterMonster[i].isCheck()) {
				str = str+" OR (mi.info>" + lowerBound[i] + " AND mi.info<" + upperBound[i] + ")";
			}
		}
		str = str + " AND (mi.info_type_id = 10) )"; // 10 for keywords
		return str;
	}
}