import de.bezier.data.sql.*;

//--------------------------------- TEST method -----------------------------------------
/*
void setup()
{
  IMDB imdb=new IMDB(this);
   ArrayList<YearCountPair> array = imdb.getKI("vampire",1,"horror");
   for(YearCountPair p: array){
     println(p.getYear()+" "+p.getCount()); 
   }
}*/

private float[] inflation={25, 25, 25, 25.64, 26.32, 27.03, 27.03, 27.78, 27.78, 27.78, 27.03, 27.03, 26.32, 26.32, 25.64, 
  26.32, 25.64, 24.39, 25, 25, 24.39, 24.39, 23.81, 23.26, 22.73, 22.73, 20.83, 17.86, 15.15, 13.33, 11.49, 12.82, 13.7, 
  13.33, 13.33, 13.16, 12.99, 13.16, 13.33, 13.33, 13.7, 15.15, 16.67, 17.54, 17.24, 16.67, 16.39, 15.87, 16.39, 16.39, 
  16.39, 15.63, 14.08, 13.33, 12.99, 12.82, 11.76, 10.31, 9.52, 9.62, 9.52, 8.85, 8.62, 8.62, 8.55, 8.55, 8.4, 8.13, 
  7.94, 7.87, 7.75, 7.69, 7.58, 7.52, 7.41, 7.3, 7.09, 6.85, 6.58, 6.25, 5.92, 5.65, 5.49, 5.15, 4.65, 4.26, 4.03, 
  3.79, 3.52, 3.15, 2.79, 2.53, 2.38, 2.3, 2.21, 2.13, 2.09, 2.02, 1.94, 1.85, 1.75, 1.68, 1.63, 1.59, 1.55, 1.5, 
  1.46, 1.43, 1.41, 1.38, 1.33, 1.3, 1.27, 1.25, 1.21, 1.17, 1.14, 1.11, 1.06, 1.07, 1.05, 1.02, 1};
//-------------------------------- IMDB CLASS --------------------------------------------

