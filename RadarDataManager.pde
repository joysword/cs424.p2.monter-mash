public class RadarDataManager {

  private cc_DatabaseManager db;
  private ArrayList<cc_YearCountPair> dataPop;
  private ArrayList<cc_YearCountPair> dataFilmNumb;
  private ArrayList<cc_YearCountPair> dataFilmNumbTotal;
  private ArrayList<cc_YearCountPair> dataBudget;
  private ArrayList<cc_YearCountPair> dataTotalHorror;
  private int yearMin;
  private int yearMax;
  private int dataMin;
  private String monster;

  public RadarDataManager(String monster) {
    this.monster=monster;
    db=new cc_DatabaseManager(context);
    yearMin=1890;
    yearMax=2012;
    dataMin=0;
  }

  public void setData(String monster) {
    if (!animal()) {
      dataFilmNumb=db.getFilmNumber(monster);
      dataPop=db.getPopularity(monster);
    }
    else {
      dataFilmNumb=db.getFilmNumberAnimal(monster);
      dataPop=db.getPopularityAnimal(monster);
    }
  }

  public float getDataMax(cc_PlottedData dataType) {
    float max=0;
    ArrayList<cc_YearCountPair> data;
    if (dataType==cc_PlottedData.POPULARITY)
      data=dataPop;
    else if (dataType==cc_PlottedData.NUMBER_FILMS)
      data=dataFilmNumb;
    else if (dataType==cc_PlottedData.BUDGET)
      data=dataBudget;
    else if (dataType==cc_PlottedData.NUMBER_TOTAL)
      data=dataFilmNumbTotal;
    else if (dataType==cc_PlottedData.TOTAL_HORROR)
      data=dataTotalHorror;
    else data= new ArrayList<cc_YearCountPair>();

    for (cc_YearCountPair pair: data) {
      if (pair.getCount()>=max)
        max=pair.getCount();
    }
    return max;
  }

  public int getXdataPop(int i) {
    return dataPop.get(i).getYear();
  }

  public float getYdataPop(int i) {
    return dataPop.get(i).getCount();
  }
  public int getXdataFilmNumb(int i) {
    return dataFilmNumb.get(i).getYear();
  }

  public float getYdataFilmNumb(int i) {
    return dataFilmNumb.get(i).getCount();
  }
  public int getXdataFilmNumbTotal(int i) {
    return dataFilmNumbTotal.get(i).getYear();
  }

  public float getYdataFilmNumbTotal(int i) {
    return dataFilmNumbTotal.get(i).getCount();
  }
  public int getXdataBudget(int i) {
    return dataBudget.get(i).getYear();
  }

  public float getYdataBudget(int i) {
    return dataBudget.get(i).getCount();
  }
  public int getXdataTotalHorror(int i) {
    return dataTotalHorror.get(i).getYear();
  }

  public float getYdataTotalHorror(int i) {
    return dataTotalHorror.get(i).getCount();
  }

  public int getYearMin() {
    return yearMin;
  }

  public int getYearMax() {
    return yearMax;
  }

  public float getDataMin() {
    return dataMin;
  }
  /*
	public int datasetSize(){
   		return data.size();
   	}
   
   public ArrayList<cc_YearCountPair> getData(){
   return data;
   }
   */
  private boolean animal() {
    if (monster.equals(cc_DatabaseManager.SHARK_REF)||monster.equals(cc_DatabaseManager.SNAKE_REF))
      return true;
    else return false;
  }
}

