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
    text("Select Filters for Graph " + (i+1) + ":", x+5*scale, y-5*scale);//change
    fill(BUTTON_COLOR);
    noStroke();
    rect(btnx, btny, btnw, btnh);
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(13*scale);
    text("UPDATE", btnx + btnw*0.5, btny + btnh*0.5);
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

    //ArrayList<Integer> monL = monF.getList(db);
    //ArrayList<ys_IdGenrePair> genL = genF.getList(db);
    //ArrayList<Integer> forL = forF.getList(db);
    //ArrayList<ys_IdQualityPair> quaL = quaF.getList(db);
    //ArrayList<ys_IdPopularityPair> popL = popF.getList(db);
    //ArrayList<ys_IdBudgetPair> budL = budF.getList(db);

    // get which monster
    int monId = monF.getMonsterType();
    String mon = "";
    if (monId >= 0 && monId < FILTER_MONSTER_NUM) {
      mon = MONSTER_TYPE[monId].substring(1); // get rid of space
    }

    // get which genre
    int genId = genF.getGenreType();
    String gen = "";
    if (genId >= 0 && genId < FILTER_GENRE_NUM) {
      gen = GENRE_TYPE[genId].substring(1);  // get rid of space
    }

    // get which filter
    currentFilter = generalF.getFilterType();

    //test function
    // mon = -1
    // gen = -1

    if (whichFilter == 0) {
      switch(currentFilter) {
        case CERTIFICATE:
        plot_1_certificate = ui.getDB().getCertificates(gen, mon);
        dataMax1 = getMax7(plot_1_certificate);
        dataMax1_decade = getMax7_decade(plot_1_certificate);
        break;
        case FORMAT:
        plot_1_format = ui.getDB().getFormat(gen, mon);
        dataMax1 = getMax3(plot_1_format);
        dataMax1_decade = getMax3_decade(plot_1_format);
        break;
        case POPULARITY:
        plot_1_popularity = ui.getDB().getPopularity(gen, mon);
        dataMax1 = getMax3(plot_1_popularity);
        dataMax1_decade = getMax3_decade(plot_1_popularity);
        break;
        case QUALITY:
        plot_1_quality = ui.getDB().getQuality(gen, mon);
        dataMax1 = getMax3(plot_1_quality);
        dataMax1_decade = getMax3_decade(plot_1_quality);
        break;
        case COUNTRY:
        plot_1_country = ui.getDB().getCountries(gen,mon);
        dataMax1 = getMaxCountry(plot_1_country);
        dataMax1_decade = getMaxCountry_decade(plot_1_country);
        case BUDGET:
      }
      filterTxt1[0] = "MONSTERS:\n "+mon;
      filterTxt1[1] = "GENRES:\n "+gen;
      filterTxt1[2] = "FILTER:\n"+FILTER_TYPE[currentFilter];
    }
    else if (whichFilter == 1){
      switch(currentFilter) {
        case CERTIFICATE:
        plot_2_certificate = ui.getDB().getCertificates(gen, mon);
        dataMax2 = getMax7(plot_2_certificate);
        dataMax2_decade = getMax7_decade(plot_2_certificate);
        break;
        case FORMAT:
        plot_2_format = ui.getDB().getFormat(gen, mon);
        dataMax2 = getMax3(plot_2_format);
        dataMax2_decade = getMax3_decade(plot_2_format);
        break;
        case POPULARITY:
        plot_2_popularity = ui.getDB().getPopularity(gen, mon);
        dataMax2 = getMax3(plot_2_popularity);
        dataMax2_decade = getMax3_decade(plot_2_popularity);
        break;
        case QUALITY:
        plot_2_quality = ui.getDB().getQuality(gen, mon);
        dataMax2 = getMax3(plot_2_quality);
        dataMax2_decade = getMax3_decade(plot_2_quality);
        break;
        case COUNTRY:
        plot_2_country = ui.getDB().getCountries(gen,mon);
        dataMax2 = getMaxCountry(plot_2_country);
        dataMax2_decade = getMaxCountry_decade(plot_2_country);
        case BUDGET:
      }
      filterTxt2[0] = "MONSTERS:\n "+mon;
      filterTxt2[1] = "GENRES:\n "+gen;
      filterTxt2[2] = "FILTER:\n"+FILTER_TYPE[currentFilter];
    }

    dataMax = (dataMax1 > dataMax2)? dataMax1:dataMax2;
    //global_country;
    //global_budget;
  }

  private float getMax3(ArrayList<Instance> li) {
    float dataM = 0;
    for (int i=0;i<li.size();i++) {
      float temp_value = 0;
      for (int j=0;j<3;j++) {
        temp_value += li.get(i).get(j);
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }
    return dataM * 1.05;
  }

  private float getMax7(ArrayList<Instance> li) {
    float dataM = 0;
    for (int i=0;i<li.size();i++) {
      float temp_value = 0;
      for (int j=0;j<7;j++) {
        temp_value += li.get(i).get(j);
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }
    return dataM * 1.05;
  }

  private float getMaxCountry(ArrayList<Instance> li) {
    float dataM = 0;
    for (int i=0;i<li.size();i++) {
      float temp_value = 0;
      for (int j=0;j<7;j++) {
        temp_value += li.get(i).get(j);
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }
    return dataM * 1.05;
  }

  private float getMax3_decade(ArrayList<Instance> li) {
    float dataM = 0;

    for (int i=0;i<11;i++) {

      float temp_value = 0;
      for (int j=(i*10);j<i*10+10 && j<li.size();j++) {
        for (int k=0;k<3;k++) {
          temp_value += plot_1_certificate.get(j).get(k);
        }
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }

    return dataM * 1.05;
  }

  private float getMax7_decade(ArrayList<Instance> li) {
    float dataM = 0;

    for (int i=0;i<11;i++) {

      float temp_value = 0;
      for (int j=(i*10);j<i*10+10 && j<li.size();j++) {
        for (int k=0;k<7;k++) {
          temp_value += plot_1_certificate.get(j).get(k);
        }
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }

    return dataM * 1.05;
  }
  private float getMaxCountry_decade(ArrayList<Instance> li) {
    float dataM = 0;

    for (int i=0;i<11;i++) {

      float temp_value = 0;
      for (int j=(i*10);j<i*10+10 && j<li.size();j++) {
        for (int k=0;k<7;k++) {
          temp_value += plot_1_certificate.get(j).get(k);
        }
      }
      if (temp_value > dataM) {
        dataM = temp_value;
      }
    }

    return dataM * 1.05;
  }
}

