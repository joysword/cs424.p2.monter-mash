import de.bezier.data.sql.*;

//--------------------------------- TEST method -----------------------------------------
/*
void setup()
 {
 rcoddio imdb=new rcoddio(this);
 String[] info={"Color", "Horror"};
 int[] id={2,3};
 ArrayList<cc_YearCountPair> array = imdb.filtersQuery("vampire",info,id);
 for (cc_YearCountPair p: array) {
 println(p.getYear()+" "+p.getCount());
 }
 println("wft?"+array.size());
 }
 */
//This class manages the database
public class cc_DatabaseManager {

  public static final String GODZILLA_REF="godzilla";
  public static final String MRHYDE_REF="mr-hyde";
  public static final String MUNTANTS_REF="mutants";
  public static final String GIANT_REF="giant";
  public static final String MUTED_CREATURES_REF="muted-creatures";
  public static final String SWAMP_REF="swamp";
  public static final String JSON_REF="jason";
  public static final String FREDDY_REF="freddy-krueger";
  public static final String MYERS_REF="michael-myers";
  public static final String INVISIBLE_REF="invisible-man";
  public static final String WITCH_WIZARD_REF="witch-wizards";
  public static final String GHOST_REF="ghost";
  public static final String POSSESSED_REF="possessed";
  public static final String DEMON_REF="demon";
  public static final String SUPERNATURAL_REF="supernatural";
  public static final String LIVING_DEAD_REF="living-dead";
  public static final String MUMMY_REF="mummy";
  public static final String FRANKENSTEIN_REF="frankenstein";
  public static final String DRACULA_REF="dracula";
  public static final String ZOMBIE_REF="zombie";
  public static final String FEMALE_VAMPIRE_REF="female_vampire";
  public static final String SNAKE_REF="snake";
  public static final String SHARK_REF="shark";
  public static final String DINOSAUR_REF="dinosaur";
  public static final String BIGFOOT_REF="bigfoot";
  public static final String VAMPIRE_REF="vampire";
  public static final String WEREWOLF_REF="werewolf";
  public static final String ALIEN_REF="alien";
  public static final String PREDATOR_REF="predator";
  public static final String PIRANHA_REF="piranha";
  public static final String ANIMAL_REF="animal";
  public static final String HUMANOIDS_REF="humanoids";
  private float[] inflation= {
    25, 25, 25, 25.64, 26.32, 27.03, 27.03, 27.78, 27.78, 27.78, 27.03, 27.03, 26.32, 26.32, 25.64, 
    26.32, 25.64, 24.39, 25, 25, 24.39, 24.39, 23.81, 23.26, 22.73, 22.73, 20.83, 17.86, 15.15, 13.33, 11.49, 12.82, 13.7, 
    13.33, 13.33, 13.16, 12.99, 13.16, 13.33, 13.33, 13.7, 15.15, 16.67, 17.54, 17.24, 16.67, 16.39, 15.87, 16.39, 16.39, 
    16.39, 15.63, 14.08, 13.33, 12.99, 12.82, 11.76, 10.31, 9.52, 9.62, 9.52, 8.85, 8.62, 8.62, 8.55, 8.55, 8.4, 8.13, 
    7.94, 7.87, 7.75, 7.69, 7.58, 7.52, 7.41, 7.3, 7.09, 6.85, 6.58, 6.25, 5.92, 5.65, 5.49, 5.15, 4.65, 4.26, 4.03, 
    3.79, 3.52, 3.15, 2.79, 2.53, 2.38, 2.3, 2.21, 2.13, 2.09, 2.02, 1.94, 1.85, 1.75, 1.68, 1.63, 1.59, 1.55, 1.5, 
    1.46, 1.43, 1.41, 1.38, 1.33, 1.3, 1.27, 1.25, 1.21, 1.17, 1.14, 1.11, 1.06, 1.07, 1.05, 1.02, 1
  };
  //-------------------------------- IMDB CLASS --------------------------------------------
  private String[] piranha_kwords= {
    "piranha", "piranha-pool", "piranha-attack", "red-bellied-piranha"
  };
  private String[] vampire_kwords= {
    "vampire", "vampire-slayer", "vampire-hunter", "vampire-bat", "vampire-bite", 
    "vampire-human-love", "vampire-vs-vampire", "chinese-vampire", "child-vampire", "vampire-human-relationship", 
    "master-vampire", "vampire-sex", "vampire-cult", "vampire-driving-a-car", "bisexual-vampire", "vampire-versus-werewolf", 
    "vampire-girl", "space-vampire", "bitten-by-a-vampire", "ancient-vampire", "gay-vampire", "vampire-staked", "sex-vampire", 
    "vampire-teeth", "erotic-vampire", "male-vampire", "vampire-cop", "taoist-vampire", "turning-into-a-vampire", 
    "vampire-spoof", "vampire-cowboy", "vampire-blood", "fang-free-vampire", "vampire-driving-car", "vampire-family", 
    "pregnant-vampire", "vampire-legend", "vampire-doctor", "vampire-in-coma", "vampire-kill", "death-of-vampire", "vampire-nation"
      , "vampire-bar", "experimenting-on-a-vampire", "noble-vampire", "suicidal-vampire", "vampire-army", 
    "vampire-experiment", "vampire-soldier", "world-of-vampires", "zombie-cannibal-vampire-pirate-queen", "psychic-vampire", "nazi-vampire", "strong-vampire", "swedish-vampire", "vampire-suit", 
    "vampire-couple", "vampire-hunt", "vampire-maker", "reference-to-buffy-the-vampire-slayer", "teenage-vampire", "half-vampire", 
    "vampire-band", "vampire-killed-by-daylight", "vampire-queen", "vampire-detective", "energy-vampire", 
    "flying-vampire", "newborn-vampire", "blood-drained-by-vampires"
  };

  private String[] female_vampire_kwords= {
    "female-vampire", "vampire_girl", "vampire_queen", "vampire-woman","lesbian-vampire"
  };

  private String[] dracula_kwords= {
    "dracula"
  };

  private String[] zombie_kwords= {
    "zombie", "flesh-eating-zombie", "zombie-violence", "zombie-attack", "zombie-survival", "zombie-child", 
    "flesh-eating-zombies", "zombie-spoof", "zombification", "nazi-zombie", "zombie-love", "zombie-hunter", "zombie-bite", "sex-with-a-zombie", 
    "zombie-sexuality", "zombie-parody", "zombie-with-gun", "zombie-slave", "zombie-apocalypse", "human-eaten-by-zombies", "zombie-baby", 
    "zombie-soldiers", "zombie-master", "zombie-walk", "lesbian-zombie", "zombie-horse", "zombie-clown", "underwater-nazi-zombie", 
    "zombie-survival-guide", "zombie-outbreak", "gay-zombie", "zombie-uprising", "zombie-jesus", "smart-zombies", "marine-zombie", 
    "alien-zombie", "reference-to-zombies", "man-made-zombie", "zombie-bride", "zombie-groom", "zombie-like-trance", "zombie-showgirl", 
    "kung-fu-zombie", "zombie-nun", "the-zombie-walk", "zombie-plan", "zombie-video", "zombie-walk-2011", "zombie-walk-2012", 
    "zombie-walk-long-beach", "zombie-walk-pittsburgh", "zombies-movie", "zombie-cannibal-vampire-pirate-queen", "old-lady-zombie", 
    "russian-zombie-movie", "animated-zombie-horror", "chained-zombie", "exploding-zombie", "zombie-city", "running-zombie", 
    "nerdy-zombie", "bitten-by-a-zombie", "child-zombie", "shark-attacked-by-a-zombie", "shark-bitten-by-a-zombie"
  };

