public class monsterTaxonomy {

  private SingleMonsterPane singleMonsterPane;
  private float centerX;
  private float centerY;
  private float widthT;
  private float heightT;
  private float nodeDiameterFather, nodeDiameterChild;
  private color background;
  public ArrayList nodesList= new ArrayList();
  private int indexMoving=-1;

  //vampires
  private     monsterNode vampires; 
  private PImage vampires_pic;
  private monsterNode dracula;
  private PImage dracula_pic;
  private monsterNode femaleVampires;
  private PImage femaleVampires_pic;

  //extraterrestrials
  private  monsterNode Extraterrestrials;
  private PImage Extraterrestrials_pic;
  private monsterNode predator;
  private PImage predator_pic;

  //living dead
  private monsterNode livingDead;
  private PImage livingDead_pic;
  private monsterNode mummy;
  private PImage mummy_pic;
  private monsterNode zombies;
  private PImage zombies_pic;
  private monsterNode frankenstein;
  private PImage frankenstein_pic;

  //humanoids
  private monsterNode humanoids;
  private PImage humanoids_pic;
  private monsterNode witches;
  private PImage witches_pic;
  private monsterNode swampCreature;
  private PImage swampCreature_pic;
  private monsterNode invisibleMan;
  private PImage invisibleMan_pic;
  private monsterNode freddykrueger;
  private PImage freddykrueger_pic;
  private monsterNode jason;
  private PImage jason_pic;

  //supernatural Forces
  private monsterNode supernaturalForces;
  private PImage supernaturalForces_pic;
  private monsterNode demons;
  private PImage demons_pic;
  private monsterNode possessedObjects;
  private PImage possessedObjects_pic;

  //plants and animals
  private monsterNode plantsAnimals;
  private PImage plantsAnimals_pic;
  private monsterNode snakes;
  private PImage snakes_pic;
  private monsterNode prehistoric;
  private PImage prehistoric_pic;
  private monsterNode aquatic;
  private PImage aquatic_pic;
  private monsterNode sharks;
  private PImage sharks_pic;

  //mutants
  private monsterNode mutants;
  private PImage mutants_pic;

  //mutated creatures
  private monsterNode mutatedCreatures;
  private PImage mutatedCreatures_pic;
  private monsterNode godzilla;
  private PImage godzilla_pic;

  //werewolves
  private monsterNode werewolves;
  private PImage werewolves_pic;


  public monsterTaxonomy(float centerX, float centerY, float widthT, float heightT, color background ) {
    this.centerX=centerX;
    this.centerY=centerY;
    this.widthT=widthT;
    this.heightT=heightT;
    nodeDiameterFather=this.heightT/3.5;
    nodeDiameterChild=this.heightT/5.3;
    this.background=background;
  }

