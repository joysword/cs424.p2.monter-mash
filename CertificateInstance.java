public class CertificateInstance {
  private int year;
  private int G;
  private int PG;
  private int R; 
  private int PG-13;
  private int NC-17;
  private int OTHERS;
  private int NR;

  public CertificateInstance(int year,int G,int PG,int R,int PG-13,int NC-17,int OTHERS,int NR) {
    this.G=G;
    this.PG=PG;
    this.R=R;
    this.PG-13=PG-13;
    this.NC-17=NC-17;
    this.OTHERS=OTHERS;
    this.NR=NR;
    this.year=year;
  }

  public int getYear() {
    return year;
  }
  public void setG(int g) {
    this.G=g;
  }

  public void setPG(int pg) {
    this.PG=pg;
  }
    public void setR(int r) {
    this.R=r;
  }
    public void setPG-13(int pg-13) {
    this.PG-13=pg-13;
  }
    public void setNC-17(int nc-17) {
    this.NC-17=nc-17;
  }
    public void setOTHERS(int others) {
    this.OTHERS=others;
  }
    public void setNR(int nr) {
    this.NR=nr;
  }
  

  public int getG() {
    return G;
  }
  public int getPG() {
    return PG;
  }

  public int getR() {
    return R;
  }
   public int getPG-13() {
    return PG-13;
  }
  public int getNC-17() {
    return NC-17;
  }

  public int getOTHERS() {
    return OTHERS;
  }
    public int getNR() {
    return NR;
  }
  
}