  private String[] frankenstein_kwords= {
    "frankenstein", "frankenstein's-monster", "doctor-frankenstein", "frankenstein-legend", "frankenstein-baby"
  };
  private String[] mummy_kwords= {
    "mummy"
  };

  private String[] living_dead_kwords= {
    "undead", "back-from-the-dead", "dead-woman-with-eyes-open", "living-dead", 
    "walking-dead", "evil-dead"
  };

  private String[] supernatural= {
    "supernatural-horror", "supernatural-being", "supernatural-murderer", "supernatural-creature"
  };
  private String[] demon_kwords= {
    "demon", "demonic-possession", "demon-hunter", "demoness", "demon-rape", "demonic", "demon-spawn", "inner-demon", 
    "female-demon", "demonic-spirit", "impregnated-by-demon", "horned-demon", "balan-the-demon", 
    "shadow-demon", "demon-lady", "impish-demon", "rogue-demon-hunter", "giant-demon"
  };

  private String[] possessed_kwords= {
    "possessed-human", "possessed-girl", "possessed-animal", "possessed-by-evil-spirit", "possessed-soul", "possessed-boy", "possessed-house", 
    "possessed-car"
  };

  private String[] ghost_kwords= {
    "ghost", "ghost-girl", "ghost-child", "vengeful-ghost", "ghost-writer", "ghost-ship", "ghost-in-mirror", "ghost-hunter", "sex-with-ghost", 
    "ghost-in-the-shell", "female-ghost", "ghost-boy", "ghosts", "ghost-house-underground", "ghostbuster", "ghostbusters", "ghost-hunting", "male-ghost", 
    "seeing-ghosts", "ghost-train", "ghost-of-mother", "talking-to-a-ghost", "seeing-a-ghost", "ghost-of-father", "ghost-dog", "ghost-of-wife", 
    "scared-ghost", "ghost-riding", "ghost-rider", "ghost-in-a-mirror", "child-ghost", "mistaken-for-ghost", "menacing-ghost", "ghost-of-baby", 
    "disguised-as-a-ghost", "killed-by-ghost", "ghost-on-video", "invisible-daylight-ghosts", "playful-ghost", "sexy-ghost", "holy-ghost", 
    "ghost-human-relationship", "baby-ghost", "ghost-cage", "ghosts-japan", "tiger-ghost", "ghost-of-covered-up-murder-victim", "ghost-in-elevator", 
    "ghost-against-ghost", "ghost-of-ancestor", "bull-ghost", "friendly-ghost", "ghost-tour", "monkey-ghost", "boy-ghost", "headless-ghost-knight", 
    "ghost-of-grandfather", "ghostbusting", "haunted-by-a-ghost", "mistaken-for-a-ghost", "ghost-as-friend", "ghost-ranch-new-mexico", "silver-ghost", 
    "ghost-investigators", "former-ghostbuster", "ghost-car", "ghost-in-the-machine", "ghost-sickness"
  };

  private String[] witch_wizards_kwords= {
    "wizard", "evil-wizard", "wizard-of-oz", "wizards'-duel", "magician", "stage-magician", "merlin-the-magician", "evil-magician", "mad-magician", 
    "black-magician", "female-magician", "white-magician", "mysto-the-magician", "magician-hero", "sorcerer", "evil-sorcerer", 
    "gilbert-and-sullivan's-the-sorcerer", "simon-the-sorcerer", "witch", "witch-doctor", "evil-witch", "wicked-witch", "honey-halfwitch", 
    "sea-witch", "witches-horror", "bell-witch", "flying-witch", "blair-witch", "salem-witch-hunt", "witch's-revenge", "preteenage-witch", 
    "witches-sabbath"
  };

  private String[] invisible_man_kwords= {
    "invisible-man", "invisible-being", "invisible-woman", "invisible-being-makes-fotoprint", "invisible-creature", "invisible-girl", 
    "invisible-companion"
  };

  private String[] michael_myers_kwords= {
    "michael-myers"
  };

  private String[] freddy_krueger_kwords= {
    "freddy-krueger"
  };

  private String[] swamp_kwords= {
    "swamp-thing", "swamp-monster", "swamp-beast", "swamp-creature"
  };

  private String[] jason_kwords= {
    "jason-voorhees"
  };

  private String[] godzilla_kwords= {
    "godzilla", "mechagodzilla"
  };

  private String[] muted_creatures_kwords= {
    "teenage-mutant-ninja-turtles", "mutant-animal", "mutant-creature", "mutant-dog", "genetic-mutant", 
    "mutant-reptile", "mutant-amphibian", "bitten-by-a-mutant", "mutant-spider", "mutant-baboon", 
    "mutant-registration-act", "mutant-plant", "strategically-altered-mutant", "os-mutantes", "giant-mutant-koala-bear", 
    "mutant-lizard", "liver-eating-mutant"
  };

  private String[] giant_kwords= {
    "giant-monster", "giant-animal", "giant-insect", "giant-spider", "giant-snake", "giant-squid", "giant-bird", "giant-lizard", "giant-cat", 
    "giant-octopus", "giant-worm", "giant-crab", "giant-crocodile", "giant-rat", "giant-creature", "giant-dog", "giant-fish", "giant-chicken", 
    "giant-bug", "giant-invertebrate", "giant-bat", "giant-lobster", "giant-scorpion", "giant-frog", "giant-insect-larva", "giant-insect-egg", 
    "giant-lollipop", "giant-condor", "giant-bee", "giant-mouse", "giant-centipede", "giant-mosquito", "giant-snail", "giant-rabbit", "giant-web"
  };

  private String[] werewolf_kwords= {
    "werewolf", "female-werewolf", "werewolf-bite", "vampire-versus-werewolf", "werewolf-transformation", 
    "werewolf-family", "killed-by-a-werewolf", "werewolf-killer", "teenage-werewolf", 
    "scratched-by-werewolf", "werewolf-doll", "werewolf-shot", "werewolf-pack-leader", "bitten-by-a-werewolf", 
    "alpha-werewolf", "werewolf-human-relationship", "male-werewolf"
  };


  private String[] mutants_kwords= {
    "mutant", "mutant-baby", "mutant-human", "mutant-woman", "woman-mutant",
  };
  private String[] mr_hyde_kwords= {
    "jekyll-and-hyde"
  };

  private String[] snake_kwords= {
    "snake"
  };

  private String[] shark_kwords= {
    "shark"
  };

