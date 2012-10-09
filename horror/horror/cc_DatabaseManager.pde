import de.bezier.data.sql.*;

//--------------------------------- TEST method -----------------------------------------
/*
void setup()
{
  IMDB imdb=new IMDB(this);
  ArrayList<cc_> array = imdb.getFilmNumber("vampire","horror",3);
  for (cc_cc_YearCountPair p: array) {
    println(p.getYear()+" "+p.getCount());
  }
  println("wft?"+array.size());
}
*/

//This class manages the database
public class cc_DatabaseManager {
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

private String[] vampire_kwords= {
  "vampire", "female-vampire", "vampire-slayer", "vampire-hunter", "vampire-bat", "vampire-bite", 
  "vampire-human-love", "lesbian-vampire", "vampire-vs-vampire", "chinese-vampire", "child-vampire", "vampire-human-relationship", 
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
  "female-vampire", "lesbian-vampire", "vampire_girl", "vampire_queen"
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

private String[] living_dead_kwords={
  "undead", "back-from-the-dead", "dead-woman-with-eyes-open", "living-dead", 
    "walking-dead","evil-dead"
};

private String[] supernatural={
  "supernatural-horror","supernatural-being","supernatural-murderer","supernatural-creature"
};
private String[] demon_kwords={
  "demon", "demonic-possession", "demon-rape", "demon-hunter", "demoness", "demonic", "demon-spawn", "inner-demon", 
   "female-demon", "demonic-spirit", "impregnated-by-demon", "horned-demon", "balan-the-demon", 
   "shadow-demon", "demon-lady", "impish-demon", "rogue-demon-hunter", "giant-demon"
};

private String[] possessed_kwords={
  "possessed-human", "possessed-girl", "possessed-animal", "possessed-by-evil-spirit", "possessed-soul", "possessed-boy", "possessed-house",
   "possessed-car"
};

private String[] ghost_kwords={
  "ghost", "ghost-girl", "ghost-child", "vengeful-ghost", "ghost-writer", "ghost-ship", "ghost-in-mirror", "ghost-hunter", "sex-with-ghost",
  "ghost-in-the-shell", "female-ghost","ghost-boy", "ghosts", "ghost-house-underground", "ghostbuster", "ghostbusters", "ghost-hunting","male-ghost", 
  "seeing-ghosts", "ghost-train", "ghost-of-mother", "talking-to-a-ghost", "seeing-a-ghost", "ghost-of-father", "ghost-dog", "ghost-of-wife", 
  "scared-ghost", "ghost-riding", "ghost-rider", "ghost-in-a-mirror", "child-ghost", "mistaken-for-ghost", "menacing-ghost", "ghost-of-baby", 
  "disguised-as-a-ghost", "killed-by-ghost",  "ghost-on-video", "invisible-daylight-ghosts", "playful-ghost", "sexy-ghost", "holy-ghost", 
  "ghost-human-relationship", "baby-ghost", "ghost-cage", "ghosts-japan", "tiger-ghost", "ghost-of-covered-up-murder-victim", "ghost-in-elevator",
   "ghost-against-ghost", "ghost-of-ancestor", "bull-ghost", "friendly-ghost", "ghost-tour", "monkey-ghost", "boy-ghost", "headless-ghost-knight",
    "ghost-of-grandfather", "ghostbusting", "haunted-by-a-ghost", "mistaken-for-a-ghost", "ghost-as-friend", "ghost-ranch-new-mexico", "silver-ghost", 
    "ghost-investigators", "former-ghostbuster", "ghost-car", "ghost-in-the-machine", "ghost-sickness"
};

private String[] witch_wizards_kwords={
  "wizard", "evil-wizard", "wizard-of-oz", "wizards'-duel", "magician", "stage-magician", "merlin-the-magician", "evil-magician", "mad-magician",
  "black-magician", "female-magician", "white-magician", "mysto-the-magician", "magician-hero", "sorcerer", "evil-sorcerer",
  "gilbert-and-sullivan's-the-sorcerer", "simon-the-sorcerer", "witch", "witch-doctor", "evil-witch", "wicked-witch", "honey-halfwitch",
  "sea-witch", "witches-horror", "bell-witch", "flying-witch", "blair-witch",  "salem-witch-hunt",  "witch's-revenge","preteenage-witch",
  "witches-sabbath"
};

private String[] invisible_man_kwords={
  "invisible-man", "invisible-being", "invisible-woman", "invisible-being-makes-fotoprint", "invisible-creature", "invisible-girl", 
  "invisible-companion"
};

private String[] michael_myers_kwords={
  "michael-myers"
};

private String[] freddy_krueger_kwords={
  "freddy-krueger"
};

private String[] swamp_kwords={
  "swamp-thing", "swamp-monster", "swamp-beast", "swamp-creature"
};

private String[] jason_kwords={
  "jason-voorhees"
};

private String[] godzilla_kwords={
  "godzilla", "mechagodzilla"
};

private String[] muted_creatures_kwords={
  "teenage-mutant-ninja-turtles",  "mutant-animal", "mutant-creature", "mutant-dog", "genetic-mutant",
   "mutant-reptile", "mutant-amphibian", "bitten-by-a-mutant", "mutant-spider", "mutant-baboon", 
   "mutant-registration-act",  "mutant-plant", "strategically-altered-mutant", "os-mutantes", "giant-mutant-koala-bear", 
   "mutant-lizard", "liver-eating-mutant"
};

private String[] giant_kwords={
  "giant-monster", "giant-animal", "giant-insect", "giant-spider", "giant-snake", "giant-squid", "giant-bird", "giant-lizard", "giant-cat", 
  "giant-octopus", "giant-worm", "giant-crab", "giant-crocodile", "giant-rat", "giant-creature", "giant-dog", "giant-fish", "giant-chicken",
   "giant-bug", "giant-invertebrate", "giant-bat", "giant-lobster", "giant-scorpion", "giant-frog", "giant-insect-larva", "giant-insect-egg",
    "giant-lollipop", "giant-condor", "giant-bee","giant-mouse" , "giant-centipede", "giant-mosquito", "giant-snail", "giant-rabbit", "giant-web"
};

private String[] werewolf_kwords={
  "werewolf", "female-werewolf", "werewolf-bite", "vampire-versus-werewolf", "werewolf-transformation",
   "werewolf-family", "killed-by-a-werewolf", "werewolf-killer", "teenage-werewolf", 
   "scratched-by-werewolf", "werewolf-doll", "werewolf-shot", "werewolf-pack-leader", "bitten-by-a-werewolf", 
   "alpha-werewolf", "werewolf-human-relationship", "male-werewolf"
};


private String[] mutants_kwords={
   "mutant","mutant-baby","mutant-human", "mutant-woman","woman-mutant",
};
private String[] mr_hyde_kwords={
  "jekyll-and-hyde"
};




  MySQL msql;
  PApplet context;


  public cc_DatabaseManager(PApplet context) {
    this.context=context;
    String user     = "root";
    String pass     = "root";
    String database = "cs424imdb";
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
          array.add(new cc_YearCountPair(0.0,i));
    }
    return array;
  }
  */
  private ArrayList<cc_YearCountPair> createArrayFromQuery(ArrayList<cc_YearCountPair> array, MySQL msql) {
    int old=1890;
    int i=0;
    do{
      i=1;
      while(msql.getInt(1)>old){
        array.add(new cc_YearCountPair(0.0,old));
        old++;
      }
      array.add(new cc_YearCountPair(msql.getFloat(2), msql.getInt(1)));
      old++;
    }while(msql.next());
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
      println("OK!");
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
        "t.production_year, count(t.id) "+
        "from "+
        "keyword as k "+
        "left join "+
        "movie_keyword as mk ON k.id = mk.keyword_id "+
        "left join "+
        "title as t ON t.id = mk.movie_id "+
        "where ("+
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
      println("OK!");
    }
    else {
    }
    return array;
  }


