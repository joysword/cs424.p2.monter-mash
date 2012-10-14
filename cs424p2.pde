import processing.net.*;
import omicronAPI.*;

OmicronAPI omicronManager;
TouchListener touchListener;

// Link to this Processing applet - used for touchDown() callback example
PApplet applet;

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

final int Width = 1632*scale;
final int Height = 461*scale;

int columnCount = 10;

//final int Width = 8160;
//final int Height = 2304;
int currentPage;

boolean global_isDragLeft; //drag Left Timelock of Range on First Page
boolean global_isDragRight;
boolean global_leftBarClick;

ArrayList<FormatInstance> global_data;

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

  // setup Font
  PFont plotFont = createFont("Helvetica-Bold", 14*scale);//change
  textFont(plotFont);

  currentPage = FIRST_PAGE;

  global_isDragRight = false;
  global_isDragLeft = false;
  global_leftBarClick = false;

  global_data = new ArrayList<FormatInstance>();

  ui = new UserInterface();

  global_data = ui.getDB().getFormat("horror","vampire");
  
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
