import de.bezier.data.sql.*;

//--------------------------------- TEST method -----------------------------------------
/*
void setup()
{
  IMDB imdb=new IMDB(this);
   ArrayList<YearCountPair> array = imdb.getFilmsPerYearGivenKeywordFAST("vampire");
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
                    "WHERE production_year >=1890 and production_year<=2012 "+
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
public ArrayList<YearCountPair> getFilmsPerYearGivenKeyword(String keyword){ 
   ArrayList<YearCountPair> array = new ArrayList<YearCountPair>();
   if ( msql.connect() )
    {
        msql.query( "SELECT COUNT(*), production_year "+
                    "FROM per_keyword_query "+
                    "WHERE keyword like " + "\"%"+keyword+"%\""+
                    "and production_year >=1890 and production_year<=2012 "+
                    "GROUP BY production_year ");
        array=createArrayFromQuery(array,msql);
    }
 else{
 }
 return array;
}
}

