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
final int BTN_NUMBER = 5;
final float BTN_H = 30*scale;
String[] LEFT_BTN_NAME = {
  "Timeline", "Monsters", "Movies", "Change Language", "Help and Credits"
};

final int TITLE_SIZE = 42*scale;

// about global color scheme
final int BG_COLOR = 0;
final int TITLE_COLOR = #81262C;

final int BUTTON_COLOR = #ff6600;
final int POP_UP_COLOR = #342C2C;
final int TEXT_COLOR = 255;
final int CHECK_ITEM_COLOR = 150; // checkbox, filter title, etc

final int PLOT_BG_COLOR = 30;
final int PLOT_LINE_COLOR = 255;

final int CURVE_COLOR_TEMP = 255;
final int BAR_COLOR_TEMP = 255;

final int POP_UP_WINDOW_BG_COLOR = POP_UP_COLOR;
final int POP_UP_WINDOW_TEXT_COLOR = TEXT_COLOR;
final int WINDOW_BOARD_COLOR = #ff6600;//#ff3399;
final int BOARD_WEIGHT = 3*scale;

final int RANGE_COLOR = 125;
final int TIME_LOCK_COLOR = #ff6600;

final int[] CLUSTER_COLOR = {
  #ff0000, #00ff00, #0000ff, 255, 255, 255, 255
}; //change

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

// about Year button
final float YEAR_BUTTON_X = 0.82*Width;
final float YEAR_BUTTON_W = 80*scale;
final float YEAR_BUTTON_H = 40*scale;
final float YEAR_BUTTON_Y = Height - YEAR_BUTTON_H*3.6 - 50*scale;

// about Decade button
final float DECADE_BUTTON_X = 0.82*Width;
final float DECADE_BUTTON_W = 80*scale;
final float DECADE_BUTTON_H = 40*scale;
final float DECADE_BUTTON_Y = Height - DECADE_BUTTON_H*2.4 - 50*scale;

// about Tabular button
final float TABULAR_BUTTON_X = 0.82*Width;
final float TABULAR_BUTTON_W = 80*scale;
final float TABULAR_BUTTON_H = 40*scale;
final float TABULAR_BUTTON_Y = Height - TABULAR_BUTTON_H*1.2 - 50*scale;

// about RIGHT BAR
final float RIGHT_BAR_WIDTH = Width*0.1;
final float RIGHT_BAR_Y_1 = Height*0.0;
final float RIGHT_BAR_Y_2 = Height*1.0;
final float FILTER_X = Width - 180*scale;
final float FILTER_Y = 100*scale;
final float FILTER_DIFF = 80*scale;
final float LABEL_WIDTH = 100*scale;


final String[] FILTER_TXT_1 = {
  "MONSTERS:\n Godzilla, Vampire", "GENRES:\n Musical", "QUALITY:\n >7.0", "FORMAT:\n Color", "BUDGET:\n high", "POPULARITY:\n >4000 votes"
};
final String[] FILTER_TXT_2 = FILTER_TXT_1;

// about Filters

// General CheckItem values
final float CHECK_BOX_WIDTH = 15*scale;
final float CHECK_ITEM_HEIGHT = CHECK_BOX_WIDTH;


final float TITLE_TO_BOX = 14*scale;
final float RELATIVE_WIDTH = 8.2;
final float RELATIVE_WIDTH_GENERAL = 15;
final int NUMBER_EACH_LINE = 3;
final int NUMBER_EACH_LINE_GENERAL = 1;

// FIRST_PAGE_FILTER_X is decided by RIGHT_BAR_WIDTH and FIRST_PAGE_FILTER_W
//final float FIRST_PAGE_FILTER_X = 0.6*Width;
final float FIRST_PAGE_FILTER_Y = 0.4*Height;
final float FIRST_PAGE_FILTER_W = 0.7*Width - RIGHT_BAR_WIDTH;
final float FIRST_PAGE_FILTER_H = Height - FIRST_PAGE_FILTER_Y;
final float FPF_BTN_X_RELATIVE = 0.9;
final float FPF_BTN_Y_RELATIVE = 0.85;
final float FPF_BTN_W = 60*scale;
final float FPF_BTN_H = 30*scale;

// Monster
final float FILTER_MONSTER_X_RELATIVE = 0.02;
final float FILTER_MONSTER_Y_RELATIVE = 0.1;
final float FILTER_MONSTER_W = FIRST_PAGE_FILTER_W;
final float FILTER_MONSTER_H = CHECK_ITEM_HEIGHT;
final String[] MONSTER_TYPE = {
  " demon", " dracula", " female-vampire", " freddy-krueger", " ghost", " godzilla", " invisible-man", " jason", " living-dead", " michael-myers", " mr-hyde", " mummy", " mutant", " muted-cretures", " supernatural", " swamp", " vampire", " werewolf", " witch-wizrds"
};
final int FILTER_MONSTER_NUM = MONSTER_TYPE.length;