  private String[] alien_kwords= {
    "alien" ,"alien-invasion" ,"alien-abduction" ,"alien-contact" ,"illegal-alien" ,"alien-technology" ,"60alien-race" ,"human-alien" ,"alien-planet","half-alien" ,"alien-creature" ,"alien-attack" ,"alien-possession" ,"alien-civilization" ,"alien-species" ,"space-alien" ,"sex-with-alien" ,"alien-girl" ,"baby-alien" ,"alien-life-form" ,"20alien-love" ,"human-versus-alien" ,"shape-shifting-alien" ,"alien-spoof" ,"alien-monster" ,"alien-baby" ,"female-alien" ,"alien-dna" ,"modular-transforming-alien-battle-fortress" ,"alien-as-woman" ,"alien-creature-as-pet" ,"alien-smuggler","10alien-hunter" ,"10sex-with-an-alien-woman" ,"alien-hunt" ,"alien-sex" ,"human-alien-relationship" ,"alien-slave" ,"alien-disguised-as-human" ,"alien-assasin" ,"alien-ruling-earth" ,"alien-fugitive" ,"alien-breeding" ,"alien-friendship" ,"friendly-alien" ,"human-alien-sexual-relations" ,"alien-conspiracy" ,"alien-intrusion" ,"alien-parasite" ,"gay-alien" ,"human-body-alien-host" ,"nude-female-alien" ,"human-body-as-an-alien-host" ,"alien-world" ,"alien-weapons" ,"alien-rape" ,"alien-reproduction" ,"alien-infection" ,"alien-narrator" ,"alien-child" ,"alien-impostor" ,"enemy-alien" ,"alien-suit" ,"alien-robot" ,"killing-an-alien" ,"human-needed-to-save-alien-planet" ,"mistaken-for-alien" ,"alien-encounter" ,"human-taken-to-an-alien-planet" ,"alien-clone" ,"alien-plant" ,"alien-device" ,"alien-pods" ,"alien-spouse" ,"alien-implant" ,"alien-pod" ,"alien-food" ,"alien-versus-alien" ,"alien-blood" ,"resident-alien" ,"alien-zombie" ,"alien-bird" ,"alien-equipment" ,"alien-infestation" ,"one-eyed-alien" ,"alien-animal" ,"alien-boy" ,"alien-bodies" ,"alien-weapon" ,"alien-wife" ,"alien-communication" ,"attacked-by-an-alien" ,"alien-puzzle" ,"alien-body" ,"alien-judge" ,"sex-with-alien-woman"  ,"alien-theorists" ,"alien-insect" ,"alien-driving-car" ,"crying-alien" ,"alien-detective" ,"alien-being" ,"young-alien" ,"killed-by-aliens" ,"alien-invasion-vanguard" ,"alien-autopsy" ,"searching-for-alien-life-form" ,"alien-royalty" ,"scientist-doesn't-want-alien-killed" ,"alien-monkey" ,"experiments-on-aliens" ,"undesirable-alien" ,"alien-transmission" ,"alien-soldiers" ,"3-eyed-alien" ,"human-needed-to-save-an-alien-planet" ,"captured-by-aliens"
  };

  private String[] dinosaur_kwords={
    "dinosaur" ,"dinosaur-as-dog" ,"cartoon-dinosaur" ,"anthropomorphic-dinosaur" ,"dinosaur-skeleton" ,"live-dinosaur" ,"dinosaur-egg" ,"toy-dinosaur" ,"dinosaur-fossil" ,"dinosaur-bone" ,"baby-dinosaur" ,"dinosaur-attack" ,"dinosaur-costume" ,"pet-dinosaur" ,"dinosaur-foot-print" ,"lizards-used-as-dinosaurs" ,"dinosaur-hunting" ,"collapse-of-dinosaur-skeleton" ,"dinosaur-herd" ,"barney-the-dinosaur" ,"dinosaur-statue" ,"danny-dinosaur" ,"dinosaur-exhibition" ,"fight-between-dinosaurs" ,"dinoshark" ,"dinosaur-mask" ,"juvenile-dinosaur" ,"dinosaur-family"  ,"dinosaur-extinction"
  };

  private String[] predator_kwords={
    "predatorial-horror"
  };

  private String[] humanoids_kwords={
    "wizard", "invisible-man","evil-wizard", "wizard-of-oz"
  };

  private String[] animal_kwords={
    "snake","shark","dinosaur","piranha"
  };




  MySQL msql;
  PApplet context;

////VARIABLES ENDS HERE

  public cc_DatabaseManager(PApplet context) {
    this.context=context;
    String user     = "root";
    String pass     = "root";
    String database = "cs424imdb2";
    msql = new MySQL( context, "localhost", database, user, pass );
  }

