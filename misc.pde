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
final float HELP_WINDOW_w = 800*scale;
final float HELP_WINDOW_h = 400*scale;

final int yearMin = 1890;
final int yearMax = 2009;

// aobut LEFT BAR
final float LEFT_BAR_DEFAULT_WIDTH = 30*scale;
final float LEFT_MENU_WIDTH = 200*scale;
final int BTN_NUMBER = 6;
final float BTN_H = 30*scale;
String[][] LEFT_BTN_NAME = {
  {"Timeline","时间线"},
  {"Monsters","怪物"},
  {"Movies","影片"},
  {"English/中文","中文/English"},
  {"Help","帮助"},
  {"Credits","关于"}
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

final color[] CLUSTER_COLOR = {
  //#ff0000, #01b2f1, #0000ff, color(255,0,255), #ff6600, color(255,255,255), #00ff00
  //0xffffcc,0xd9f0a3,0xaddd8e,0x78c679,0x41ab5d,0x238443,0x005a32
  //0x66c2a5,0xfc8d62,0x8da0cb,0xe78ac3,0xa6d854,0xffd92f,0xe5c494
  //0x1b9e77,0xd95f02,0x7570b3,0xe7298a,0x66a61e,0xe6ab02,0xa6761d
  #b3de69, #fdb462, #80b1d3, #fb8072, #bebada, #ffffb3,#8dd3c7
}; //change
final color[] CLUSTER_COLOR_TRAN = {
  //0x50ff0000, 0x5001b2f1, 0x500000ff, color(255,0,255,80), 0x50ff6600, color(255,255,255,80), 0x5000ff00
  //0x50ffffcc,0x50d9f0a3,0x50addd8e,0x5078c679,0x5041ab5d,0x50238443,0x50005a32
  //0x5066c2a5,0x50fc8d62,0x508da0cb,0x50e78ac3,0x50a6d854,0x50ffd92f,0x50e5c494
  //0x501b9e77,0x50d95f02,0x507570b3,0x50e7298a,0x5066a61e,0x50e6ab02,0x50a6761d
  0x50b3de69, 0x50fdb462, 0x5080b1d3, 0x50fb8072, 0x50bebada, 0x50ffffb3,0x50dd3c7
};
// red green blizzard blue pink yellow white
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
final int HOW_MANY_FILTERS = 3;
final int HOW_MANY_GRAPH = 2;

// about Y button
final float Y_BUTTON_X = 0.76*Width;
final float Y_BUTTON_W = 80*scale;
final float Y_BUTTON_H = 40*scale;
final float Y_BUTTON_Y = Height*0.4;

// about Year button
final float YEAR_BUTTON_X = Y_BUTTON_X;
final float YEAR_BUTTON_W = Y_BUTTON_W;
final float YEAR_BUTTON_H = Y_BUTTON_H;
final float YEAR_BUTTON_Y = Height - YEAR_BUTTON_H*3.6 - 50*scale;

// about Decade button
final float DECADE_BUTTON_X = Y_BUTTON_X;
final float DECADE_BUTTON_W = Y_BUTTON_W;
final float DECADE_BUTTON_H = Y_BUTTON_H;
final float DECADE_BUTTON_Y = Height - DECADE_BUTTON_H*2.4 - 50*scale;

// about Tabular button
final float TABULAR_BUTTON_X = Y_BUTTON_X;
final float TABULAR_BUTTON_W = Y_BUTTON_W;
final float TABULAR_BUTTON_H = Y_BUTTON_H;
final float TABULAR_BUTTON_Y = Height - TABULAR_BUTTON_H*1.2 - 50*scale;


// about Tabular control buttons
final float PRE_DECADE_BTN_X = Width*0.35;
final float PRE_DECADE_BTN_W = Y_BUTTON_W;
final float PRE_DECADE_BTN_H = Y_BUTTON_H;
final float PRE_DECADE_BTN_Y = Height*0.95 - PRE_DECADE_BTN_H*0.5;  // center will be at 95%

final float PRE_YEAR_BTN_X = PRE_DECADE_BTN_X + PRE_DECADE_BTN_W * 1.1;
final float PRE_YEAR_BTN_W = Y_BUTTON_W;
final float PRE_YEAR_BTN_H = Y_BUTTON_H;
final float PRE_YEAR_BTN_Y = PRE_DECADE_BTN_Y;

final float NEXT_YEAR_BTN_X = PRE_YEAR_BTN_X + PRE_YEAR_BTN_W * 1.1;
final float NEXT_YEAR_BTN_W = Y_BUTTON_W;
final float NEXT_YEAR_BTN_H = Y_BUTTON_H;
final float NEXT_YEAR_BTN_Y = PRE_DECADE_BTN_Y;

final float NEXT_DECADE_BTN_X = NEXT_YEAR_BTN_X + NEXT_YEAR_BTN_W * 1.1;
final float NEXT_DECADE_BTN_W = Y_BUTTON_W;
final float NEXT_DECADE_BTN_H = Y_BUTTON_H;
final float NEXT_DECADE_BTN_Y = PRE_DECADE_BTN_Y;

// about RIGHT BAR
final float RIGHT_BAR_WIDTH = Width*0.18;
final float RIGHT_BAR_Y_1 = Height*0.0;
final float RIGHT_BAR_Y_2 = Height*1.0;
final float FILTER_X = Width - 180*scale;
final float FILTER_Y = 100*scale;
final float FILTER_DIFF = 80*scale;
final float LABEL_WIDTH = 100*scale;


final String[][] FILTER_TXT_1 = {
  {"MONSTER:\n          vampire","怪物：\n          吸血鬼"},
  {"GENRE:\n","电影类别：\n"},
  {"FILTER:\n          QUALITY","过滤器：\n          评级"}
};
final String[][] FILTER_TXT_2 = {
  {"MONSTER:\n          vampire","怪物：\n          吸血鬼"},
  {"GENRE:\n","电影类别：\n"},
  {"FILTER:\n          POPULARITY","过滤器：\n          热度"}
};
//final String FILTER_TXT_1 = "1111";
//final String FILTER_TXT_2 = "2222";

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
final float FIRST_PAGE_FILTER_Y = 0.3*Height;
final float FIRST_PAGE_FILTER_W = 0.6*Width;// - RIGHT_BAR_WIDTH;
final float FIRST_PAGE_FILTER_H = Height - FIRST_PAGE_FILTER_Y;
final float FPF_BTN_X_RELATIVE = 0.9;
final float FPF_BTN_Y_RELATIVE = 0.85;
final float FPF_BTN_W = 60*scale;
final float FPF_BTN_H = 30*scale;

final float LEGEND_HEIGHT = 25*scale;
final float LEGEND_WIDTH = 28*scale;

// Monster
final float FILTER_MONSTER_X_RELATIVE = 0.02;
final float FILTER_MONSTER_Y_RELATIVE = 0.1;
final float FILTER_MONSTER_W = FIRST_PAGE_FILTER_W;
final float FILTER_MONSTER_H = CHECK_ITEM_HEIGHT;
String[][] MONSTER_TYPE = {
  {" alien"," 异形"},
  {" animal"," 动物"},
  {" demon"," 恶魔"},
  {" dinosaur"," 恐龙"},
  {" dracula"," 德古拉"},
  {" female-vampire"," 女吸血鬼"},
  {" frankenstein"," 弗兰肯斯坦"},
  {" freddy-krueger"," 弗莱德"},
  {" ghost"," 鬼"},
  {" giant"," 巨人"},
  {" godzilla"," 哥斯拉"},
  {" humanoids"," 类人"},
  {" invisible-man"," 隐形人"},
  {" jason"," 杰森"},
  {" living-dead"," 活死人"},
  {" michael-myers"," 迈克梅尔"},
  {" mr-hyde"," 海德先生"},
  {" mummy"," 木乃伊"},
  {" mutant"," 变种人"},
  {" muted-cretures"," 变异生物"},
  {" piranha"," 食人鱼"},
  {" possessed"," 附魔"},
  {" predator"," 铁血战士"},
  {" shark"," 鲨鱼"},
  {" snake"," 蛇"},
  {" supernatural"," 超自然"},
  {" swamp"," 斯万普"},
  {" vampire"," 吸血鬼"},
  {" werewolf"," 狼人"},
  {" witch-wizards"," 巫师"},
  {" zombie"," 僵尸"}
};
final int FILTER_MONSTER_NUM = MONSTER_TYPE.length;

// Genres
final float FILTER_GENRE_X_RELATIVE = 0.42;
final float FILTER_GENRE_Y_RELATIVE = 0.1;
final float FILTER_GENRE_W = FIRST_PAGE_FILTER_W;
final float FILTER_GENRE_H = CHECK_ITEM_HEIGHT;
final int FILTER_GENRE_NUM = 27;
String[][] GENRE_TYPE = {
  {" Action"," 动作"},
  {" Adventure"," 冒险"},
  {" Animation"," 动画"},
  {" Biography"," 传记"},
  {" Comedy"," 喜剧"},
  {" Crime"," 犯罪"},
  {" Drama"," 戏剧"},
  {" Experimental"," 试验"},
  {" Family"," 家庭"},
  {" Fantasy"," 幻想"},
  {" Film-Noir"," 黑色"},
  {" Game-Show"," 游戏"},
  {" History"," 历史"},
  {" Horror"," 恐怖"},
  {" Music"," 音乐"},
  {" Musical"," 音乐"},
  {" Mystery"," 神秘"},
  {" News"," 新闻"},
  {" Reality TV"," 真视"},
  {" Romance"," 浪漫"},
  {" Sci-Fi"," 科幻"},
  {" Short"," 短片"},
  {" Sport"," 运动"},
  {" Talk-Show"," 脱口"},
  {" Thriller"," 惊悚"},
  {" War"," 战争"},
  {" Western"," 西部"}
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
final int NUMBER_OF_FILTERS = FILTER_GENERAL_NUM * 2;
String[][] FILTER_TYPE = {
  {" BUDGET"," 预算"},
  {" QUALITY"," 评分"},
  {" FORMAT"," 格式"},
  {" POPULARITY"," 热度"},
  {" COUNTRY"," 国家"},
  {" CERTIFICATE"," 评级"}
};
final int BUDGET = 0;
final int QUALITY = 1;
final int FORMAT = 2;
final int POPULARITY = 3;
final int COUNTRY = 4;
final int CERTIFICATE = 5;

final int[] NUMBER_OF_CLUSTERS = {
	3,3,3,3,7,7
};

// aoubt First Page Plot

final int YEAR_MAX = 2012;
final int YEAR_MIN = 1890;

//
final float PLOT_1_X1 = 75*scale;
final float PLOT_1_X2 = 1225*scale;
final float PLOT_2_X1 = PLOT_1_X1;
final float PLOT_2_X2 = PLOT_1_X2;

final float PLOT_1_Y1 = Height*0.15;
final float PLOT_1_Y2 = Height*0.5;
final float PLOT_2_Y2 = Height*0.55;
final float PLOT_2_Y1 = Height*0.9;

/*/
final float PLOT_1_X1 = 100*scale;
final float PLOT_1_X2 = 680*scale;
final float PLOT_2_X1 = 720*scale;
final float PLOT_2_X2 = 1300*scale;

final float PLOT_1_Y1 = Height*0.2;
final float PLOT_1_Y2 = Height*0.85;
final float PLOT_2_Y2 = Height*0.2;
final float PLOT_2_Y1 = Height*0.85;
/*/

final int OUTLINE_WIDTH = 4*scale;
final int INLINE_WIDTH = scale;

final int UPPER_LEFT = 0;
final int UPPER_RIGHT = 1;
final int LOWER_LEFT = 2;
final int LOWER_RIGHT = 3;

final float POP_UP_MENU_W = 200*scale;
final int POP_UP_MENU_N = 4; //change
final float POP_UP_BUTTON_H = 30*scale;
String[][] POP_UP_BUTTON_NAME = {
  {"Top 10 Monsters of Decade", "十年出镜率最高十佳怪物"},
  {"Top 10 Monsters overall","出镜率最高十佳怪物(总)"},
  {"Movie in this year","本年影片"},
  {"No events in this decade","本年代无大事件"}
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
final float POP_UP_WINDOW_W = 0.8*Width;
final float POP_UP_WINDOW_H = 0.8*Height;

// about Range
final float RANGE_X = PLOT_1_X1;
//final float RANGE_W = PLOT_1_X2 - PLOT_1_X1;
final float RANGE_W = PLOT_2_X2 - PLOT_1_X1;
final float RANGE_H = 6*scale;
final float RANGE_LOCK_W = 7*scale;
final float RANGE_LOCK_H = 7*scale;

final float RANGE_Y = Height*0.95;

//
//
final int YEAR_MODE = 0;
final int DECADE_MODE = 1;
final int TABULAR_MODE = 2;