  public void setup() {

    singleMonsterPane=new SingleMonsterPane(this.centerX, this.centerY, this.widthT*0.7, this.heightT*0.9, color(0));
    //vampires

    vampires_pic=loadImage("vampires.png");
    vampires = new monsterNode("vampires", this.centerX-this.widthT/2+this.widthT*0.1, this.centerY-this.heightT/2+this.heightT*0.85, this.nodeDiameterFather, vampires_pic);
    this.addNode(vampires);

    dracula_pic=loadImage("dracula.png");
    dracula = new monsterNode("Dracula", 0, 0, this.nodeDiameterChild, dracula_pic);
    dracula.setFather(vampires);
    dracula.setCenter(149*7/scaling, 268*7/scaling);
    this.addNode(dracula);

    femaleVampires_pic=loadImage("femalevampires.png");
    femaleVampires = new monsterNode("Female\nVampires", 0, 0, this.nodeDiameterChild, femaleVampires_pic);
    femaleVampires.setFather(vampires);
    femaleVampires.setCenter(femaleVampires.father.centerX+this.nodeDiameterChild*2.5, femaleVampires.father.centerY-this.nodeDiameterChild*0.5);
    this.addNode(femaleVampires);

    //extraterrestrials
    Extraterrestrials_pic=loadImage("extraterrestrial.png");
    Extraterrestrials = new monsterNode("Extraterrestrials", 1517*7/scaling, 191*7/scaling, this.nodeDiameterFather, Extraterrestrials_pic);
    this.addNode(Extraterrestrials);

    predator_pic=loadImage("predator.png");
    predator = new monsterNode("Predator", 0, 0, this.nodeDiameterChild, predator_pic);
    predator.setFather(Extraterrestrials);
    predator.setCenter(predator.father.centerX, predator.father.centerY+this.nodeDiameterChild*1.5);
    this.addNode(predator);


    //living dead
    livingDead_pic=loadImage("livingDead.png");
    livingDead = new monsterNode("Living Dead", this.centerX-this.widthT/2+this.widthT*0.15, this.centerY-this.heightT/2+this.heightT*0.25, this.nodeDiameterFather, livingDead_pic);
    this.addNode(livingDead);

    mummy_pic=loadImage("mummy.png");
    mummy = new monsterNode("Mummy", 0, 0, this.nodeDiameterChild, mummy_pic);
    mummy.setFather(livingDead);
    mummy.setCenter(mummy.father.centerX+this.nodeDiameterChild*1, mummy.father.centerY+this.nodeDiameterChild*1.5);
    this.addNode(mummy);

    zombies_pic=loadImage("zombies.png");
    zombies = new monsterNode("Zombies", 0, 0, this.nodeDiameterChild, zombies_pic);
    zombies.setFather(livingDead);
    zombies.setCenter(153*7/scaling, 120*7/scaling);
    zombies.setFather(livingDead);
    this.addNode(zombies);

    frankenstein_pic=loadImage("frankenstein.png");
    frankenstein = new monsterNode("Frankenstein", 50, 50, this.nodeDiameterChild, frankenstein_pic);
    frankenstein.setFather(livingDead);
    frankenstein.setCenter(377*7/scaling, 125*7/scaling);   
    this.addNode(frankenstein);

    //humanoids
    humanoids_pic=loadImage("humanoids.png");
    humanoids = new monsterNode("Humanoids",752*7/scaling, 229*7/scaling, this.nodeDiameterFather, humanoids_pic);
    this.addNode(humanoids);

    witches_pic=loadImage("witches.png");
    witches = new monsterNode("Witches and\nWizards", 0, 0, this.nodeDiameterChild, witches_pic);
    witches.setFather(humanoids);
    witches.setCenter(witches.father.centerX-this.nodeDiameterChild*1.5, witches.father.centerY-this.nodeDiameterChild*1.5);
    this.addNode(witches);

    swampCreature_pic=loadImage("swampcreatures.png");
    swampCreature = new monsterNode("Swamp\nCreature", 0, 0, this.nodeDiameterChild, swampCreature_pic);
    swampCreature.setFather(humanoids);
    swampCreature.setCenter(745*7/scaling, 331*7/scaling);
    this.addNode(swampCreature);

    invisibleMan_pic=loadImage("invisible.png");
    invisibleMan = new monsterNode("The Invisible Man", 0, 0, this.nodeDiameterChild, invisibleMan_pic);
    invisibleMan.setFather(humanoids);
    invisibleMan.setCenter(789*7/scaling, 118*7/scaling);
    this.addNode(invisibleMan);

    freddykrueger_pic=loadImage("freddykrueger.png");
    freddykrueger = new monsterNode("Freddy", 886*7/scaling, 180*7/scaling, this.nodeDiameterChild, freddykrueger_pic);
    freddykrueger.setFather(humanoids);
    freddykrueger.setCenter(freddykrueger.father.centerX+this.nodeDiameterChild*2, freddykrueger.father.centerY-this.nodeDiameterChild*0.4);
    this.addNode(freddykrueger);

    jason_pic=loadImage("jason.png");
    jason = new monsterNode("Jason", 0, 0, this.nodeDiameterChild, jason_pic);
    jason.setFather(humanoids);
    jason.setCenter(894*7/scaling, 322*7/scaling);
    this.addNode(jason);


    //supernaturalForces
    supernaturalForces_pic=loadImage("supernatural.png");
    supernaturalForces = new monsterNode("supernatural Forces", 579*7/scaling, 283*7/scaling, this.nodeDiameterFather, supernaturalForces_pic);
    this.addNode(supernaturalForces);

    demons_pic=loadImage("demons.png");
    demons = new monsterNode("Demons", 0, 0, this.nodeDiameterChild, demons_pic);
    demons.setFather(supernaturalForces);
    demons.setCenter(526*7/scaling,408*7/scaling);
    this.addNode(demons);

    possessedObjects_pic=loadImage("possessedobjects.png");
    possessedObjects = new monsterNode("Possessed Objects", 0, 0, this.nodeDiameterChild, possessedObjects_pic);
    possessedObjects.setFather(supernaturalForces);
    possessedObjects.setCenter(643*7/scaling, 406*7/scaling);
    this.addNode(possessedObjects);

    //plants and animals
    plantsAnimals_pic=loadImage("animals.png");
    plantsAnimals = new monsterNode("Plants and\nAnimals", 1136*7/scaling, 307*7/scaling, this.nodeDiameterFather, plantsAnimals_pic);
    this.addNode(plantsAnimals);

    snakes_pic=loadImage("snakes.png");
    snakes = new monsterNode("Snakes", 0, 0, this.nodeDiameterChild, snakes_pic);
    snakes.setFather(plantsAnimals);
    snakes.setCenter(snakes.father.centerX+this.nodeDiameterChild*1.5, snakes.father.centerY-this.nodeDiameterChild*1.5);
    this.addNode(snakes);

    prehistoric_pic=loadImage("dinosaurs.png");
    prehistoric = new monsterNode("Dinosaurs", 0, 0, this.nodeDiameterChild, prehistoric_pic);
    prehistoric.setFather(plantsAnimals);
    prehistoric.setCenter(1000*7/scaling, 402*7/scaling);
    this.addNode(prehistoric);

    aquatic_pic=loadImage("piranha.png");
    aquatic = new monsterNode("Piranha", 0, 0, this.nodeDiameterChild, aquatic_pic);
    aquatic.setFather(plantsAnimals);
    aquatic.setCenter(1027*7/scaling, 245*7/scaling);
    this.addNode(aquatic);

    sharks_pic=loadImage("sharks.png");
    sharks = new monsterNode("Sharks", 0, 0, this.nodeDiameterChild, sharks_pic);
    sharks.setFather(plantsAnimals);
    sharks.setCenter(1164*7/scaling, 402*7/scaling);
    this.addNode(sharks);

    //mutants
    mutants_pic=loadImage("mutants.png");
    mutants = new monsterNode("Mutants", this.centerX-this.widthT/2+this.widthT*0.85, this.centerY-this.heightT/2+this.heightT*0.2, this.nodeDiameterFather, mutants_pic);
    this.addNode(mutants);

    werewolves_pic=loadImage("werewolves.png");
    werewolves = new monsterNode("Werewolves", 0, 0, this.nodeDiameterChild, werewolves_pic);
    werewolves.setFather(mutants);
    werewolves.setCenter(werewolves.father.centerX-this.nodeDiameterChild*3, werewolves.father.centerY-this.nodeDiameterChild*0.5);
    this.addNode(werewolves);

    //mutated creatures
    mutatedCreatures_pic=loadImage("mutatedCreatures.png");
    mutatedCreatures = new monsterNode("Mutated Creatures", this.centerX-this.widthT/2+this.widthT*0.85, this.centerY-this.heightT/2+this.heightT*0.8, this.nodeDiameterFather, mutatedCreatures_pic);
    this.addNode(mutatedCreatures);

    godzilla_pic=loadImage("godzilla.png");
    godzilla = new monsterNode("Godzilla", 0, 0, this.nodeDiameterChild, godzilla_pic);
    godzilla.setFather(mutatedCreatures);
    godzilla.setCenter(1482*7/scaling,390*7/scaling);
    this.addNode(godzilla);
  }