  //test
  public void queryTest()
  {
    if ( msql.connect() )
    {
      msql.query( "SELECT * FROM title LIMIT 5" );
      msql.next();
      println( "number of rows: " + msql.getString(2) );
      msql.next();
      println( "number of rows: " + msql.getString(2) );
    }
    else
    {
    }
  }

//GIORGIO's METHOD
  private String getPureKeywords(String keyword) {
    String keyword_list="";
    if (keyword.equals(VAMPIRE_REF)) {
      for (int i=0;i<4;i++)
      if(vampire_kwords.length>i)
        keyword_list=keyword_list+vampire_kwords[i]+"\n";
    }
    else if (keyword.equals(FEMALE_VAMPIRE_REF)) {
      for (int i=0;i<4;i++)
       if(female_vampire_kwords.length>i)
        keyword_list=keyword_list+female_vampire_kwords[i]+"\n";
    }
    else if (keyword.equals(ZOMBIE_REF)) {
      for (int i=0;i<4;i++)
        if(zombie_kwords.length>i)
        keyword_list=keyword_list+zombie_kwords[i]+"\n";
    }
    else if (keyword.equals(DRACULA_REF)) {
      for (int i=0;i<4 && i<dracula_kwords.length;i++)
       if(dracula_kwords.length>i)
        keyword_list=keyword_list+dracula_kwords[i]+"\n";
    }
    else if (keyword.equals(FRANKENSTEIN_REF)) {
      for (int i=0;i<4;i++)
       if(frankenstein_kwords.length>i)
        keyword_list=keyword_list+frankenstein_kwords[i]+"\n";
    }
    else if (keyword.equals(MUMMY_REF)) {
      for (int i=0;i<4 && i<mummy_kwords.length;i++)
      if(mummy_kwords.length>i)
        keyword_list=keyword_list+mummy_kwords[i]+"\n";
    }
        else if (keyword.equals(LIVING_DEAD_REF)) {
      for (int i=0;i<4;i++)
       if(living_dead_kwords.length>i)
        keyword_list=keyword_list+living_dead_kwords[i]+"\n";
    }
        else if (keyword.equals(SUPERNATURAL_REF)) {
      for (int i=0;i<4;i++)
       if(supernatural.length>i)
        keyword_list=keyword_list+supernatural[i]+"\n";
    }
        else if (keyword.equals(DEMON_REF)) {
      for (int i=0;i<4;i++)
      if(demon_kwords.length>i)
        keyword_list=keyword_list+demon_kwords[i]+"\n";
    }
        else if (keyword.equals(POSSESSED_REF)) {
      for (int i=0;i<4;i++)
       if(possessed_kwords.length>i)
        keyword_list=keyword_list+possessed_kwords[i]+"\n";
    }
            else if (keyword.equals(GHOST_REF)) {
      for (int i=0;i<4;i++)
      if(ghost_kwords.length>i)
        keyword_list=keyword_list+ghost_kwords[i]+"\n";
    }
        else if (keyword.equals(WITCH_WIZARD_REF)) {
      for (int i=0;i<4;i++)
      if(witch_wizards_kwords.length>i)
        keyword_list=keyword_list+witch_wizards_kwords[i]+"\n";
    }
        else if (keyword.equals(INVISIBLE_REF)) {
      for (int i=0;i<4;i++)
      if(invisible_man_kwords.length>i)
        keyword_list=keyword_list+invisible_man_kwords[i]+"\n";
    }
            else if (keyword.equals(MYERS_REF)) {
      for (int i=0;i<4;i++)
       if(michael_myers_kwords.length>i)
        keyword_list=keyword_list+michael_myers_kwords[i]+"\n";
    }
            else if (keyword.equals(FREDDY_REF)) {
      for (int i=0;i<4 && i<freddy_krueger_kwords.length;i++)
      if(freddy_krueger_kwords.length>i)
        keyword_list=keyword_list+freddy_krueger_kwords[i]+"\n";
    }
                else if (keyword.equals(JSON_REF)) {
      for (int i=0;i<4 && i<jason_kwords.length;i++)
        if(jason_kwords.length>i)
        keyword_list=keyword_list+jason_kwords[i]+"\n";
    }
                else if (keyword.equals(SWAMP_REF)) {
      for (int i=0;i<4;i++)
      if(swamp_kwords.length>i)
        keyword_list=keyword_list+swamp_kwords[i]+"\n";
    }
                else if (keyword.equals(MUTED_CREATURES_REF)) {
      for (int i=0;i<4;i++)
       if(muted_creatures_kwords.length>i)
        keyword_list=keyword_list+muted_creatures_kwords[i]+"\n";
    }                else if (keyword.equals(GIANT_REF)) {
      for (int i=0;i<4;i++)
      if(giant_kwords.length>i)
        keyword_list=keyword_list+giant_kwords[i]+"\n";
    }                else if (keyword.equals(MUNTANTS_REF)) {
      for (int i=0;i<4;i++)
        if(mutants_kwords.length>i)
        keyword_list=keyword_list+mutants_kwords[i]+"\n";
    } else if (keyword.equals(MRHYDE_REF)) {
      for (int i=0;i<4;i++)
      if(mr_hyde_kwords.length>i)
        keyword_list=keyword_list+mr_hyde_kwords[i]+"\n";
    }                else if (keyword.equals(GODZILLA_REF)) {
      for (int i=0;i<4 && i<godzilla_kwords.length;i++)
      if(godzilla_kwords.length>i)
        keyword_list=keyword_list+godzilla_kwords[i]+"\n";
    } else if (keyword.equals(SHARK_REF)) {
      for (int i=0;i<4 && i<shark_kwords.length;i++)
      if(shark_kwords.length>i)
        keyword_list=keyword_list+shark_kwords[i]+"\n";
    } else if (keyword.equals(SNAKE_REF)) {
      for (int i=0;i<4 && i<snake_kwords.length;i++)
      if(snake_kwords.length>i)
        keyword_list=keyword_list+snake_kwords[i]+"\n";
    } else if (keyword.equals(ALIEN_REF)) {
      for (int i=0;i<4 && i<alien_kwords.length;i++)
      if(alien_kwords.length>i)
        keyword_list=keyword_list+alien_kwords[i]+"\n";
    }else if (keyword.equals(DINOSAUR_REF)) {
      for (int i=0;i<4 && i<dinosaur_kwords.length;i++)
      if(alien_kwords.length>i)
        keyword_list=keyword_list+dinosaur_kwords[i]+"\n";
    }else if (keyword.equals(PREDATOR_REF)) {
      for (int i=0;i<4 && i<dinosaur_kwords.length;i++)
      if(predator_kwords.length>i)
        keyword_list=keyword_list+predator_kwords[i]+"\n";
    }else if (keyword.equals(PIRANHA_REF)) {
      for (int i=0;i<4 && i<piranha_kwords.length;i++)
      if(piranha_kwords.length>i)
        keyword_list=keyword_list+piranha_kwords[i]+"\n";
    }else if (keyword.equals(WEREWOLF_REF)) {
      for (int i=0;i<4 && i<werewolf_kwords.length;i++)
      if(werewolf_kwords.length>i)
        keyword_list=keyword_list+werewolf_kwords[i]+"\n";
    }else if (keyword.equals(HUMANOIDS_REF)) {
      for (int i=0;i<4 && i<humanoids_kwords.length;i++)
      if(humanoids_kwords.length>i)
        keyword_list=keyword_list+humanoids_kwords[i]+"\n";
    }else if (keyword.equals(ANIMAL_REF)) {
      for (int i=0;i<4 && i<animal_kwords.length;i++)
      if(animal_kwords.length>i)
        keyword_list=keyword_list+animal_kwords[i]+"\n";
    }


       
    if(keyword_list.length()<2) return "";
    keyword_list=keyword_list.substring(0, keyword_list.length()-1);
    
    return keyword_list;
  }

  //------------------------- USE THIS METHOD TO COUNT OVERALL NUMBER OF FILMS PER YEAR --------------------------------
  //returns ArrayList<cc_cc_YearCountPair> containing a list of pairs films-count , year
  public ArrayList<cc_YearCountPair> getFilmsPerYear() {
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      msql.query( "SELECT production_year,COUNT( * ) "+
        "FROM title "+
        "GROUP BY production_year" );
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }
  /*
  // private method to put the query into an arraylist
   private ArrayList<cc_YearCountPair> createArrayFromQuery(ArrayList<cc_YearCountPair> array, MySQL msql) {
   msql.next();
   for(int i=1890;i<=2012;i++){
   println(msql.getInt(1));
   if(msql.getInt(1)==i){
   array.add(new cc_YearCountPair(msql.getFloat(2), msql.getInt(1)));
   msql.next();
   }
   else
   array.add(new cc_YearCountPair(0.0));
   }
   return array;
   }
   */
  private ArrayList<cc_YearCountPair> createArrayFromQuery(ArrayList<cc_YearCountPair> array, MySQL msql) {
    int old=1890;
    int i=0;
    if(msql==null) return array;
    while(msql.next()) {
      i=1;
      while (msql.getInt(1)>old) {
        array.add(new cc_YearCountPair(0.0, old));
        old++;
      }
      print(msql.getFloat(1)+" "+msql.getFloat(2));
      array.add(new cc_YearCountPair(msql.getFloat(2), msql.getInt(1)));
      old++;
    }
  
    return array;
  } 
  
    private ArrayList<StringCountPair> createArrayFromQueryGenre(ArrayList<StringCountPair> array, MySQL msql) {
      while(msql.next ())
      {
         array.add(new StringCountPair(msql.getFloat(2),msql.getString(1))); 
      }
      return array;
  } 


