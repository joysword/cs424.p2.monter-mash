class FilterFormat {
	int x,y,w,h;

	int n; // number of level

	CheckItem[] CheckItemsForFilterFormat;

	float[] lowerBound;

	float[] upperBound;

	FilterFormat() {

	}
	void render() {

	}

	boolean checkIn(float _x, float _y) {
		return false;	
	}
	void update(float _x, float _y) {
		
	}
	void update(float _x, float _y) {
		
	}
	String getQuery() {
		String str = "( mi.info>10"; // initiate with this IMPOSSIBLE rating, only in order to apply OR in following for condition
		for (int i=0;i<n;i++) {
			if (CheckItemsForFilterFormat[i].isCheck()) {
				str = str+" OR (mi.info>" + lowerBound[i] + " AND mi.info<" + upperBound[i] + ")";
			}
		}
		str = str + " AND (mi.info_type_id = 101) )";
		return str;
	}
}