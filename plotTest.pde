cc_MonsterPlot plot;

void setup(){
  size(1200,900);
  background(0);
  plot=new cc_MonsterPlot(100,1000,200,400,"female_vampire",this);
  plot.monsterSetup();
}

void draw(){
  plot.monsterPlot();
}