  //------------------------- USE THIS METHOD TO COUNT FILM WITH A GIVEN KEYWORD PER YEAR --------------------------------
  // Method to retrieve a list of pairs year-count containing the number of films related to the searched keyword
  public ArrayList<cc_YearCountPair> getK(String keyword) { 
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      msql.query("select "+
        " t.production_year, count(t.id) "+
        " from "+
        " keyword as k "+
        " left join "+
        "   movie_keyword as mk ON k.id = mk.keyword_id "+
        " left join "+
        "   title as t ON t.id = mk.movie_id "+
        " where "+
        " k.keyword like \"%"+keyword+"%\""+
        " group by t.production_year "+
        " order by t.production_year");
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }

  //General query, returns years/count given keyword and info (for info check info.pdf)
  public ArrayList<cc_YearCountPair> getKI(String keyword, String info, int info_type) {
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      msql.query(
      "select t.production_year, count(t.id) "+
        "from keyword as k "+
        "  left join "+
        "movie_keyword as mk ON k.id = mk.keyword_id "+
        "  left join "+
        "title as t ON t.id = mk.movie_id "+
        "  left join "+
        "movie_info as mi ON t.id=mi.movie_id "+

        "where "+
        "mi.info='"+info+"' and"+
        "mi.info_type_id ="+info_type+" and"+
        " k.keyword like \"%"+keyword+"%\""+
        " group by t.production_year "+
        "order by t.production_year ");
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }

  // returns the popularity of the movies with the selected keyword
  public ArrayList<cc_YearCountPair> getPopularity(String keyword) {
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="select t.production_year, count(t.id) "+
        "from keyword as k "+
        "  left join "+
        "movie_keyword as mk ON k.id = mk.keyword_id "+
        "  left join "+
        "title as t ON t.id = mk.movie_id "+
        "  left join "+
        "movie_info as mi ON t.id=mi.movie_id "+
        " where "+ "("+
        getKeywords(keyword)+
        ") group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }

  //get film numbers given keyword
  public ArrayList<cc_YearCountPair> getFilmNumber(String keyword) {
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="select "+
        "year,sum(count) "+
        "from "+
        "quality_count "+
        "where monster=\""+keyword+"\""+
        " and year>=1890 and year<=2012 "+
        " group by year "+
        "order by year ";
        println(query);
      msql.query(query);
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }

  //get film numbers given keyword and info (for instance search 'vampires' in 'horror' films)
  public ArrayList<cc_YearCountPair> getFilmNumber(String keyword, String info, int info_type_id) {
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="select t.production_year, count(t.id) "+
        "from keyword as k "+
        "  left join "+ 
        "movie_keyword as mk ON k.id = mk.keyword_id "+
        "  left join "+
        "title as t ON t.id = mk.movie_id "+
        "  left join "+
        "movie_info as mi ON t.id=mi.movie_id "+
        " where "+ 
        " mi.info='"+info+"' and"+
        " mi.info_type_id="+info_type_id+" and"+
        "("+
        getKeywords(keyword)+
        ") group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }

  public ArrayList<cc_YearCountPair> getPopularityAnimal(String keyword) {
    String info="Horror";
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="select t.production_year, count(t.id) "+
        "from keyword as k "+
        "  left join "+ 
        "movie_keyword as mk ON k.id = mk.keyword_id "+
        "  left join "+
        "title as t ON t.id = mk.movie_id "+
        "  left join "+
        "movie_info as mi ON t.id=mi.movie_id "+
        " where "+ 
        " mi.info='"+info+"' and"+
        " mi.info_type_id="+info_type_id+" and"+
        "("+
        getKeywords(keyword)+
        ") "+
        "and"+
        " mi.info_type_id=3 and mi.info='horror'"+
        " group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }



  public ArrayList<cc_YearCountPair> getFilmNumberAnimal(String keyword) {
    String info="Horror";
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="select t.production_year, count(t.id) "+
        "from keyword as k "+
        "  left join "+ 
        "movie_keyword as mk ON k.id = mk.keyword_id "+
        "  left join "+
        "title as t ON t.id = mk.movie_id "+
        "  left join "+
        "movie_info as mi ON t.id=mi.movie_id "+
        " where "+ 
        " mi.info='"+info+"' and"+
        " mi.info_type_id="+info_type_id+" and"+
        "("+
        getKeywords(keyword)+
        ") "+
        "and"+
        " mi.info_type_id=3 and mi.info='horror' "+
        "group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }

  public ArrayList<cc_YearCountPair> getFilmNumberTotal(String keyword) {
    String info="Horror";
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="select t.production_year, count(t.id) "+
        "from keyword as k "+
        "  left join "+ 
        "movie_keyword as mk ON k.id = mk.keyword_id "+
        "  left join "+
        "title as t ON t.id = mk.movie_id "+
        "  left join "+
        "movie_info as mi ON t.id=mi.movie_id "+
        " where "+ 
        " mi.info='"+info+"' and"+
        " mi.info_type_id="+info_type_id+" and"+
        "("+
        getKeywords(keyword)+
        ") "+
        "and"+
        " mi.info_type_id=3 and mi.info='horror'"+
        " group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }


  public ArrayList<cc_YearCountPair> getFormatMovie(String keyword, String[] genres) {
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT t.production_year,count(t.id) "+
        "from keyword k "+
        "left join movie_keyword mk on k.id=mk.keyword_id "+
        "left join title t on t.id=mk.movie_id "+
        "left join movie_info mi on t.id=mi.movie_id "+
        "where t.kind_id=1 and "+
        "("+
        getKeywords(keyword)+
        ") "+
        "and mi.info_type_id=1 and "+
        getGenres(genres)+
        "group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);

    }
    else {
    }
    return array;
  }

  public ArrayList<cc_YearCountPair> getFormatTvMovie(String keyword, String[] genres) {
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT t.production_year,count(t.id) "+
        "from keyword k "+
        "left join movie_keyword mk on k.id=mk.keyword_id "+
        "left join title t on t.id=mk.movie_id "+
        "left join movie_info mi on t.id=mi.movie_id "+
        "+where t.kind_id=3 and "+
        "("+
        getKeywordsSuper(keyword)+
        ") "+
        "and mi.info_type_id=3 and "+
        getGenres(genres)+
        "group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);

    }
    else {
    }
    return array;
  }

  public ArrayList<cc_YearCountPair> getFormatVideoMovie(String keyword, String[] genres) {
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT t.production_year, count(t.id) "+
        "from keyword k "+
        "left join movie_keyword mk on k.id=mk.keyword_id "+
        "left join title t on t.id=mk.movie_id "+
        "left join movie_info mi on t.id=mi.movie_id "+
        "where t.kind_id=4 and "+
        "("+
        getKeywordsSuper(keyword)+
        ") "+
        "and mi.info_type_id=3 and "+
        getGenres(genres)+
        "group by t.production_year "+
        "order by t.production_year ";
      msql.query(query);
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }

  public ArrayList<cc_YearCountPair> getQualityHigh(String keyword, String[] genres) {
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT t.production_year,count(t.id) "+
        "from keyword k "+
        "left join movie_keyword mk on mk.keyword_id=k.id "+
        "left join title t on t.id=mk.movie_id "+
        "left join movie_info mi on mi.id=t.id "+
        "where "+
                "("+
        getKeywordsSuper(keyword)+
        ") "+
        "and (not mi.info_type_id=101 or ( mi.info=8.0 or mi.info=8.1 or mi.info=8.2 or mi.info=8.3 or mi.info=8.4 or mi.info=8.5 or mi.info=8.6 or mi.info=8.7 or mi.info=8.8 or mi.info=8.9 or mi.info=9.0 or mi.info=9.1 or mi.info=9.2 or mi.info=9.3 or mi.info=9.4 or mi.info=9.5 or mi.info=9.6 or mi.info=9.7 or mi.info=9.8 or mi.info=9.9 or mi.info=10.0)) "+
        "and (not mi.info_type_id=3 or ("+
        getGenres(genres)+
        ")) "+
        "group by t.production_year "+
        "order by t.production_year ";
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }
  
  public ArrayList<cc_YearCountPair> getQualityMed(String keyword, String[] genres) {
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT t.production_year,count(t.id) "+
        "from keyword k "+
        "left join movie_keyword mk on mk.keyword_id=k.id "+
        "left join title t on t.id=mk.movie_id "+
        "left join movie_info mi on mi.id=t.id "+
        "where "+
                "("+
        getKeywordsSuper(keyword)+
        ") "+
        "and (not mi.info_type_id=101 or (mi.info=5.0 or mi.info=5.1 or mi.info=5.2 or mi.info=5.3 or mi.info=5.4 or mi.info=5.5 or mi.info=5.6 or mi.info=5.7 or mi.info=5.8 or mi.info=5.9 or mi.info=6.0 or mi.info=6.1 or mi.info=6.2 or mi.info=6.3 or mi.info=6.4 or mi.info=6.5 or mi.info=6.6 or mi.info=6.7 or mi.info=6.8 or mi.info=6.9 mi.info=7.0 or mi.info=7.1 or mi.info=7.2 or mi.info=7.3 or mi.info=7.4 or mi.info=7.5 or mi.info=7.6 or mi.info=7.7 or mi.info=7.8 or mi.info=7.9 )) "+
        "and (not mi.info_type_id=3 or ("+
        getGenres(genres)+
        ")) "+
        "group by t.production_year "+
        "order by t.production_year ";
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }
  
    public ArrayList<cc_YearCountPair> getQualityLow(String keyword, String[] genres) {
    int info_type_id=3;
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT t.production_year,count(t.id) "+
        "from keyword k "+
        "left join movie_keyword mk on mk.keyword_id=k.id "+
        "left join title t on t.id=mk.movie_id "+
        "left join movie_info mi on mi.id=t.id "+
        "where "+
                "("+
        getKeywordsSuper(keyword)+
        ") "+
        "and (not mi.info_type_id=101 or ( mi.info=1.0 or mi.info=1.1 or mi.info=1.2 or mi.info=1.3 or mi.info=1.4 or mi.info=1.5 or mi.info=1.6 or mi.info=1.7 or mi.info=1.8 or mi.info=1.9 or mi.info= or mi.info=2.0 or mi.info=2.1 or mi.info=2.2 or mi.info=2.3 or mi.info=2.4 or mi.info=2.5 or mi.info=2.6 or mi.info=2.7 or mi.info=2.8 or mi.info=2.9 or mi.info=3.0 or mi.info=3.1 or mi.info=3.2 or mi.info=3.3 or mi.info=3.4 or mi.info=3.5 or mi.info=3.6 or mi.info=3.7 or mi.info=3.8 or mi.info=3.9 or mi.info=4.0 or mi.info=4.1 or mi.info=4.2 or mi.info=4.3 or mi.info=4.4 or mi.info=4.5 or mi.info=4.6 or mi.info=4.7 or mi.info=4.8 or mi.info=4.9)) "+
        "and (not mi.info_type_id=3 or ("+
        getGenres(genres)+
        ")) "+
        "group by t.production_year "+
        "order by t.production_year ";
      array=createArrayFromQuery(array, msql);
    }
    else {
    }
    return array;
  }




  public ArrayList<cc_YearCountPair> filtersQuery(String keyword, String[] info, int[] info_type_id) {
    ArrayList<cc_YearCountPair> array = new ArrayList<cc_YearCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT t.production_year,count(t.id) "+
        "FROM title t left join movie_info mi on t.id=mi.movie_id "+
        "left join movie_keyword mk on t.id=mk.movie_id "+
        "left join keyword k on k.id=mk.keyword_id "+
        "WHERE "+
        getKeywordsSuper(keyword)+
        " and"+ 
        "("+
        getInfo(info, info_type_id)+
        ") group by t.production_year order by t.production_year";
      println(query);
      msql.query(query);
      array=createArrayFromQuery(array, msql);

    }
    else {
    }
    return array;
  }

public ArrayList<StringCountPair> getFilmList(String input) {
    ArrayList<StringCountPair> array = new ArrayList<StringCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT distinct title, id from title where title like \"%"+input+"%\" limit 3";
      print(query);
      msql.query(query);
      array=createArrayFromQueryGenre(array, msql);
    }
    else {
    }
    return array;
  }


public ArrayList<StringCountPair> getGenresTOP5(String keyword) {
    ArrayList<StringCountPair> array = new ArrayList<StringCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT genre, SUM( count ) FROM quality_count WHERE monster =  \""+
                   keyword+"\" GROUP BY genre ORDER BY SUM( count ) DESC  LIMIT 5";
      print(query);
      msql.query(query);
      array=createArrayFromQueryGenre(array, msql);
    }