  public void draw() {

    pushStyle();

    // if(indexMoving==this.nodesList.indexOf(vampires)){
    //dracula.setCenter(dracula.father.centerX-this.nodeDiameterChild*1.5, dracula.father.centerY-this.nodeDiameterChild*1.5);}


    rectMode(CENTER);
    fill(this.background);
    //strokeWeight(40/scaling);
    //stroke(255,0,0);
    rect(this.centerX, this.centerY, this.widthT, this.heightT);

    //connections between macro groups
    connect(plantsAnimals, mutatedCreatures, color(0));
    connect(mutants, mutatedCreatures, color(0));
    connect(livingDead, humanoids, color(0));
    connect(livingDead, vampires, color(0));
    connect(supernaturalForces, livingDead, color(0));

    //connections between living dead
    connect(mummy, livingDead, color(0));
    connect(zombies, livingDead, color(0));
    connect(frankenstein, livingDead, color(0));

    //connections between vampires
    connect(vampires, dracula, color(0));
    connect(vampires, femaleVampires, color(0));

    //connections between extraterrestrials
    connect(Extraterrestrials, predator, color(0));

    //connections between humanoids
    connect(humanoids, witches, color(0));
    connect(humanoids, freddykrueger, color(0));
    connect(humanoids, swampCreature, color(0));
    connect(humanoids, jason, color(0));
    connect(humanoids, invisibleMan, color(0));

    //connections between plants and animals

    connect(plantsAnimals, snakes, color(0));
    connect(plantsAnimals, prehistoric, color(0));
    connect(plantsAnimals, aquatic, color(0));
    connect(plantsAnimals, sharks, color(0));

    //connections between supernatural forces
    connect(supernaturalForces, demons, color(0));
    connect(supernaturalForces, possessedObjects, color(0));

    //connections between mutated creatures
    connect(mutatedCreatures, godzilla, color(0));

    //connections between mutants
    connect(mutants, werewolves, color(0));

    popStyle();

    for (int i=0;i<this.nodesList.size();i++) {
      ((monsterNode)this.nodesList.get(i)).draw();
    }

    if (this.singleMonsterPane.show) {
      this.singleMonsterPane.draw();
    }

  }

