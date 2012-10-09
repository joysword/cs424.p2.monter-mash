//
//
//
//
// CONSTANT and OTHER
//
//
final int BG_COLOR = 0;


// about Help Window
final float HELP_WINDOW_x = 200*scale;
final float HELP_WINDOW_y = 100*scale;
final float HELP_WINDOW_w = 500*scale;
final float HELP_WINDOW_h = 300*scale;
final String HELP_WINDOW_c = "C, G, S"; //hhhhhelp

final int yearMin = 1890;
final int yearMax = 2009;

// aobut LEFT BAR
final float LEFT_BAR_DEFAULT_WIDTH = 30*scale;
final float LEFT_MENU_WIDTH = 200*scale;
final int BTN_NUMBER = 4;
final float BTN_H = 30*scale;
String[] LEFT_BTN_NAME = {"Main Page","Monsters","Movies","Help and Credit"};
final int BUTTON_COLOR = #ff6600; // change

// about pages
final int FIRST_PAGE = 0;
final int MONSTER_PAGE = 1;
final int MOVIE_PAGE = 2;

// about First Page UI
final int HOW_MANY_FILTERS = 6;
final int HOW_MANY_GRAPH = 2;

	// about RIGHT BAR
final float RIGHT_BAR_WIDTH = 320*scale;
final float FILTER_X = Width - 180*scale;
final float FILTER_Y = 100*scale;
final float FILTER_DIFF = 80*scale;
final float LABEL_WIDTH = 100*scale;
final float CHECK_BOX_WIDTH = 20*scale;
final float CHECK_ITEM_HEIGHT = 20*scale;
final String[] FILTER_TXT = {
	"MONSTERS:\n Godzilla, Vampire","GENRES:\n Musical","QUALITY:\n >7.0","FORMAT:\n Color","BUDGET:\n high","POPULARITY:\n >4000 votes"
};

	// about Filters

// FIRST_PAGE_FILTER_X is decided by RIGHT_BAR_WIDTH and FIRST_PAGE_FILTER_W
//final float FIRST_PAGE_FILTER_X = 0.6*Width;
final float FIRST_PAGE_FILTER_Y = 0.45*Height;
final float FIRST_PAGE_FILTER_W = 0.5*Width - RIGHT_BAR_WIDTH;
final float FIRST_PAGE_FILTER_H = Height - FIRST_PAGE_FILTER_Y;
final float FPF_BTN_X_RELATIVE = 0.4;
final float FPF_BTN_Y_RELATIVE = 0.9;
final float FPF_BTN_W = 60*scale;
final float FPF_BTN_H = 32*scale;

