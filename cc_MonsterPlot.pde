/**
	The class <b>MonsterPlot</b> Plots data for the monster page 
*/


public class cc_MonsterPlot{
	private static final float GRAPH_DATA_STROKE_WIDTH=0.00694;
	private static final int GRAPH_DATA_COLOR=120;
	private static final float GRAPH_DATA_LABELS_SIZE=0.00694;
	private static final float HOW_MUCH_LABEL_IS_UNDER_PLOT=0.06;
	private int leftX;
	private int rightX;
	private int upperY;
	private int lowerY;
	private cc_PlotDataManager dataManager;
        private float x,y;
        private float intervalYear=5;

	public cc_MonsterPlot(int leftX,int rightX,int upperY,int lowerY,String monster,PApplet context){
		this.leftX=leftX;
		this.rightX=rightX;
		this.upperY=upperY;
		this.lowerY=lowerY;
		dataManager=new cc_PlotDataManager(monster,context);
                dataManager.setData(cc_PlottedData.NUMBER_FILMS);
	}

	public void monsterSetup(){
		dataManager.setData(cc_PlottedData.NUMBER_FILMS); 
		}

        public void monsterPlot(){
		drawYaxe();
		drawLabels();
                drawData();
	}

	private void drawData(){
		pushStyle();
		strokeWeight(5);
		beginShape();
                noFill();
		stroke(255);
		for(int i=0;i<dataManager.datasetSize();i++){
 		  x = map(dataManager.getX(i), dataManager.getYearMin(), dataManager.getYearMax(), leftX, rightX); 
                  y = map(dataManager.getY(i), dataManager.getDataMin(), dataManager.getDataMax(), lowerY, upperY);
                  println(x+" "+y);
                  if(x>0)
                  vertex(x,y);
                } 
                endShape();
                popStyle();
	}

	private void drawYaxe(){

	}

	private void drawLabels(){
		pushStyle();
	        fill(GRAPH_DATA_COLOR);
  		stroke(GRAPH_DATA_COLOR);
  		textAlign(CENTER, TOP);
  		strokeWeight(1); 
  		float x;
	  	for(int i=0;i<dataManager.datasetSize();i++){
                if(i%intervalYear==0){
	   	        x = map(dataManager.getX(i), dataManager.getYearMin(), dataManager.getYearMax(), leftX, rightX);
	    		text(dataManager.getX(i), x, lowerY);
	      		line(x, upperY, x, lowerY);
                }
	  	}
	  	popStyle();
	}

	private void drawTitle(){

	}



}