// Genres
final float FILTER_GENRE_X_RELATIVE = 0.42;
final float FILTER_GENRE_Y_RELATIVE = 0.1;
final float FILTER_GENRE_W = FIRST_PAGE_FILTER_W;
final float FILTER_GENRE_H = CHECK_ITEM_HEIGHT;
final int FILTER_GENRE_NUM = 27;
final String[] GENRE_TYPE = {
  " Action", " Adventure", " Animation", " Biography", " Comedy", " Crime", " Drama", " Experimental", " Family", " Fantasy", " Film-Noir", " Game-Show", " History", " Horror", " Music", " Musical", " Mystery", " News", " Reality TV", " Romance", " Sci-Fi", " Short", " Sport", " Talk-Show", " Thriller", " War", " Western"
};

// Rating (Quality)
final float FILTER_QUALITY_X_RELATIVE = 0.51;
final float FILTER_QUALITY_Y_RELATIVE = 0.1;
final float FILTER_QUALITY_W = FIRST_PAGE_FILTER_W;
final float FILTER_QUALITY_H = CHECK_ITEM_HEIGHT;
final int FILTER_QUALITY_NUM = 10;

// Votes (Popularity)
final float FILTER_POPULARITY_X_RELATIVE = 0.51;
final float FILTER_POPULARITY_Y_RELATIVE = 0.30;
final float FILTER_POPULARITY_W = FIRST_PAGE_FILTER_W;
final float FILTER_POPULARITY_H = CHECK_ITEM_HEIGHT;
final int FILTER_POPULARITY_NUM = 10; //change

// Budget
final float FILTER_BUDGET_X_RELATIVE = 0.01;
final float FILTER_BUDGET_Y_RELATIVE = 0.68;
final float FILTER_BUDGET_W = FIRST_PAGE_FILTER_W;
final float FILTER_BUDGET_H = CHECK_ITEM_HEIGHT;
final int FILTER_BUDGET_NUM = 3;

// Format
final float FILTER_FORMAT_X_RELATIVE = 0.01;
final float FILTER_FORMAT_Y_RELATIVE = 0.84;
final float FILTER_FORMAT_W = FIRST_PAGE_FILTER_W;
final float FILTER_FORMAT_H = CHECK_ITEM_HEIGHT;
final int FILTER_FORMAT_NUM = 3;
final int NUMBER_OF_FORMAT = 3;
final String[] KIND_TYPE = {
  " Movie", " TV Movie", " Video Movie"
};

// General
final float FILTER_GENERAL_X_RELATIVE = 0.82;
final float FILTER_GENERAL_Y_RELATIVE = 0.1;
final float FILTER_GENERAL_W = FIRST_PAGE_FILTER_W;
final float FILTER_GENERAL_H = CHECK_ITEM_HEIGHT;
final int FILTER_GENERAL_NUM = 6;
final String[] FILTER_TYPE = {
  " BUDGET", " QUALITY", " FORMAT", " POPULARITY", " COUNTRY", " CERTIFICATE"
};
final int[] NUMBER_OF_CLUSTERS = {
	3,3,3,3,7,7
};

// aoubt First Page Plot

final int YEAR_MAX = 2012;
final int YEAR_MIN = 1890;

final float PLOT_1_X1 = 100*scale;
final float PLOT_1_X2 = 1300*scale;
final float PLOT_2_X1 = PLOT_1_X1;
final float PLOT_2_X2 = PLOT_1_X2;

final float PLOT_1_Y1 = Height*0.2;
final float PLOT_1_Y2 = Height*0.5;
final float PLOT_2_Y2 = Height*0.55;
final float PLOT_2_Y1 = Height*0.85;

final int OUTLINE_WIDTH = 4*scale;
final int INLINE_WIDTH = scale;

final int UPPER_LEFT = 0;
final int UPPER_RIGHT = 1;
final int LOWER_LEFT = 2;
final int LOWER_RIGHT = 3;

final float POP_UP_MENU_W = 200*scale;
final int POP_UP_MENU_N = 4; //change
final float POP_UP_BUTTON_H = 30*scale;
final String[] POP_UP_BUTTON_NAME = {
  "Top 10 Monsters of Decade", "Top 10 Monsters overall", "ATTENTION!", "MONSTER IN UIC"
};

final int TOP_10_WINDOW = 0;
final int TOP_10_OVERALL = 1;
final int TEMP_WINDOW_1 = 2;
final int TEMP_WINDOW_2 = 3;
final int[] POP_UP_WINDOW = {
  TOP_10_WINDOW, TOP_10_OVERALL, TEMP_WINDOW_1, TEMP_WINDOW_2
};
final float POP_UP_WINDOW_X = 0.5*Width; //change
final float POP_UP_WINDOW_Y = 0.45*Height;
final float POP_UP_WINDOW_W = 0.5*Width;
final float POP_UP_WINDOW_H = 0.8*Height;

// about Range
final float RANGE_X = PLOT_1_X1;
final float RANGE_W = PLOT_1_X2 - PLOT_1_X1;
final float RANGE_H = 6*scale;
final float RANGE_LOCK_W = 7*scale;
final float RANGE_LOCK_H = 7*scale;

final float RANGE_Y = Height*0.9;

//
//
final int YEAR_MODE = 0;
final int DECADE_MODE = 1;
final int TABULAR_MODE = 2;

