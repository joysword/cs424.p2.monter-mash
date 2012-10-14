public class CertificateInstance {
    private int year;
    private int G;
    private int PG;
    private int R; 
    private int PG13;
    private int NC17;
    private int OTHERS;
    private int NR;
    
    public CertificateInstance(int year,int G,int PG,int R,int PG13,int NC17,int OTHERS,int NR) {
        this.G=G;
        this.PG=PG;
        this.R=R;
        this.PG13=PG13;
        this.NC17=NC17;
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
    public void setPG13(int pg13) {
        this.PG13=pg13;
    }
    public void setNC17(int nc17) {
        this.NC17=nc17;
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
    public int getPG13() {
        return PG13;
    }
    public int getNC17() {
        return NC17;
    }
    
    public int getOTHERS() {
        return OTHERS;
    }
    public int getNR() {
        return NR;
    }
    
    public int get(int i){
        switch(i){
            case 0:
                return G;
                break;
            case 1:
                return PG;
                break;
            case 2:
                return R;
                break;
            case 3:
                return PG13;
                break;
            case 4:
                return NC17;
                break;
            case 5:
                return OTHERS;
                break;
            case 6:
                return NR;
                break;
        }
    
    
    }
    
}
