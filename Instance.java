public class Instance{
	private int[] count={0,0,0,0,0,0,0];
	private int year;

	public Instance(int year){
		this.year=year;
	}

	public get(int i){
		return count(i);
	}

	public set(int i,int value){
		count(i)=value;
	}



}