private string[] vampire_names_kwords={"vampire", "female-vampire", "vampire-slayer", "vampire-hunter", "vampire-bat", "vampire-bite", 
"vampire-human-love", "lesbian-vampire", "vampire-vs-vampire", "chinese-vampire", "child-vampire", "vampire-human-relationship", 
"master-vampire", "vampire-sex", "vampire-cult", "vampire-driving-a-car", "bisexual-vampire", "vampire-versus-werewolf", 
"vampire-girl", "space-vampire", "bitten-by-a-vampire", "ancient-vampire", "gay-vampire", "vampire-staked", "sex-vampire", 
"vampire-teeth", "erotic-vampire", "male-vampire", "vampire-cop", "taoist-vampire", "turning-into-a-vampire", 
"vampire-spoof", "vampire-cowboy", "vampire-blood", "fang-free-vampire", "vampire-driving-car", "vampire-family", 
"pregnant-vampire", "vampire-legend", "vampire-doctor", "vampire-in-coma", "vampire-kill", "death-of-vampire", "vampire-nation", 
, "vampire-bar", "experimenting-on-a-vampire", "noble-vampire", "suicidal-vampire", "vampire-army", 
"vampire-experiment", "vampire-soldier", "world-of-vampires", "zombie-cannibal-vampire-pirate-queen", "psychic-vampire", "nazi-vampire", "strong-vampire", "swedish-vampire", "vampire-suit",
 "vampire-couple", "vampire-hunt", "vampire-maker", "reference-to-buffy-the-vampire-slayer", "teenage-vampire", "half-vampire", 
 "vampire-band", "vampire-killed-by-daylight", "vampire-queen", "vampire-detective", "energy-vampire",
 "flying-vampire", "newborn-vampire", "blood-drained-by-vampires"};

 private string[] female_vampire_kwords={"female-vampire", "lesbian-vampire","vampire_girl","vampire_queen"};

 private string[] dracula_kwords={"dracula"};

 private string[] zombie_kwords={"zombie", "flesh-eating-zombie", "zombie-violence", "zombie-attack", "zombie-survival", "zombie-child",
 "flesh-eating-zombies", "zombie-spoof", "zombification", "nazi-zombie", "zombie-love", "zombie-hunter", "zombie-bite", "sex-with-a-zombie",
 "zombie-sexuality", "zombie-parody", "zombie-with-gun", "zombie-slave", "zombie-apocalypse", "human-eaten-by-zombies", "zombie-baby", 
 "zombie-soldiers", "zombie-master", "zombie-walk", "lesbian-zombie", "zombie-horse", "zombie-clown", "underwater-nazi-zombie", 
 "zombie-survival-guide", "zombie-outbreak", "gay-zombie", "zombie-uprising", "zombie-jesus", "smart-zombies", "marine-zombie", 
 "alien-zombie", "reference-to-zombies", "man-made-zombie", "zombie-bride", "zombie-groom", "zombie-like-trance", "zombie-showgirl", 
 "kung-fu-zombie", "zombie-nun", "the-zombie-walk", "zombie-plan", "zombie-video", "zombie-walk-2011", "zombie-walk-2012", 
 "zombie-walk-long-beach", "zombie-walk-pittsburgh", "zombies-movie", "zombie-cannibal-vampire-pirate-queen", "old-lady-zombie", 
 "russian-zombie-movie", "animated-zombie-horror", "chained-zombie", "exploding-zombie", "zombie-city", "running-zombie",
  "nerdy-zombie", "bitten-by-a-zombie", "child-zombie", "shark-attacked-by-a-zombie", "shark-bitten-by-a-zombie"};

  private string[] frankenstein_kwords={"frankenstein","frankenstein's-monster","doctor-frankenstein","frankenstein-legend","frankenstein-baby"};
  private string[] mummy_kwords={"mummy"};

//This class manages the database
public class IMDB{

MySQL msql;
PApplet context;


public IMDB(PApplet context){
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
//returns ArrayList<YearCountPair> containing a list of pairs films-count , year
public ArrayList<YearCountPair> getFilmsPerYear(){
 ArrayList<YearCountPair> array = new ArrayList<YearCountPair>();
 if ( msql.connect() )
    {
        msql.query( "SELECT COUNT( * ) , production_year "+
                    "FROM title "+
                    "GROUP BY production_year" );
        array=createArrayFromQuery(array,msql);
    }
 else{
 }
 return array;
}

// private method to put the query into an arraylist
private ArrayList<YearCountPair> createArrayFromQuery(ArrayList<YearCountPair> array, MySQL msql){
  while(msql.next()){
    array.add(new YearCountPair(msql.getInt(1),msql.getInt(2)));
  }
  return array;
}

//------------------------- USE THIS METHOD TO COUNT FILM WITH A GIVEN KEYWORD PER YEAR --------------------------------
// Method to retrieve a list of pairs year-count containing the number of films related to the searched keyword
  public ArrayList<YearCountPair> getK(String keyword){ 
     ArrayList<YearCountPair> array = new ArrayList<YearCountPair>();
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
                     "   k.keyword like "\"%"+keyword+"%\""+
                     " group by t.production_year "+
                     " order by t.production_year");
            array=createArrayFromQuery(array,msql);
        }
     else{
     }
     return array;
    }

    public ArrayList<YearCountPair> getKI(String keyword,String info,int info_type){
       ArrayList<YearCountPair> array = new ArrayList<YearCountPair>();
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
                "mi.info='"+info+"' "+
                "mi.info_type_id ="+info_type+
                " k.keyword like "\"%"+keyword+"%\""+
                " group by t.production_year "+
                "order by t.production_year "
            array=createArrayFromQuery(array,msql);
        }
     else{
     }
     return array;
  }


}