    else {
    }
    return array;
  }

public ArrayList<StringCountPair> getMonsterTOP10(int min,int max) {
    ArrayList<StringCountPair> array = new ArrayList<StringCountPair>();
    if ( msql.connect() )
    {
      String query="SELECT distinct monster, SUM( count ) FROM quality_count WHERE year>="+min+" and"+
      " year<"+max+" group by monster ORDER BY SUM( count ) DESC  LIMIT 10";
      print(query);
      msql.query(query);
      array=createArrayFromQueryGenre(array, msql);
      printArray(array);
    }

    else {
    }
    return array;
  }
  
public void printArray(ArrayList<StringCountPair> array){
  println("MANNAGGIAACCRISTO");
  for (StringCountPair p: array) {
 println(p.getString()+" "+p.getCount());
 } 
}

private void initArray(ArrayList<Instance> array){
  for(int i=0;i<123;i++){
   array.add(new Instance(1890+i)); 
  }
}
/*
private void initArrayCert(ArrayList<CertificateInstance> array){
  for(int i=0;i<123;i++){
   array.add(new CertificateInstance(1890+i,0,0,0,0,0,0,0)); 
  }
}

private void initArrayCountry(ArrayList<CountryInstance> array){
  for(int i=0;i<123;i++){
   array.add(new CountryInstance(1890+i,0,0,0,0,0,0,0)); 
  }
}
*/
private void add(int i,ArrayList<Instance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).set(i,count);
  }
}
/*
private void addUSA(ArrayList<CountryInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setUSA(count);
  }
}
private void addUK(ArrayList<CountryInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setUK(count);
  }
}
private void addFrance(ArrayList<CountryInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setFrance(count);
  }
}
private void addJapan(ArrayList<CountryInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setJapan(count);
  }
}
private void addGermany(ArrayList<CountryInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setGermany(count);
  }
}
private void addCanada(ArrayList<CountryInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setCanada(count);
  }
}
private void addOthers(ArrayList<CountryInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setOthers(count);
  }
}

private void addLow(ArrayList<FormatInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
    if(year>1889)
    array.get(year-1890).setLow(count);
  }
}

private void addMed(ArrayList<FormatInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setMed(count);
  }
}

private void addHigh(ArrayList<FormatInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setHigh(count);
  }
}

*/
public ArrayList<Instance> getFormat(String genre, String monster){
    ArrayList<Instance> array = new ArrayList<Instance>();
    initArray(array);
            if(!genre.equals(""))
          genre=" genre=\""+genre+"\" and";
    if ( msql.connect() )
    {
      String query1=   
      "SELECT year,sum(count) "+
      "from format_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=1 "+
      "group by year "+
      "order by year";
      println(query1);
      msql.query(query1);
      add(0,array,msql);
      String query2=   
         "SELECT year,sum(count) "+
      "from format_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=3 "+
      "group by year "+
      "order by year";
      msql.query(query2);
      add(1,array,msql);
       String query3=   
       "SELECT year,sum(count) "+
      "from format_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=4 "+
      "group by year "+
      "order by year";
      msql.query(query3);
      add(2,array,msql);
    }
    else {
    }
    return array;

  } 
 /* 
    

private void addG(ArrayList<CertificateInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    println("CAVALLO");
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setG(count);
  }
}
private void addPG(ArrayList<CertificateInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    println("CAVALLO");
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setPG(count);
  }
}
private void addR(ArrayList<CertificateInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    println("CAVALLO");
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setR(count);
  }
}
private void addPG13(ArrayList<CertificateInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    println("CAVALLO");
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setPG13(count);
  }
}
private void addNC17(ArrayList<CertificateInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    println("CAVALLO");
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setNC17(count);
  }
}
private void addNR(ArrayList<CertificateInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setNR(count);
  }
}
private void addOTHERS(ArrayList<CertificateInstance> array,MySQL msql){
  int year,count;
  while(msql.next()){
    year=msql.getInt(1);
    count=msql.getInt(2);
        if(year>1889)
    array.get(year-1890).setOTHERS(count);
  }
}
*/
public ArrayList<Instance> getCertificates(String genre, String monster){
    ArrayList<Instance> array = new ArrayList<Instance>();
    initArray(array);
    if(!genre.equals(""))
       genre=" genre=\""+genre+"\" and";
    if ( msql.connect() )
    {
      String query1=   
      "SELECT year,sum(count) "+
      "from certificates_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"G\" "+
      "group by year "+
      "order by year";
      println(query1);
      msql.query(query1);
      add(0,array,msql);
      String query2=   
         "SELECT year,sum(count) "+
      "from certificates_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"PG\" "+
      "group by year "+
      "order by year";
      msql.query(query2);
      add(1,array,msql);
       String query3=   
       "SELECT year,sum(count) "+
      "from certificates_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"R\" "+
      "group by year "+
      "order by year";
      msql.query(query3);
      add(2,array,msql);
            String query4=   
       "SELECT year,sum(count) "+
      "from certificates_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"PG-13\" "+
      "group by year "+
      "order by year";
      msql.query(query4);
      add(3,array,msql);
            String query5=   
       "SELECT year,sum(count) "+
      "from certificates_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"NC-17\" "+
      "group by year "+
      "order by year";
      msql.query(query5);
      add(4,array,msql);
            String query6=   
       "SELECT year,sum(count) "+
      "from certificates_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"OTHERS\" "+
      "group by year "+
      "order by year";
      msql.query(query6);
      add(5,array,msql);
            String query7=   
       "SELECT year,sum(count) "+
      "from certificates_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"NR\" "+
      "group by year "+
      "order by year";
      msql.query(query7);
      add(6,array,msql);
    }
    else {
    }
    return array;

  }

  public ArrayList<Instance> getCountries(String genre, String monster){
    ArrayList<Instance> array = new ArrayList<Instance>();
    initArray(array);
        if(!genre.equals(""))
          genre=" genre=\""+genre+"\" and";
    if ( msql.connect() )
    {
      String query1=   
      "SELECT year,sum(count) "+
      "from countries_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"USA\" "+
      "group by year "+
      "order by year";
      println(query1);
      msql.query(query1);
      add(0,array,msql);
      String query2=   
         "SELECT year,sum(count) "+
      "from countries_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"UK\" "+
      "group by year "+
      "order by year";
      msql.query(query2);
      add(1,array,msql);
       String query3=   
       "SELECT year,sum(count) "+
      "from countries_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"France\" "+
      "group by year "+
      "order by year";
      println(query3);
      msql.query(query3);
      add(2,array,msql);
            String query4=   
       "SELECT year,sum(count) "+
      "from countries_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"Japan\" "+
      "group by year "+
      "order by year";
      println(query4);
      msql.query(query4);
      add(3,array,msql);
            String query5=   
       "SELECT year,sum(count) "+
      "from countries_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"Germany\" "+
      "group by year "+
      "order by year";
      msql.query(query5);
      add(4,array,msql);
            String query6=   
       "SELECT year,sum(count) "+
      "from countries_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"Canada\" "+
      "group by year "+
      "order by year";
      msql.query(query6);
      add(5,array,msql);
            String query7=   
       "SELECT year,sum(count) "+
      "from countries_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"Others\" "+
      "group by year "+
      "order by year";
      msql.query(query7);
      add(6,array,msql);
    }
    else {
    }
    return array;

  }  
  

  public ArrayList<Instance> getQuality(String genre, String monster){
    ArrayList<Instance> array = new ArrayList<Instance>();
    initArray(array);
    if(!genre.equals(""))
          genre=" genre=\""+genre+"\" and";
    if ( msql.connect() )
    {
      String query1=   
      "SELECT year,sum(count) "+
      "from quality_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"LOW\" "+
      "group by year "+
      "order by year";
      println(query1);
      msql.query(query1);
      add(0,array,msql);
      String query2=   
         "SELECT year,sum(count) "+
      "from quality_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"MEDIUM\" "+
      "group by year "+
      "order by year";
      msql.query(query2);
      add(1,array,msql);
       String query3=   
       "SELECT year,sum(count) "+
      "from quality_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"HIGH\" "+
      "group by year "+
      "order by year";
      msql.query(query3);
      add(2,array,msql);
    }
    else {
    }
    return array;
  }

    public ArrayList<Instance> getPopularity(String genre, String monster){
    ArrayList<Instance> array = new ArrayList<Instance>();
    if(!genre.equals(""))
          genre=" genre=\""+genre+"\" and";
    initArray(array);
    if ( msql.connect() )
    {
      String query1=   
      "SELECT year,SUM( count )  "+
      "from popularity_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"LOW\" "+
      "group by year "+
      "order by year";
      println(query1);
      msql.query(query1);
      add(0,array,msql);
      String query2=   
         "SELECT year,SUM( count )  "+
      "from popularity_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"MEDIUM\" "+
      "group by year "+
      "order by year";
      msql.query(query2);
      add(1,array,msql);
       String query3=   
       "SELECT year,SUM( count )  "+
      "from popularity_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"HIGH\" "+
      "group by year "+
      "order by year";
      msql.query(query3);
      add(2,array,msql);
    }
    else {
    }
    return array;

  } 

   public ArrayList<Instance> getBudget(String genre, String monster){
    ArrayList<Instance> array = new ArrayList<Instance>();
    if(!genre.equals(""))
          genre=" genre=\""+genre+"\" and";
    initArray(array);
    if ( msql.connect() )
    {
      String query1=   
      "SELECT year,SUM( count )  "+
      "from budget_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"HIGH_BUDGET\" "+
      "group by year "+
      "order by year";
      println(query1);
      msql.query(query1);
      add(0,array,msql);
      String query2=   
         "SELECT year,SUM( count )  "+
      "from budget_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"LOW_BUDGET\" "+
      "group by year "+
      "order by year";
      msql.query(query2);
      add(1,array,msql);
       String query3=   
       "SELECT year,SUM( count )  "+
      "from budget_count "+
      "where "+
      genre+
      " monster=\""+
      monster+
      "\" and clustered_by=\"NO_BUDGET\" "+
      "group by year "+
      "order by year";
      msql.query(query3);
      add(2,array,msql);
    }
    else {
    }
    return array;

  } 
  


  
  private String getGenres(String[] genres){
    String info_list="";
    if (genres.length<1) return "";
    for (int i=0;i<genres.length;i++) {
      info_list=" mi.info=\""+genres[i]+"\" and";
    }
    //remove last and
    return info_list.substring(0, info_list.length()-3);
  }


  private String getInfo(String[] info, int[] info_type_id) {
    String info_list="";
    for (int i=0;i<info.length;i++) {
      info_list=" (not mi.info_type_id="+info_type_id[i]+" or mi.info=\""+info[i]+"\")"+" and";
    }
    //remove last and
    return info_list.substring(0, info_list.length()-3);
  }
  
  private String getKeywordsSuper(String keyword) {
    if (keyword==VAMPIRE_REF) {
      return getKeywords(VAMPIRE_REF)+" "+getKeywords(DRACULA_REF)+" "+getKeywords(FEMALE_VAMPIRE_REF);
    }
    else return getKeywords(keyword);
  }
  //utility method to write query with keywords
  private String getKeywords(String keyword) {
    String keyword_list="";
    if (keyword.equals(VAMPIRE_REF)) {
      for (int i=0;i<vampire_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+vampire_kwords[i]+"' or";
    }
    else if (keyword.equals(FEMALE_VAMPIRE_REF)) {
      for (int i=0;i<female_vampire_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+female_vampire_kwords[i]+"' or";
    }
    else if (keyword.equals(ZOMBIE_REF)) {
      for (int i=0;i<zombie_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+zombie_kwords[i]+"' or";
    }
    else if (keyword.equals(DRACULA_REF)) {
      for (int i=0;i<dracula_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+dracula_kwords[i]+"' or";
    }
    else if (keyword.equals(FRANKENSTEIN_REF)) {
      for (int i=0;i<frankenstein_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+frankenstein_kwords[i]+"' or";
    }
    else if (keyword.equals(MUMMY_REF)) {
      for (int i=0;i<mummy_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+mummy_kwords[i]+"' or";
    }
    else if (keyword.equals(LIVING_DEAD_REF)) {
      for (int i=0;i<living_dead_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+living_dead_kwords[i]+"' or";
    }
    else if (keyword.equals(SUPERNATURAL_REF)) {
      for (int i=0;i<supernatural.length;i++)
        keyword_list=keyword_list+" k.keyword='"+supernatural[i]+"' or";
    }
    else if (keyword.equals(DEMON_REF)) {
      for (int i=0;i<demon_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+demon_kwords[i]+"' or";
    }
    else if (keyword.equals(POSSESSED_REF)) {
      for (int i=0;i<possessed_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+possessed_kwords[i]+"' or";
    }
    else if (keyword.equals(GHOST_REF)) {
      for (int i=0;i<ghost_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+ghost_kwords[i]+"' or";
    }
    else if (keyword.equals(WITCH_WIZARD_REF)) {
      for (int i=0;i<witch_wizards_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+witch_wizards_kwords[i]+"' or";
    }
    else if (keyword.equals(INVISIBLE_REF)) {
      for (int i=0;i<invisible_man_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+invisible_man_kwords[i]+"' or";
    }
    else if (keyword.equals(MYERS_REF)) {
      for (int i=0;i<michael_myers_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+michael_myers_kwords[i]+"' or";
    }
    else if (keyword.equals(FREDDY_REF)) {
      for (int i=0;i<freddy_krueger_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+freddy_krueger_kwords[i]+"' or";
    }
    else if (keyword.equals(JSON_REF)) {
      for (int i=0;i<jason_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+jason_kwords[i]+"' or";
    }
    else if (keyword.equals(SWAMP_REF)) {
      for (int i=0;i<swamp_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+swamp_kwords[i]+"' or";
    }
    else if (keyword.equals(MUTED_CREATURES_REF)) {
      for (int i=0;i<muted_creatures_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+muted_creatures_kwords[i]+"' or";
    }                
    else if (keyword.equals(GIANT_REF)) {
      for (int i=0;i<giant_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+giant_kwords[i]+"' or";
    }                
    else if (keyword.equals(MUNTANTS_REF)) {
      for (int i=0;i<mutants_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+mutants_kwords[i]+"' or";
    } 
    else if (keyword.equals(MRHYDE_REF)) {
      for (int i=0;i<mr_hyde_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+mr_hyde_kwords[i]+"' or";
    }                
    else if (keyword.equals(GODZILLA_REF)) {
      for (int i=0;i<godzilla_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+godzilla_kwords[i]+"' or";
    } 
    else if (keyword.equals(SHARK_REF)) {
      for (int i=0;i<shark_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+shark_kwords[i]+"' or";
    } 
    else if (keyword.equals(SNAKE_REF)) {
      for (int i=0;i<snake_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+snake_kwords[i]+"' or";
    }
        else if (keyword.equals(WEREWOLF_REF)) {
      for (int i=0;i<werewolf_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+werewolf_kwords[i]+"' or";
    }
      else if (keyword.equals(ALIEN_REF)) {
      for (int i=0;i<alien_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+alien_kwords[i]+"' or";
    }else if (keyword.equals(DINOSAUR_REF)) {
      for (int i=0;i<dinosaur_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+dinosaur_kwords[i]+"' or";
    }else if (keyword.equals(PREDATOR_REF)) {
      for (int i=0;i<predator_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+predator_kwords[i]+"' or";
    }else if (keyword.equals(PIRANHA_REF)) {
      for (int i=0;i<piranha_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+piranha_kwords[i]+"' or";
    }else if (keyword.equals(ANIMAL_REF)) {
      for (int i=0;i<animal_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+animal_kwords[i]+"' or";
    }else if (keyword.equals(HUMANOIDS_REF)) {
      for (int i=0;i<humanoids_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+humanoids_kwords[i]+"' or";
    }
    if (keyword_list.length()<2) return "";
    keyword_list=keyword_list.substring(0, keyword_list.length()-2);

    return keyword_list;
  }

}

