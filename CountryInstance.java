public class CountryInstance {
  private int year;
  private int USA;
  private int UK;
  private int France; 
  private int Japan;
  private int Germany;
  private int Canada;
  private int Others;

  public CountryInstance(int year, int USA, int UK, int France, int Japan, int Germany, int Canada, int Others) {
    this.USA=USA;
    this.UK=UK;
    this.France=France;
    this.Japan=Japan;
    this.Germany=Germany;
    this.Canada=Canada;
    this.Others=Others;
    this.year=year;
  }

  public int getYear() {
    return year;
  }
  public void setUSA(int USA) {
    this.USA=USA;
  }

  public void setUK(int UK) {
    this.UK=UK;
  }
  public void setFrance(int France) {
    this.France=France;
  }
  public void setJapan(int Japan) {
    this.Japan=Japan;
  }
  public void setGermany(int Germany) {
    this.Germany=Germany;
  }
  public void setCanada(int Canada) {
    this.Canada=Canada;
  }
  public void setOthers(int others) {
    this.Others=others;
  }


  public int getUSA() {
    return USA;
  }
  public int getUK() {
    return UK;
  }

  public int getFrance() {
    return France;
  }
  public int getJapan() {
    return Japan;
  }
  public int getGermany() {
    return Germany;
  }

  public int getCanada() {
    return Canada;
  }
  public int getOthers() {
    return Others;
  }

  public int get(int i) {
    switch(i) {
    case 0:
      return USA;
    case 1:
      return UK;
    case 2:
      return France;
    case 3:
      return Japan;
    case 4:
      return Germany;
    case 5:
      return Canada;
    case 6:
      return Others;
    }
    return -1;
  }
}
