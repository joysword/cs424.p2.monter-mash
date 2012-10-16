public class StringCountPair{
  private String stringValue;
  private float count;
  
  public StringCountPair(float count,String stringValue){
    this.stringValue=stringValue;
    this.count=count;
  }
  
  public String getString(){
     return stringValue; 
  }
  
  public float getCount(){
     return count; 
  }
  
}
