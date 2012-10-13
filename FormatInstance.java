public class FormatInstance{
	private int year;
	private int low;
	private int med;
	private int high;
	
	public FormatInstance(int year,int low,int med,int high){
		this.year=year;
		this.low=low;
		this.med=med;
		this.high=high;
	}

        public int getYear(){
                return year;
        }
	public void setLow(int low){
		this.low=low;
	}

	public void setMed(int med){
		this.med=med;
	}

	public void setHigh(int high){
		this.high=high;
	}

	public int getLow(){
		return low;
	}
	public int getMed(){
		return med;
	}

	public int getHigh(){
		return high;
	}


}