  public void addNode(monsterNode node) {
    this.nodesList.add(node);
  }

  public void connect(monsterNode node1, monsterNode node2, color linecolor) {


    strokeWeight(20/scaling);
    stroke(linecolor);
    line(node1.centerX, node1.centerY, node2.centerX, node2.centerY);
  }
  public void dragNodes(float myX, float myY) {

    for (int i=0;i<this.nodesList.size();i++) {

      if ((((monsterNode)this.nodesList.get(i)).checkOn(myX, myY)|| indexMoving==i)&& (indexMoving==i || indexMoving==-1)) {


        (((monsterNode)this.nodesList.get(i))).setCenter(myX+distanceX,myY+distanceY);
        indexMoving=i;
        (((monsterNode)this.nodesList.get(i))).moving=true;
      }
    }
  }

  public void selectNodes(float myX, float myY) {
    float ics, ips;
    for (int i=0;i<this.nodesList.size();i++) {

      if (((monsterNode)this.nodesList.get(i)).checkOn(myX, myY)) {
        if (!(((monsterNode)this.nodesList.get(i)).moving)) {

          this.singleMonsterPane.setMonster((monsterNode)this.nodesList.get(i));
          print("\n"+(((monsterNode)this.nodesList.get(i))).monsterName);
          this.singleMonsterPane.show();
        }
        singleMonsterPane.setFirstTime();
      }
    }
  }

  public void noMoving() {
    for (int i=0;i<this.nodesList.size();i++) {

      (((monsterNode)this.nodesList.get(i)).moving)=false;
    }
  }

  public SingleMonsterPane getMonsterPane() {
    return singleMonsterPane;
  }
}

