/**
	Data Manager for the plot.
*/
public class cc_PlotDataManager{
	private cc_DatabaseManager db;
	private ArrayList<cc_YearCountPair> data;
	private int yearMin;
	private int yearMax;
	private int dataMin;
	private String monster;

	public cc_PlotDataManager(String monster, PApplet context){
			this.monster=monster;
			db=new cc_DatabaseManager(context);
			yearMin=1890;
			yearMax=2012;
			dataMin=0;
		}

	public void setData(cc_PlottedData dataType){
		if(!animal()){
			if(dataType==cc_PlottedData.NUMBER_FILMS)
				data=db.getFilmNumber(monster);
			else if(dataType==cc_PlottedData.POPULARITY)
				data=db.getPopularity(monster);
		}else{
			if(dataType==cc_PlottedData.NUMBER_FILMS)
				data=db.getFilmNumberAnimal(monster);
			else if(dataType==cc_PlottedData.POPULARITY)
				data=db.getPopularityAnimal(monster);
		}
		
	}

	public float getDataMax(){
		float max=0;
		for(cc_YearCountPair pair: data){
			if(pair.getCount()>=max)
				max=pair.getCount();
                }
		return max;
	}

	public int getX(int i){
		return data.get(i).getYear();
	}

	public float getY(int i){
		return data.get(i).getCount();
	}

	public int getYearMin(){
		return yearMin;
	}

	public int getYearMax(){
		return yearMax;
	}

	public float getDataMin(){
		return dataMin;
	}

	public int datasetSize(){
		return data.size();
	}

  public ArrayList<cc_YearCountPair> getData(){
    return data;
  }

  private boolean animal(){
  		if(monster.equals(cc_DatabaseManager.SHARK_REF)||monster.equals(cc_DatabaseManager.SNAKE_REF))
  }
}
