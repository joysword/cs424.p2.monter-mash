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

final int scale = 2;

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

String[][] filterTxt1;
String[][] filterTxt2;

int[] currentFilter;

///////////////////////////////////
//
//
//                  SETUP
//
//
///////////////////////////////////
void setup()
{
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
  
  PFont plotFont;
  // setup Font
  //if (scale == 1) {
    plotFont = loadFont("Helvetica-Bold-14.vlw");
  //}
  //else if (scale == 5) {
    //plotFont = loadFont("Helvetica-Bold-70.vlw");
 // }
  textFont(plotFont);

  currentPage = FIRST_PAGE;

  currentFilter = new int[2];

  currentFilter[0] = CERTIFICATE;
  currentFilter[1] = CERTIFICATE;

  global_isDragRight = false;
  global_isDragLeft = false;


  for (int i=0;i<numberOfFilters;i++) {
    plot_data[i] = new ArrayList<Instance>();
  }

  ui = new UserInterface();

  plot_data[0].addAll(ui.getDB().getBudget("Horror", "vampire"));
  plot_data[1].addAll(ui.getDB().getQuality("Horror", "vampire"));
  plot_data[2].addAll(ui.getDB().getFormat("Horror", "vampire"));
  plot_data[3].addAll(ui.getDB().getPopularity("Horror", "vampire"));
  plot_data[4].addAll(ui.getDB().getCountries("Horror","vampire"));
  plot_data[5].addAll(ui.getDB().getCertificates("Horror","vampire"));

  plot_data[6].addAll(ui.getDB().getBudget("Horror", "vampire"));
  plot_data[7].addAll(ui.getDB().getQuality("Horror", "vampire"));
  plot_data[8].addAll(ui.getDB().getFormat("Horror", "vampire"));
  plot_data[9].addAll(ui.getDB().getPopularity("Horror", "vampire"));
  plot_data[10].addAll(ui.getDB().getCountries("Horror","vampire"));
  plot_data[11].addAll(ui.getDB().getCertificates("Horror","vampire"));

  filterTxt1 = FILTER_TXT_1;
  filterTxt2 = FILTER_TXT_2;

  dataMax1 = ui.getFirstPage().getFilter(0).getMax(plot_data[currentFilter[0]]);
  dataMax1_decade = ui.getFirstPage().getFilter(0).getMax_decade(plot_data[currentFilter[0]]);

  dataMax2 = ui.getFirstPage().getFilter(0).getMax(plot_data[currentFilter[1]+6]);
  dataMax2_decade = ui.getFirstPage().getFilter(0).getMax_decade(plot_data[currentFilter[1]+6]);

  dataMax = (dataMax1>dataMax2)?dataMax1:dataMax2;
  dataMax_decade = (dataMax1_decade>dataMax2_decade)?dataMax1_decade:dataMax2_decade;

  smooth();
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
  
  //draw User Interface
  ui.render();

  omicronManager.process();
}