//utility method to write query with keywords
  private String getKeywords(String keyword) {
    String keyword_list="";
    if (keyword.equals("vampire")) {
      for (int i=0;i<vampire_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+vampire_kwords[i]+"' or";
    }
    else if (keyword.equals("female_vampire")) {
      for (int i=0;i<female_vampire_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+female_vampire_kwords[i]+"' or";
    }
    else if (keyword.equals("zombie")) {
      for (int i=0;i<zombie_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+zombie_kwords[i]+"' or";
    }
    else if (keyword.equals("dracula")) {
      for (int i=0;i<dracula_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+dracula_kwords[i]+"' or";
    }
    else if (keyword.equals("frankenstein")) {
      for (int i=0;i<frankenstein_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+frankenstein_kwords[i]+"' or";
    }
    else if (keyword.equals("mummy")) {
      for (int i=0;i<mummy_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+mummy_kwords[i]+"' or";
    }
        else if (keyword.equals("living-dead")) {
      for (int i=0;i<living_dead_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+living_dead_kwords[i]+"' or";
    }
        else if (keyword.equals("supernatural")) {
      for (int i=0;i<supernatural.length;i++)
        keyword_list=keyword_list+" k.keyword='"+supernatural[i]+"' or";
    }
        else if (keyword.equals("demon")) {
      for (int i=0;i<demon_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+demon_kwords[i]+"' or";
    }
        else if (keyword.equals("possessed")) {
      for (int i=0;i<possessed_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+possessed_kwords[i]+"' or";
    }
            else if (keyword.equals("ghost")) {
      for (int i=0;i<ghost_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+ghost_kwords[i]+"' or";
    }
        else if (keyword.equals("witch-wizards")) {
      for (int i=0;i<witch_wizards_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+witch_wizards_kwords[i]+"' or";
    }
        else if (keyword.equals("invisible-man")) {
      for (int i=0;i<invisible_man_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+invisible_man_kwords[i]+"' or";
    }
            else if (keyword.equals("michael-myers")) {
      for (int i=0;i<michael_myers_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+michael_myers_kwords[i]+"' or";
    }
            else if (keyword.equals("freddy-krueger")) {
      for (int i=0;i<freddy_krueger_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+freddy_krueger_kwords[i]+"' or";
    }
                else if (keyword.equals("jason")) {
      for (int i=0;i<jason_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+jason_kwords[i]+"' or";
    }
                else if (keyword.equals("swamp")) {
      for (int i=0;i<swamp_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+swamp_kwords[i]+"' or";
    }
                else if (keyword.equals("muted-creatures")) {
      for (int i=0;i<muted_creatures_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+muted_creatures_kwords[i]+"' or";
    }                else if (keyword.equals("giant")) {
      for (int i=0;i<giant_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+giant_kwords[i]+"' or";
    }                else if (keyword.equals("mutants")) {
      for (int i=0;i<mutants_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+mutants_kwords[i]+"' or";
    }                else if (keyword.equals("mr-hyde")) {
      for (int i=0;i<mr_hyde_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+mr_hyde_kwords[i]+"' or";
    }                else if (keyword.equals("godzilla")) {
      for (int i=0;i<godzilla_kwords.length;i++)
        keyword_list=keyword_list+" k.keyword='"+godzilla_kwords[i]+"' or";
    }
    keyword_list=keyword_list.substring(0, keyword_list.length()-2);
    return keyword_list;
  }
               
}


