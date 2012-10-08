int scaling=6;

monsterTaxonomy taxonomy;
PApplet context = this;

void setup(){
size(8160/scaling,2304/scaling);


taxonomy=new monsterTaxonomy(width/2,height/2,width/6*4,height*0.95,color(255));
taxonomy.setup();
}

void draw(){
background(0);


//linee per aiutarsi
  
   stroke(255, 0, 0);
   strokeWeight(1);
   line(0, height/3, width, height/3);
   line(0, 2*height/3, width, 2*height/3);
   
   for (int i=1;i<6;i++) {
   line(i*width/6, 0, i*width/6, height);
   } 
 
 
 taxonomy.draw();
 
}

void mousePressed(){
 if(this.taxonomy.singleMonsterPane.show){
   this.taxonomy.singleMonsterPane.checkHideButton(mouseX,mouseY);}
}

void mouseDragged(){
 if(!this.taxonomy.singleMonsterPane.show){ taxonomy.dragNodes(mouseX, mouseY);}
}

void mouseReleased(){
   //if(!this.taxonomy.singleMonsterPane.show){
if(!this.taxonomy.singleMonsterPane.show){ taxonomy.selectNodes(mouseX, mouseY);
taxonomy.noMoving();}}
//}
