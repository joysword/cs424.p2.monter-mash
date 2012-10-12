class FirstPlot{

  float dataMin;
  float dataMax;
  float originalDataMax;

  float plotX1, plotX2, plotY1, plotY2;
  float unitWidth;

  int yearMin, yearMax;
  int showYearMin, showYearMax;
  int yearCount;

  //Integrator[] interpolators;

  //float[] spacing; // for dashline

  //Legend[] legend;

  boolean isDragLeft;
  boolean isDragRight;
  boolean isDrag;

  float dataScale;
  float dragStartY;

  boolean showTable;

  int yearMode;

  FirstPlot() {

    originalDataMax = dataMax;

    //rowCount = dataSets[0].getData().getRowCount();
    //columnCount = dataSets[0].getData().getColumnCount();

    yearMin = YEAR_MIN;
    yearMax = YEAR_MAX;

    showYearMin = yearMin;
    showYearMax = yearMax;

    /*
    interpolators = new Integrator[columnCount];
     
     for (int column = 0; column < columnCount; column++) {
     float initialValue = data.getFloat(0, column);
     interpolators[column] = new Integrator(initialValue);
     interpolators[column].attraction = 0.1;
     }*/

    // setup Colors
    //colors = new int[] {COLOR_0, COLOR_1, COLOR_2, COLOR_3, COLOR_4, COLOR_5, COLOR_6};

    plotX1 = PLOT_X1;
    plotX2 = PLOT_X2;
    
    //TABLE_WINDOW_X = plotX1-30*scale;
    //TABLE_PAGE_BTN_X = plotX2-TABLE_PAGE_BTN_H*0.5-TABLE_PAGE_BTN_DIFF;

    plotY1 = PLOT_Y1;
    plotY2 = PLOT_Y2;

    //tableY1 = plotY2+20*scale;
    //tableY2 = (Height - 60)*scale;

    //displayNumber = DATA_SET_COUNT;

    //unitHeight = (tableY2-tableY1)/displayNumber;

    dataMin = 0;
    dataMax = 100; //change
    //for (int i=0;i<DATA_SET_COUNT;i++) {
      //dataMax[i] = ceil(dataSets[i].getData().getTableMax()/dataSets[i].getInterval())*dataSets[i].getInterval();
      //originalDataMax[i] = dataMax[i];
    //}
    

    //setupDecade();

    //used by dashline
    //setupDashLine(DASH_LINE_SPACING1, DASH_LINE_SPACING2);

    //dropBox= new DropBox(1, 1, 120, 10, li, inli, 0);
    //dropBox= new DropBox(1, 1, 120);

//
//    legend = new Legend[DATA_SET_COUNT];
//    for (int i=0;i<DATA_SET_COUNT;i++) {
//      legend[i] = new Legend(PAGE_BTN_X+PAGE_BTN_W+LEGEND_DIFF, LIST_Y + (i - 1)*2.1*LIST_LINE_H + 12*scale, LIST_LINE_H, ui.dataSelector[i].getTxt()+"\n"+unitText[i], colors[i]);
//    }

    // setup Pie Charts
//    pieChart = new PieChart[DATA_SET_COUNT];
//    for (int i=0;i<DATA_SET_COUNT;i++) {
//      float[] data = new float[2];
//      data[0] = dataSets[i].getData().getFloat(currentRow[0], ui.getPieButton().getYear()-yearMin);
//      data[1] = dataSets[i].getData().getFloat(getRegion(currentRow[0]), ui.getPieButton().getYear()-yearMin);

//      pieChart[i] = new PieChart(data, 2, defaultColor[i], PIE_CHART_X, PIE_CHART_Y+ i * PIE_CHART_DIS, PIE_CHART_R, i);
//    }
//    pieChart[0].setDisplay();

    showTable = false;

    isDragRight = false;
    isDragLeft = false;
    isDrag = false;

    dataScale = 1;

    yearMode = YEAR_MODE;
  }


  void render() {
    if (showTable == false) {
      yearCount = showYearMax-showYearMin+1;
      unitWidth = (plotX2-plotX1)/yearCount;
      if (yearMode == YEAR_MODE) {
        drawPlot();
      }
      else if (yearMode == DECADE_MODE) {
        drawBar();
      }
    }
    else {
      //drawTable();
    }
    //draw Legend
    //  for (int i=0;i<DATA_SET_COUNT;i++) {
    //    legend[i].render();
    //  }

      //draw pie Title
      //drawPieTitle();
      //draw Pie Charts
      //drawPieCharts();

  //draw Title
  //    if (ui.getDisplayMode() == ONE_COUNTRY_MODE) {
  //      drawTitle(countryNames[currentRow[0]]);
  //    }
  //    if (ui.getDisplayMode() == MULTI_COUNTRY_MODE) {
  //      int i=0;
  //      while (i<DATA_SET_COUNT && ui.getDataSelector(i).getCheck() == false) i++;
  //      if (i<DATA_SET_COUNT)
  //      {
  //        drawTitle(ui.getDataSelector(i).getTxt()+ " " + unitText[i]);
  //      }
  //    }

  //draw TimeLine
  }

  // change
  private void drawTitle(String st) {
    pushStyle();
    fill(0);
    textSize(12*scale);
    textAlign(LEFT, TOP);
    
    popStyle();
  }  

  //void setupDashLine(float sp1, float sp2) {
   //spacing[0] = sp1;
   //spacing[1] = sp2;
   //}

  private void drawPlot() {
    pushStyle();

    fill(PLOT_BG_COLOR);
    strokeWeight(OUTLINE_WIDTH);
    stroke(PLOT_LINE_COLOR);
    rectMode(CORNERS);
    rect(plotX1,plotY1,plotX2,plotY2);

    //drawAxisLabels();

    /*
    for (int column = 0; column < columnCount; column++) {
     interpolators[column].update();
     }*/

    drawYearLabels();

    noFill();
    strokeWeight(INLINE_WIDTH);

  //////////BEGIN OF VOLUME

    // change   
    
    
    
   //////////END OF VOLUME


   /*
    if (ui.getDisplayMode() == ONE_COUNTRY_MODE) {
      for (int i = 0; i < DATA_SET_COUNT; i ++) {
        if (ui.dataSelector[i].getCheck() == true) {
          drawDataCurve(currentRow[0], i, i, showYearMin, showYearMax);
          
          
          // special cases
          
          if (isNansilafu(currentRow[0])) {
            //slavia
            if (currentRow[0] == 67) {
              drawDataCurveDashSpecial(new int[]{79,89,57,59,66},i,i,showYearMin,showYearMax,1992,2005);
              drawDataCurveDashSpecial(new int[]{79,89,57,59,92,86},i,i,showYearMin,showYearMax,2006,2009);
            }
            else {
              drawDataCurveDash(67,i,i,showYearMin,showYearMax,1980,1991);
              if (currentRow[0] == 66) {
               drawDataCurveDashSpecial(new int[]{92,86},i,i,showYearMin,showYearMax,2006,2009);
              }
              else if (currentRow[0] == 92 || currentRow[0] == 86) {
                  drawDataCurveDash(66,i,i,showYearMin,showYearMax,1992,2005);
              }
            }
          }
          else if (isGermany(currentRow[0])) {
            // Germany
            if (currentRow[0] == 69) {
              drawDataCurveDashSpecial(new int[]{70,71},i,i,showYearMin,showYearMax,1980,1990);
            }
            // East or West
            else {
              drawDataCurveDash(69,i,i,showYearMin,showYearMax,1991,2009);
            }
          }
          else if (isCzechSlovakia(currentRow[0])) {
            // Czechoslovakia
            if (currentRow[0] == 65) {
              drawDataCurveDashSpecial(new int[]{61,88},i,i,showYearMin,showYearMax,1993,2009);
            }
            // Czech Slovakia
            else {
              drawDataCurveDash(65, i,i,showYearMin,showYearMax, 1980,1992);
            }
            
          }
          else if (isUSSR(currentRow[0])) {
            // USSR
            if (currentRow[0] == 100) {
              drawDataCurveDash(95, i,i, showYearMin,showYearMax, 1992, 2009);
            }
            // new countries
            else {
              drawDataCurveDash(100,i,i,showYearMin,showYearMax, 1980, 1991);
            }
          }
        }
      }
    }

    if (ui.getDisplayMode() == MULTI_COUNTRY_MODE) {
      for (int i = 0; i < DATA_SET_COUNT; i++) {
        if (ui.dataSelector[i].getCheck() == true) {
          for (int j=0;j < DATA_SET_COUNT; j++) {
            if (currentDisplay[j] == true) {
              drawDataCurve(currentRow[j], j, i, showYearMin, showYearMax);
            }
          }
        }
      }
    }*/

    //drawDataCurve(currentRow[j], j, i, showYearMin, showYearMax);
    drawDataCurve(0,0,0,0,0); //change

    popStyle();
  }

  private void drawBar() {
    pushStyle();
    /*
    fill(245);
    rectMode(CORNERS);
    noStroke();
    rect(plotX1, plotY1, plotX2, plotY2);

    fill(0);
    textSize(10*scale);
    textAlign(CENTER);

    // Use thin, gray lines to draw the grid
    stroke(0);
    strokeWeight(scale);
    float left = plotX1;
    float right = left + (plotX2-plotX1)/3.0;
    for (int column = 0; column < 30; column+=10) {
      float x = (left+right)/2;
      text(years[column] + " - " + years[column+9], x, plotY2 + textAscent() + 5*scale);
      if (column + 10 < yearMax) {
        line(right, plotY2, right, plotY2+3*scale);
      }
      left = right;
      right += (plotX2-plotX1)*0.33;
    }

    noFill();
    strokeWeight(2*scale);

    if (ui.getDisplayMode() == MULTI_COUNTRY_MODE) {
      for (int i = 0; i < DATA_SET_COUNT; i ++) {
        if (ui.dataSelector[i].getCheck() == true) { 
          drawVolumeLabels(i);
          break;
        }
      }
    }
    
    //one country, many data sets
    if (ui.getDisplayMode() == ONE_COUNTRY_MODE) {
      int cnt = 0;
      for (int i=0;i < DATA_SET_COUNT;i++) {
        if (ui.dataSelector[i].getCheck() == true) {
          cnt++;
        }
      }
      // only 1 data set is being displayed
      if (cnt == 1) {
        for (int i=0;i<DATA_SET_COUNT;i++) {
          if (ui.dataSelector[i].getCheck() == true) {
            drawVolumeLabels(i);
            break;
          }
        }
      }
      else {
        drawVolumeLabels(displayVolume);
      }
    }

    if (ui.getDisplayMode() == ONE_COUNTRY_MODE) {
      for (int i = 0; i < DATA_SET_COUNT; i ++) {
        if (ui.dataSelector[i].getCheck() == true) {
          //drawDataCurve(currentRow[0], i, showYearMin, showYearMax);
          drawDataBar(currentRow[0], i, i);
        }
      }
    }

    if (ui.getDisplayMode() == MULTI_COUNTRY_MODE) {
      for (int i = 0; i < DATA_SET_COUNT; i++) {
        if (ui.dataSelector[i].getCheck() == true) {
          for (int j=0;j < DATA_SET_COUNT; j++) {
            if (currentDisplay[j] == true) {
              //drawDataCurve(currentRow[j], j, showYearMin, showYearMax);
              drawDataBar(currentRow[j], i, j);
            }
          }
          break;
        }
      }
    }*/
    popStyle();
  }

  private void drawAxisLabels() {
    pushStyle();/*
    fill(0);
    textSize(13*scale);
    textLeading(15);

    textAlign(RIGHT, CENTER);
    text("What\nthe\nX", labelX, (plotY1+plotY2)/2);
    textAlign(CENTER);
    text("What the Y", (plotX1+plotX2)/2, labelY);*/
    popStyle();
  }

  private void drawYearLabels() {
    pushStyle();

    fill(PLOT_LINE_COLOR);
    textSize(12*scale);
    textAlign(CENTER);

    stroke(100);
    strokeWeight(scale);

    
    float x = plotX1 + unitWidth*0.5;
    if (yearCount > 80) {
      for (int i=0;i<yearCount;i+=5) {
        text(showYearMin+i, x, plotY2 + textAscent() + 5*scale);
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth*5;
      }
    }
    else if (yearCount > 50) {
      for (int i=0;i<yearCount;i+=3) {
        text(showYearMin+i, x, plotY2 + textAscent() + 5*scale);
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth*3;
      }
    }
    else if (yearCount > 30) {
      for (int i=0;i<yearCount;i+=2) {
        text(showYearMin+i, x, plotY2 + textAscent() + 5*scale);
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth*2;
      }
    }
    else {
      for (int i=0;i<yearCount;i++) {
        text(showYearMin+i, x, plotY2 + textAscent() + 5*scale);
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth;
      }
    }
/*
    x = plotX1 + unitWidth*0.5; 
    stroke(100);
    if (yearCount > 80) {
      for (int i=0;i<yearCount;i+=5) {
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth*5;
      }
    }
    else if (yearCount > 50) {
      for (int i=0;i<yearCount;i+=3) {
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth*3;
      }
    }
    else if (yearCount > 30) {
      for (int i=0;i<yearCount;i+=2) {
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth*2;
      }
    }
    else {
      for (int i=0;i<yearCount;i++) {
        line(x, plotY2 - OUTLINE_WIDTH*0.5, x, plotY1 + OUTLINE_WIDTH*0.5);
        x += unitWidth;
      }
    }
*/
    popStyle();
  }

/*
  void drawVolumeLabels(int i) {

    pushStyle();
    fill(0);
    textSize(10*scale);
    textAlign(RIGHT);

    stroke(224);
    strokeWeight(1);

    //for (float v = dataMin; v <= dataMax[i]; v += volumeInterval[i]) {
    for (float v = dataMin; v < dataMax[i]*dataScale; v += (dataMax[i]*dataScale-dataMin)/15) {

      float y = map(v, dataMin, dataMax[i]*dataScale, plotY2, plotY1);  
      float textOffset = textAscent()/2;  // Center vertically
      if (v == dataMin) {
        textOffset = 0;                   // Align by the bottom
      } 
      else if (v == dataMax[i]) {
        textOffset = textAscent();        // Align by the top
      }
      text(round(v), plotX1 - 10, y + textOffset);
      line(plotX1, y, plotX2, y);     // Draw major tick
    }
    popStyle();
  }*/

  private void drawDataCurve(int row, int colour, int ii, int yMin, int yMax) {
    pushStyle();

      noFill();
      //stroke(colors[colour]);
      stroke(CURVE_COLOR_TEMP);
      strokeWeight(INLINE_WIDTH);

      beginShape();
        float left = plotX1;
        float right = left+unitWidth;

        for (int i=0;i<yearCount;i++) {
          if (true == true) {
            float value = (i+showYearMin)%100;//(i%10>4)?50:40;//random(40,80); //change
            float x = (left+right)/2;
            float y = map(value, dataMin, dataMax*dataScale, plotY2, plotY1);
            fill(CURVE_COLOR_TEMP);
            ellipse(x, y, 4*scale, 6*scale);
            noFill();

            vertex(x,y);
          }
          left = right;
          right += unitWidth;
        }

        /*
        for (int col = showYearMin-yearMin; col < showYearMax-yearMin+1; col++) {

          if (dataSets[i].getData().isValid(row, col)) {
            float value = dataSets[i].getData().getFloat(row, col);
            float x = (left+right)/2;
            float y = map(value, dataMin, dataMax[i]*dataScale, plotY2, plotY1);
            ellipse(x, y, 3*scale, 4*scale);

            vertex(x, y);
          }
          left = right;
          right += unitWidth;
        }*/
      endShape();

    popStyle();
  }

/*
  void drawDataBar(int row, int table, int col) {
    pushStyle();

    fill(colors[col]);
    //noFill();
    noStroke();
    int left = 0;
    int right = 10;
    float amount = 0;
    boolean isValid = true;
    float barWidth = 18*scale;

    // 11111111
    for (int i=left;i<right;i++) {
      if (dataSets[table].getData().isValid(row, i)) {
        amount += dataSets[table].getData().getFloat(row, i);
      } 
      else
      {
        isValid = false;
        break;
      }
    }
    if (isValid) {
      rectMode(CORNERS);
      amount = amount * 0.1;
      float xx = plotX1 + (1+left*0.2)/6.0*(plotX2-plotX1) - barWidth*(3-col);
      float yy = map(amount, dataMin, dataMax[table]*dataScale, plotY2, plotY1);
      //println("table:" + table + ",,,  " + xx + "  " + yy);
      rect(xx, yy, xx+barWidth, plotY2);
    }

    // 2222222
    left += 10;
    right += 10;
    amount = 0;
    isValid = true;
    for (int i=left;i<right;i++) {
      if (dataSets[table].getData().isValid(row, i)) {
        amount += dataSets[table].getData().getFloat(row, i);
      } 
      else
      {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      rectMode(CORNERS);
      amount = amount * 0.1;
      //rect(plotX1 + (1+left*0.2)/6.0*(plotX2-plotX1) - barWidth, map(amount, dataMin, dataMax[table], plotY2, plotY1), plotX1 + (1+left*0.2)/6.0*(plotX2-plotX1) + barWidth, plotY2);
      float xx = plotX1 + (1+left*0.2)/6.0*(plotX2-plotX1) - barWidth*(3-col);
      float yy = map(amount, dataMin, dataMax[table]*dataScale, plotY2, plotY1);
      rect(xx, yy, xx+barWidth, plotY2);
    }

    // 3333333
    left += 10;
    right += 10;
    amount = 0;
    isValid = true;
    for (int i=left;i<right;i++) {
      if (dataSets[table].getData().isValid(row, i)) {
        amount += dataSets[table].getData().getFloat(row, i);
      } 
      else
      {
        isValid = false;
        break;
      }
    }

    if (isValid) {
      rectMode(CORNERS);
      amount = amount * 0.1;
      //rect(plotX1 + (1+left*0.2)/6.0*(plotX2-plotX1) - barWidth, map(amount, dataMin, dataMax[table], plotY2, plotY1), plotX1 + (1+left*0.2)/6.0*(plotX2-plotX1) + barWidth, plotY2);
      float xx = plotX1 + (1+left*0.2)/6.0*(plotX2-plotX1) - barWidth*(3-col);
      float yy = map(amount, dataMin, dataMax[table]*dataScale, plotY2, plotY1);
      rect(xx, yy, xx+barWidth, plotY2);
    }
  }*/

  void drawDataCurveDash(int row, int colour, int i, int yMin, int yMax, int begin, int end) {
    pushStyle();
/*
    noFill();
    stroke(colors[colour]);

    float[][] dashPoint = new float[columnCount][2];
    
    float left = plotX1;
    float right = left+unitWidth;

    for (int col = showYearMin-yearMin; col < showYearMax-yearMin+1; col++) {
      if (dataSets[i].getData().isValid(row, col) && col>=begin-1980 && col<=end-1980) {
        float value = dataSets[i].getData().getFloat(row, col);
        float x = (left+right)/2;
        float y = map(value, dataMin, dataMax[i]*dataScale, plotY2, plotY1);
        dashPoint[col][0] = x;
        dashPoint[col][1] = y;
        ellipse(x, y, 3*scale, 4*scale);
      }
      else {
        dashPoint[col][0] = -1000;
        dashPoint[col][1] = -1000;
      }
      
      left = right;
      right += unitWidth;
    }

    for (int col = showYearMin-yearMin+1; col < showYearMax-yearMin+1; col++) {
      if (dashPoint[col-1][0] != -1000 && dashPoint[col][0] != -1000)
        dashline(dashPoint[col-1][0], dashPoint[col-1][1], dashPoint[col][0], dashPoint[col][1], spacing);
    }
*/
    popStyle();  
  }

  void drawDataCurveDashSpecial(int[] row, int colour, int i, int yMin, int yMax, int begin, int end) {
    pushStyle();
/*
    noFill();
    stroke(colors[colour]);

    float[][] dashPoint = new float[columnCount][2];
    
    float left = plotX1;
    float right = left+unitWidth;
    
    int ct = row.length;

    for (int col = showYearMin-yearMin; col < showYearMax-yearMin+1; col++) {
      if (col>=begin-1980 && col<=end-1980) {
        float value = 0;
        for (int j=0;j<ct;j++) {
          value += dataSets[i].getData().getFloat(row[j], col);
        }
        float x = (left+right)/2;
        float y = map(value, dataMin, dataMax[i]*dataScale, plotY2, plotY1);
        dashPoint[col][0] = x;
        dashPoint[col][1] = y;
        ellipse(x, y, 3*scale, 4*scale);
      }
      else {
        dashPoint[col][0] = -1000;
        dashPoint[col][1] = -1000;
      }
      
      left = right;
      right += unitWidth;
    }

    for (int col = showYearMin-yearMin+1; col < showYearMax-yearMin+1; col++) {
      if (dashPoint[col-1][0] != -1000 && dashPoint[col][0] != -1000)
        dashline(dashPoint[col-1][0], dashPoint[col-1][1], dashPoint[col][0], dashPoint[col][1], spacing);
    }
*/
    popStyle();  
  }

  public int getYear(float posx, float posy) {
    if (posx>plotX1 && posx<plotX2 && posy>plotY1 && posy<plotY2) {
      return floor((posx - plotX1) / unitWidth) + showYearMin;
    }
    return -1;
  }
}