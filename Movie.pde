public class Movie {
  private String title;
  private int year;
  private String genre;
  private String runtime;
  private String description;
  private String certificate;
  private String budget;

  public Movie(String title, int year, String genre, String runtime, String certificate, String budget, String description) {
    this.title=title;
    this.year=year;
    this.genre=genre;
    this.runtime=runtime;
    this.certificate=certificate;
    this.budget=budget;
    this.description=description;
  }

  public String getTitle(){
    return title;
  }

  public int getYear(){
    return year;
  }

  public String getGenre(){
    return genre;
  }

  public String getRuntime(){
    return runtime;
  }

  public String getCertificate(){
    return certificate;
  }

  public String getBudget(){
    return budget;
  }

  public String getDestription(){
    return description;
  }
}

