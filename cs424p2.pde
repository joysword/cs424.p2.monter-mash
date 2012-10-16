import processing.net.*;
import omicronAPI.*;

OmicronAPI omicronManager;
TouchListener touchListener;

// Link to this Processing applet - used for touchDown() callback example
PApplet applet;


// for integrating
PApplet context;

// Override of PApplet init() which is called before setup()
public void init() {
  super.init();

  // Creates the OmicronAPI object. This is placed in init() since we want to use fullscreen
  omicronManager = new OmicronAPI(this);

  // Removes the title bar for full screen mode (present mode will not work on Cyber-commons wall)
  //omicronManager.setFullscreen(true);
}
///////////////////////////////////////////////////
UserInterface ui;

final int scale = 1;

final int scaling = 7;

final int Width = 1632*scale;
final int Height = 461*scale;

int columnCount = 10;

//final int Width = 8160;
//final int Height = 2304;
int currentPage;

boolean global_isDragLeft; //drag Left Timelock of Range on First Page
boolean global_isDragRight;

float dataMax, dataMax_decade;
float dataMax1, dataMax2;
float dataMax1_decade, dataMax2_decade;

int numberOfFilters = 12;

ArrayList[] plot_data = new ArrayList[numberOfFilters];

/*
plot_1_format;

ArrayList<Instance> plot_1_certificate;

ArrayList<Instance> plot_1_country;
ArrayList<Instance> plot_1_popularity;
ArrayList<Instance> plot_1_quality;
ArrayList<Instance> plot_1_budget;

ArrayList<Instance> plot_2_format;
ArrayList<Instance> plot_2_certificate;
ArrayList<Instance> plot_2_country;
ArrayList<Instance> plot_2_popularity;
ArrayList<Instance> plot_2_quality;
ArrayList<Instance> plot_2_budget;*/

String[] filterTxt1;
String[] filterTxt2;

int currentFilter;

//cc_MonsterPlot plot;
///////////////////////////////////
//
//
//                  SETUP
//
//
///////////////////////////////////
void setup()
{
  //size(Width*scale, Height*scale);
  size(Width, Height);
  //Make the connection to the tracker machine (uncomment this if testing with touch)
  //omicronManager.ConnectToTracker(7001, 7340, "131.193.77.159");

  // Create a listener to get events
  touchListener = new TouchListener();

  // Register listener with OmicronAPI
  omicronManager.setTouchListener(touchListener);

  // Sets applet to this sketch
  applet = this;
  context = this;

  // setup Font
  PFont plotFont = createFont("Helvetica-Bold", 14*scale);//change
  textFont(plotFont);

  currentPage = FIRST_PAGE;

  currentFilter = 5; // certificate

  global_isDragRight = false;
  global_isDragLeft = false;

  //global_data = new ArrayList<Instance>();

  for (int i=0;i<numberOfFilters;i++) {
    plot_data[i] = new ArrayList<Instance>();
  }
  /*
  plot_1_certificate = new ArrayList<Instance>();
  plot_1_format = new ArrayList<Instance>();
  //plot_1_budget;
  plot_1_quality = new ArrayList<Instance>();
  plot_1_country = new ArrayList<Instance>();
  plot_1_popularity = new ArrayList<Instance>();

  plot_2_certificate = new ArrayList<Instance>();
  plot_2_format = new ArrayList<Instance>();
  //plot_2_budget;
  plot_2_quality = new ArrayList<Instance>();
  plot_2_country = new ArrayList<Instance>();
  plot_2_popularity = new ArrayList<Instance>();
  */

  ui = new UserInterface();

  //global_data = ui.getDB().getFormat("horror","vampire");
  //global_data = ui.getDB().getCertificates("horror", "vampire");

  plot_data[0].addAll(ui.getDB().getQuality("horror", "vampire"));
  plot_data[1].addAll(ui.getDB().getQuality("horror", "vampire"));
  plot_data[2].addAll(ui.getDB().getFormat("horror", "vampire"));
  plot_data[3].addAll(ui.getDB().getPopularity("horror", "vampire"));
  plot_data[4].addAll(ui.getDB().getCountries("horror","vampire"));
  plot_data[5].addAll(ui.getDB().getCertificates("horror","vampire"));

  plot_data[6].addAll(ui.getDB().getQuality("horror", "vampire"));
  plot_data[7].addAll(ui.getDB().getQuality("horror", "vampire"));
  plot_data[8].addAll(ui.getDB().getFormat("horror", "vampire"));
  plot_data[9].addAll(ui.getDB().getPopularity("horror", "vampire"));
  plot_data[10].addAll(ui.getDB().getCountries("horror","vampire"));
  plot_data[11].addAll(ui.getDB().getCertificates("horror","vampire"));

  //println("cer: "+plot_1_certificate.size());
  //println("pop: "+plot_1_popularity.size());
  //println("qua: "+plot_1_quality.size());
  //println("for: "+plot_1_format.size());

  filterTxt1 = FILTER_TXT_1;
  filterTxt2 = FILTER_TXT_2;

  //dataMax = ui.getFirstPage().getFilter(0).getMax(plot_1_certificate);
  //dataMax_decade = ui.getFirstPage().getFilter(0).getMax7_decade(plot_1_certificate);

  dataMax = ui.getFirstPage().getFilter(0).getMax(plot_data[5]); //certificate
  dataMax_decade = ui.getFirstPage().getFilter(0).getMax_decade(plot_data[5]); //certificate

  dataMax1 = dataMax;
  dataMax2 = dataMax;
  dataMax1_decade = dataMax_decade;
  dataMax2_decade = dataMax_decade;

  //println("max: " + dataMax_decade);

  // setup other things

    // end of setup
  smooth();


  //test

  //plot = new cc_MonsterPlot(100,1000,200,400,"female_vampire",this);
  //plot.monsterSetup();
} // end of setup

///////////////////////////////////
//
//
//                  DRAW
//
//
///////////////////////////////////
void draw() {

  background(BG_COLOR);

  //render graphs or other things
  //plot.monsterPlot();

  //end of redner graphs or other things

  //draw User Interface
  ui.render();

  omicronManager.process();
}

