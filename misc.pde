//
//
//
//
// CONSTANT and OTHER
//
//


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
String[] LEFT_BTN_NAME = {"Timelines","Monsters","Movies","Help and Credits"};


// about global color scheme
final int BG_COLOR = 0;

final int BUTTON_COLOR = #ff6600;
final int POP_UP_COLOR = #342C2C;
final int TEXT_COLOR = 255;
final int CHECK_ITEM_COLOR = 150; // checkbox, filter title, etc

final int PLOT_BG_COLOR = 30;
final int PLOT_LINE_COLOR = 255;

final int CURVE_COLOR_TEMP = 255;

final int POP_UP_WINDOW_BG_COLOR = POP_UP_COLOR;
final int POP_UP_WINDOW_TEXT_COLOR = TEXT_COLOR;
final int WINDOW_BOARD_COLOR = #ff3399; final int BOARD_WEIGHT = 3*scale;

// about pages
final int FIRST_PAGE = 0;
final int MONSTER_PAGE = 1;
final int MOVIE_PAGE = 2;

//
//
//
//
//
// about First Page UI
final int HOW_MANY_FILTERS = 6;
final int HOW_MANY_GRAPH = 2;

	// about RIGHT BAR
final float RIGHT_BAR_WIDTH = 320*scale;
final float FILTER_X = Width - 180*scale;
final float FILTER_Y = 100*scale;
final float FILTER_DIFF = 80*scale;
final float LABEL_WIDTH = 100*scale;


final String[] FILTER_TXT = {
	"MONSTERS:\n Godzilla, Vampire","GENRES:\n Musical","QUALITY:\n >7.0","FORMAT:\n Color","BUDGET:\n high","POPULARITY:\n >4000 votes"
};

	// about Filters

		// General CheckItem values
		final float CHECK_BOX_WIDTH = 12*scale;
		final float CHECK_ITEM_HEIGHT = CHECK_BOX_WIDTH;
		// FIRST_PAGE_FILTER_X is decided by RIGHT_BAR_WIDTH and FIRST_PAGE_FILTER_W
//final float FIRST_PAGE_FILTER_X = 0.6*Width;
final float FIRST_PAGE_FILTER_Y = 0.45*Height;
final float FIRST_PAGE_FILTER_W = 0.5*Width - RIGHT_BAR_WIDTH;
final float FIRST_PAGE_FILTER_H = Height - FIRST_PAGE_FILTER_Y;
final float FPF_BTN_X_RELATIVE = 0.85;
final float FPF_BTN_Y_RELATIVE = 0.85;
final float FPF_BTN_W = 60*scale;
final float FPF_BTN_H = 32*scale;

		// Rating (Quality)
final float FILTER_QUALITY_X_RELATIVE = 0.01;
final float FILTER_QUALITY_Y_RELATIVE = 0.04;
final float FILTER_QUALITY_W = FIRST_PAGE_FILTER_W;
final float FILTER_QUALITY_H = CHECK_ITEM_HEIGHT;
final int FILTER_QUALITY_NUM = 10;

		// Votes (Popularity)
final float FILTER_POPULARITY_X_RELATIVE = 0.01;
final float FILTER_POPULARITY_Y_RELATIVE = 0.34;
final float FILTER_POPULARITY_W = FIRST_PAGE_FILTER_W;
final float FILTER_POPULARITY_H = CHECK_ITEM_HEIGHT;
final int FILTER_POPULARITY_NUM = 10; //change

		// Genres
final float FILTER_GENRE_X_RELATIVE = 0.01;
final float FILTER_GENRE_Y_RELATIVE = 0.54;
final float FILTER_GENRE_W = FIRST_PAGE_FILTER_W;
final float FILTER_GENRE_H = CHECK_ITEM_HEIGHT;
final int FILTER_GENRE_NUM = 27;
final String[] GENRE_TYPE = {"Action","Adventure","Animation","Biography","Comedy","Crime","Drama","Experimental","Family","Fantasy","Film-Noir","Game-Show","History","Horror","Music","Musical","Mystery","News","Reality_TV","Romance","Sci-Fi","Short","Sport","Talk-Show","Thriller","War","Western"};

		// Monster
final float FILTER_MONSTER_X_RELATIVE = 0.01;
final float FILTER_MONSTER_Y_RELATIVE = 0.74;
final float FILTER_MONSTER_W = FIRST_PAGE_FILTER_W;
final float FILTER_MONSTER_H = CHECK_ITEM_HEIGHT;
final int FILTER_MONSTER_NUM = 10;
final int NUMBER_OF_MONSTER = 10; //change
final String[] MONSTER_TYPE = {"Monster","Monster","Monster","Monster","Monster","Monster","Monster","Monster","Monster","Monster"};

		// Budget
final float FILTER_BUDGET_X_RELATIVE = 0.01;
final float FILTER_BUDGET_Y_RELATIVE = 0.94;
final float FILTER_BUDGET_W = FIRST_PAGE_FILTER_W;
final float FILTER_BUDGET_H = CHECK_ITEM_HEIGHT;
final int FILTER_BUDGET_NUM = 3;

		// Format
final float FILTER_FORMAT_X_RELATIVE = 0.01;
final float FILTER_FORMAT_Y_RELATIVE = 0.24;
final float FILTER_FORMAT_W = FIRST_PAGE_FILTER_W;
final float FILTER_FORMAT_H = CHECK_ITEM_HEIGHT;
final int FILTER_FORMAT_NUM = 3;
final int NUMBER_OF_FORMAT = 3;
final String[] KIND_TYPE = {"Movie","TV Movie","Video Movie"};

// aoubt First Page Plot
final int YEAR_MAX = 2012;
final int YEAR_MIN = 1890;

final float PLOT_X1 = 60*scale;
final float PLOT_X2 = 1260*scale;
final float PLOT_Y1 = 100*scale;
final float PLOT_Y2 = Height - 50*scale;

final int OUTLINE_WIDTH = 4*scale;
final int INLINE_WIDTH = scale;

final int UPPER_LEFT = 0;
final int UPPER_RIGHT = 1;
final int LOWER_LEFT = 2;
final int LOWER_RIGHT = 3;

final float POP_UP_MENU_W = 100*scale;
final int POP_UP_MENU_N = 3; //change
final float POP_UP_BUTTON_H = 30*scale;
final String[] POP_UP_BUTTON_NAME = {"Top 10","ATTENTION!","MONSTER IN UIC"};

final int TOP_10_WINDOW = 0;
final int TEMP_WINDOW_1 = 1;
final int TEMP_WINDOW_2 = 2;
final int[] POP_UP_WINDOW = {TOP_10_WINDOW,TEMP_WINDOW_1,TEMP_WINDOW_2};
final float POP_UP_WINDOW_X = 0.1*Width; //change
final float POP_UP_WINDOW_Y = 0.1*Height;
final float POP_UP_WINDOW_W = 0.8*Width;
final float POP_UP_WINDOW_H = 0.8*Height;


//

//
//
final int YEAR_MODE = 0;
final int DECADE_MODE = 1;
