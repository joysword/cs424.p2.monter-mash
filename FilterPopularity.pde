class FilterPopularity {
	int x,y,w,h;

	int n; // number of levels

	CheckItem[] CheckItemsForFilterPopularity;

	float[] lowerBound;

	float[] upperBound;

	FilterPopularity() {

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
			if (CheckItemsForFilterPopularity[i].isCheck()) {
				str = str+" OR (mi.info>" + lowerBound[i] + " AND mi.info<" + upperBound[i] + ")";
			}
		}
		str = str + " AND (mi.info_type_id = 100) )"; // 100 for votes
		return str;
	}
}