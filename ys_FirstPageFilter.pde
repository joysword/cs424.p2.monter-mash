class ys_FirstPageFilter {

  float x, y, w, h;

  FilterMonster monF;
  FilterGenre genF;
  //FilterFormat forF;
  //FilterQuality quaF;
  //FilterPopularity popF;
  //FilterBudget budF;
  FilterGeneral generalF;


  //ArrayList<ys_IdGenrePair> idGenre;
  //ArrayList<ys_IdQualityPair> idQuality;
  //ArrayList<ys_IdPopularityPair> idPopularity;
  //ArrayList<ys_IdBudgetPair> idBudget;
  //ArrayList<Integer> idFormat;

  //change
  //ArrayList<Integer> idMonster;


  String filter_temp;
  String filter_current;

  float btnx, btny, btnw, btnh;

  boolean isDisplay;

  ys_FirstPageFilter(float _x, float _y, float _w, float _h, float bx, float by, float bw, float bh) {

    x = _x;
    y = _y;
    w = _w;
    h = _h;

    btnx = bx;
    btny = by;
    btnw = bw;
    btnh = bh;

    // change construtor parameters
    monF = new FilterMonster(x+FILTER_MONSTER_X_RELATIVE * w, y+FILTER_MONSTER_Y_RELATIVE * h, FILTER_MONSTER_W, FILTER_MONSTER_H, FILTER_MONSTER_NUM);
    genF = new FilterGenre(x+FILTER_GENRE_X_RELATIVE * w, y+FILTER_GENRE_Y_RELATIVE * h, FILTER_GENRE_W, FILTER_GENRE_H, FILTER_GENRE_NUM);
    //forF = new FilterFormat(x+FILTER_FORMAT_X_RELATIVE * w, y+FILTER_FORMAT_Y_RELATIVE * h, FILTER_FORMAT_W, FILTER_FORMAT_H, FILTER_FORMAT_NUM);
    //quaF = new FilterQuality(x+FILTER_QUALITY_X_RELATIVE * w, y+FILTER_QUALITY_Y_RELATIVE * h, FILTER_QUALITY_W, FILTER_QUALITY_H, FILTER_QUALITY_NUM);
    //popF = new FilterPopularity(x+FILTER_POPULARITY_X_RELATIVE * w, y+FILTER_POPULARITY_Y_RELATIVE * h, FILTER_POPULARITY_W, FILTER_POPULARITY_H, FILTER_POPULARITY_NUM);
    //budF = new FilterBudget(x+FILTER_BUDGET_X_RELATIVE * w, y+FILTER_BUDGET_Y_RELATIVE * h, FILTER_BUDGET_W, FILTER_BUDGET_H, FILTER_BUDGET_NUM);
    generalF = new FilterGeneral(x+FILTER_GENERAL_X_RELATIVE * w, y+FILTER_GENERAL_Y_RELATIVE * h, FILTER_GENERAL_W, FILTER_GENERAL_H, FILTER_GENERAL_NUM);

    isDisplay = false;

    //idGenre = new ArrayList<ys_IdGenrePair>();
    //idQuality = new ArrayList<ys_IdQualityPair>();
    //idPopularity = new ArrayList<ys_IdPopularityPair>();
    //idBudget = new ArrayList<ys_IdBudgetPair>();

    //idFormat = new ArrayList<Integer>();

    //change
    //idMonster = new ArrayList<Integer>();
  }

  void render(int i) {
    pushStyle();
    fill(POP_UP_COLOR); //change
    noStroke();
    rectMode(CORNER);
    rect(x, y, w, h);
    strokeWeight(BOARD_WEIGHT);
    stroke(BUTTON_COLOR); //orange
    line(x+w*0.4, y, x+w*0.4, y+h);
    line(x+w*0.8, y, x+w*0.8, y+h);
    textAlign(LEFT, BOTTOM);
    switch (i) {
    case 0:
      fill(#01b2f1);
      break;
    case 1:
      fill(#29C16B);
      break;
    }
    textSize(24*scale);
    text(SELECT_FILTER[LA] + (i+1) + ":", x+5*scale, y-5*scale);//change
    fill(BUTTON_COLOR);
    noStroke();
    rect(btnx, btny, btnw, btnh);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(13*scale);
    text(UPDATE[LA], btnx + btnw*0.5, btny + btnh*0.5);
    popStyle();

    monF.render();
    genF.render();
    //forF.render();
    //quaF.render();
    //popF.render();
    //budF.render();
    generalF.render();
  }


  void update(float posx, float posy, cc_DatabaseManager db, int whichFilter) {

    if (posx>btnx && posx < btnx + btnw && posy>btny && posy<btny + btnh) {
      updateConfirm(posx, posy, db, whichFilter);
    }
    else {
      updateFilter(posx, posy);
    }
  }

  // update all filters
  private void updateFilter(float x, float y) {

    monF.update(x, y);
    genF.update(x, y);
    //forF.update(x, y);
    //quaF.update(x, y);
    //popF.update(x, y);
    //budF.update(x, y);
    generalF.update(x, y);
  }

  // update data to show
  private void updateConfirm(float x, float y, cc_DatabaseManager db, int whichFilter) {
    filter_current = filter_temp;
    isDisplay = false;

    // get which monster
    int monId = monF.getMonsterType();
    String[] mon = new String[2];
    mon[0] = "";
    mon[1] = "";
    if (monId >= 0 && monId < FILTER_MONSTER_NUM) {
      mon[0] = MONSTER_TYPE[monId][0].substring(1); // get rid of space
      mon[1] = MONSTER_TYPE[monId][1].substring(1); // get rid of space
    }

    // get which genre
    int genId = genF.getGenreType();
    String[] gen = new String[2];
    gen[0] = "";
    gen[1] = "";
    if (genId >= 0 && genId < FILTER_GENRE_NUM) {
      gen[0] = GENRE_TYPE[genId][0].substring(1);  // get rid of space
      gen[1] = GENRE_TYPE[genId][1].substring(1);  // get rid of space
    } 

    // get which filter
    currentFilter[whichFilter] = generalF.getFilterType();

    //test function
    if (whichFilter == 0) {
      switch(currentFilter[0]) {
        case CERTIFICATE:
        plot_data[CERTIFICATE] = ui.getDB().getCertificates(gen[0], mon[0]);
        dataMax1 = getMax(plot_data[CERTIFICATE]);
        dataMax1_decade = getMax_decade(plot_data[CERTIFICATE]);
        break;
        case FORMAT:
        plot_data[FORMAT] = ui.getDB().getFormat(gen[0], mon[0]);
        dataMax1 = getMax(plot_data[FORMAT]);
        dataMax1_decade = getMax_decade(plot_data[FORMAT]);
        break;
        case POPULARITY:
        plot_data[POPULARITY] = ui.getDB().getPopularity(gen[0], mon[0]);
        dataMax1 = getMax(plot_data[POPULARITY]);
        dataMax1_decade = getMax_decade(plot_data[POPULARITY]);
        break;
        case QUALITY:
        plot_data[QUALITY] = ui.getDB().getQuality(gen[0], mon[0]);
        dataMax1 = getMax(plot_data[QUALITY]);
        dataMax1_decade = getMax_decade(plot_data[QUALITY]);
        break;
        case COUNTRY:
        plot_data[COUNTRY] = ui.getDB().getCountries(gen[0],mon[0]);
        dataMax1 = getMax(plot_data[COUNTRY]);
        dataMax1_decade = getMax_decade(plot_data[COUNTRY]);
        break;
        case BUDGET:
        plot_data[BUDGET] = ui.getDB().getBudget(gen[0],mon[0]);
        dataMax1 = getMax(plot_data[BUDGET]);
        dataMax1_decade = getMax_decade(plot_data[BUDGET]);
        break;
      }
      for (int i=0;i<2;i++) {
        filterTxt1[0][i] = MONSTER_TXT[i]+mon[i];
        filterTxt1[1][i] = GENRE_TXT[i]+gen[i];
        filterTxt1[2][i] = FILTER_TXT[i]+FILTER_TYPE[currentFilter[0]][i];
      }
    }
    else if (whichFilter == 1){
      switch(currentFilter[1]) {
        case CERTIFICATE:
        plot_data[CERTIFICATE+6] = ui.getDB().getCertificates(gen[0], mon[0]);
        dataMax2 = getMax(plot_data[CERTIFICATE+6]);
        dataMax2_decade = getMax_decade(plot_data[CERTIFICATE+6]);
        break;
        case FORMAT:
        plot_data[FORMAT+6] = ui.getDB().getFormat(gen[0], mon[0]);
        dataMax2 = getMax(plot_data[FORMAT+6]);
        dataMax2_decade = getMax_decade(plot_data[FORMAT+6]);
        break;
        case POPULARITY:
        plot_data[POPULARITY+6] = ui.getDB().getPopularity(gen[0], mon[0]);
        dataMax2 = getMax(plot_data[POPULARITY+6]);
        dataMax2_decade = getMax_decade(plot_data[POPULARITY+6]);
        break;
        case QUALITY:
        plot_data[QUALITY+6] = ui.getDB().getQuality(gen[0], mon[0]);
        dataMax2 = getMax(plot_data[QUALITY+6]);
        dataMax2_decade = getMax_decade(plot_data[QUALITY+6]);
        break;
        case COUNTRY:
        plot_data[COUNTRY+6] = ui.getDB().getCountries(gen[0],mon[0]);
        dataMax2 = getMax(plot_data[COUNTRY+6]);
        dataMax2_decade = getMax_decade(plot_data[COUNTRY+6]);
        break;
        case BUDGET:
        plot_data[BUDGET+6] = ui.getDB().getBudget(gen[0],mon[0]);
        dataMax2 = getMax(plot_data[BUDGET+6]);
        dataMax2_decade = getMax_decade(plot_data[BUDGET+6]);
        break;
      }
      for (int i=0;i<2;i++) {
        filterTxt2[0][i] = MONSTER_TXT[i]+mon[i];
        filterTxt2[1][i] = GENRE_TXT[i]+gen[i];
        filterTxt2[2][i] = FILTER_TXT[i]+FILTER_TYPE[currentFilter[1]][i];
      }
    }

    dataMax = (dataMax1 > dataMax2)? dataMax1:dataMax2;
    dataMax_decade = (dataMax1_decade > dataMax2_decade)? dataMax1_decade:dataMax2_decade;
  
    // close the Filter Panel
    ui.getFirstPage().setNotSelecting();
  }

  private float getMax(ArrayList<Instance> li) {
    float dataM = 0;
    for (int i=0;i<li.size();i++) {
      float temp_value = 0;
      for (int j=0;j<7;j++) {
        temp_value += li.get(i).getting(j);
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }
    return dataM * 1.05;
  }

  private float getMax_decade(ArrayList<Instance> li) {
    float dataM = 0;
    for (int i=0;i<11;i++) {

      float temp_value = 0;
      for (int j=(i*10);j<i*10+10 && j<li.size();j++) {
        for (int k=0;k<7;k++) {
          temp_value += li.get(j).getting(k);
        }
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }

    return dataM * 1.05;
  }
}

