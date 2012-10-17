class Instance{
	public int[] count={0,0,0,0,0,0,0};
	private int year;

	public Instance(int year){
		this.year=year;
	}

	public float getting(int i){
		return count[i];
	}

	public float geee(int i) {
		return count[i];
	}

	public void set(int i,int value){
		count[i]=value;
	}

	public int getYear(){
		return year;
	}
}