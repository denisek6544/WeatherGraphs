import controlP5.*;

ControlP5 cp5;
FileIO fileReader;
TemperatureData[] data;
CartesianPlane plot;
BarChart bar;
ScatterPointPlot scatter;
PieChart pie;
SnowFallChart snow;

Button barChart;
Button scatterPointPlot;
Button pieChart;
Button snowFall;

Toggle january;
Toggle february;
Toggle march;
Toggle april;
Toggle may;
Toggle june;
Toggle july;
Toggle august;
Toggle september;
Toggle october;
Toggle november;
Toggle december;

Toggle showMax;
Toggle showMin;

Textfield textFStart;
Textfield textFEnd;
Button go;
Textlabel validValues;

boolean barChartBState;
boolean scatterPointPlotBState;
boolean pieChartBState;
boolean snowFallBState;

int currentStartYear;
int currentEndYear;

void setup()
{
  size(1800, 900);
  
  cp5 = new ControlP5(this);
  fileReader = new FileIO();
  data = fileReader.getDataArray();
  plot = new CartesianPlane();
  bar = new BarChart();
  scatter = new ScatterPointPlot();
  pie = new PieChart();
  snow = new SnowFallChart();
  
  barChartBState = false;
  scatterPointPlotBState = false;
  pieChartBState = false;
  snowFallBState = false;
  currentStartYear = 1990;
  currentEndYear = 2019;
  
  barChart = cp5.addButton("barChartButtonPressed");
  barChart.setPosition(40, 40);
  barChart.setSize(80, 20);
  barChart.setCaptionLabel("Bar Chart");
  scatterPointPlot= cp5.addButton("scatterPointPlotButtonPressed");
  scatterPointPlot.setPosition(140, 40);
  scatterPointPlot.setSize(80, 20);
  scatterPointPlot.setCaptionLabel("Scatter Point Plot");
  pieChart= cp5.addButton("pieChartButtonPressed");
  pieChart.setPosition(240, 40);
  pieChart.setSize(80, 20);
  pieChart.setCaptionLabel("Pie Chart");
  snowFall= cp5.addButton("snowFallButtonPressed");
  snowFall.setPosition(340, 40);
  snowFall.setSize(80, 20);
  snowFall.setCaptionLabel("Snow Fall");
  
  january = cp5.addToggle("January");
  january.setValue(0);
  january.setPosition(1180, 40);
  january.setSize(80, 20);
  february = cp5.addToggle("February");
  february.setValue(0);
  february.setPosition(1280, 40);
  february.setSize(80, 20);
  march = cp5.addToggle("March");
  march.setValue(0);
  march.setPosition(1380, 40);
  march.setSize(80, 20);
  april = cp5.addToggle("April");
  april.setValue(0);
  april.setPosition(1480, 40);
  april.setSize(80, 20);
  may = cp5.addToggle("May");
  may.setValue(0);
  may.setPosition(1580, 40);
  may.setSize(80, 20);
  june = cp5.addToggle("June");
  june.setValue(0);
  june.setPosition(1680, 40);
  june.setSize(80, 20);
  
  july = cp5.addToggle("July");
  july.setValue(0);
  july.setPosition(1180, 80);
  july.setSize(80, 20);
  august = cp5.addToggle("August");
  august.setValue(0);
  august.setPosition(1280, 80);
  august.setSize(80, 20);
  september = cp5.addToggle("September");
  september.setValue(0);
  september.setPosition(1380, 80);
  september.setSize(80, 20);
  october = cp5.addToggle("October");
  october.setValue(0);
  october.setPosition(1480, 80);
  october.setSize(80, 20);
  november = cp5.addToggle("November");
  november.setValue(0);
  november.setPosition(1580, 80);
  november.setSize(80, 20);
  december = cp5.addToggle("December");
  december.setValue(0);
  december.setPosition(1680, 80);
  december.setSize(80, 20);
  
  showMax = cp5.addToggle("show max temp");
  showMax.setValue(0);
  showMax.setPosition(40, 80);
  showMax.setSize(80, 20);
  showMin = cp5.addToggle("show min temp");
  showMin.setValue(0);
  showMin.setPosition(150, 80);
  showMin.setSize(80, 20);
  
  january.setValue(true);
  february.setValue(true);
  march.setValue(true);
  april.setValue(true);
  may.setValue(true);
  june.setValue(true);
  july.setValue(true);
  august.setValue(true);
  september.setValue(true);
  october.setValue(true);
  november.setValue(true);
  december.setValue(true);
  showMax.setValue(true);
  showMin.setValue(true);
  
  textFStart = cp5.addTextfield("start year");
  textFStart.setPosition(40, 125);
  textFStart.setSize(50, 25);
  textFStart.setText("1990");
  textFEnd = cp5.addTextfield("end year");
  textFEnd.setPosition(110, 125);
  textFEnd.setSize(50, 25);
  textFEnd.setText("2019");
  
  go = cp5.addButton("goButtonPressed");
  go.setPosition(170, 125);
  go.setSize(40, 25);
  go.setCaptionLabel("Go");
  
  validValues = cp5.addTextlabel("label");
  validValues.setText("Invalid entries");
  validValues.setPosition(215, 130);
  validValues.setVisible(false);
}

void draw()
{
  background(102, 102, 255);
  if(barChartBState)
  {
    this.drawBarChart();
  }
  else if(scatterPointPlotBState)
  {
    this.drawScatterPointPlot();
  }
  else if(pieChartBState)
  {
    this.drawPieChart();
  }
  else if(snowFallBState)
  {
    this.drawSnowFallGraph();
  }
  else
  {
    plot.drawTitle("Visualization of Calgary Weather Data");
  }
}

void drawBarChart()
{
    plot.displayLegendMaxMin();
    plot.drawAxis();
    plot.drawChart();
    if(january.getBooleanValue())
    {
      bar.drawBarChart(data, 1, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(february.getBooleanValue())
    {
      bar.drawBarChart(data, 2, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(march.getBooleanValue())
    {
      bar.drawBarChart(data, 3, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(april.getBooleanValue())
    {
      bar.drawBarChart(data, 4, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(may.getBooleanValue())
    {
      bar.drawBarChart(data, 5, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(june.getBooleanValue())
    {
      bar.drawBarChart(data, 6, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(july.getBooleanValue())
    {
      bar.drawBarChart(data, 7, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(august.getBooleanValue())
    {
      bar.drawBarChart(data, 8, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(september.getBooleanValue())
    {
      bar.drawBarChart(data, 9, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(october.getBooleanValue())
    {
      bar.drawBarChart(data, 10, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(november.getBooleanValue())
    {
      bar.drawBarChart(data, 11, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(december.getBooleanValue())
    {
      bar.drawBarChart(data, 12, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    plot.drawYearLabelXAxis(currentStartYear, currentEndYear);
    plot.drawTitle("Average Max and Min Temperatures for each month bar chart");
}

void drawScatterPointPlot()
{
    plot.displayLegendMaxMin();
    plot.drawAxis();
    plot.drawChart();
    if(january.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 1, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(february.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 2, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(march.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 3, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(april.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 4, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(may.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 5, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(june.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 6, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(july.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 7, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(august.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 8, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(september.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 9, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(october.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 10, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(november.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 11, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(december.getBooleanValue())
    {
      scatter.drawScatterPointPlot(data, 12, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    plot.drawYearLabelXAxis(currentStartYear, currentEndYear);
    plot.drawTitle("Average Max and Min Temperatures for each month Scatter Point Plot");
}

void drawPieChart()
{
    int[] includedMonths = new int[12];
    int i = 0;
    if(january.getBooleanValue())
    {
      includedMonths[i] = 1;
      i++;
    }
    if(february.getBooleanValue())
    {
      includedMonths[i] = 2;
      i++;
    }
    if(march.getBooleanValue())
    {
      includedMonths[i] = 3;
      i++;
    }
    if(april.getBooleanValue())
    {
      includedMonths[i] = 4;
      i++;
    }
    if(may.getBooleanValue())
    {
      includedMonths[i] = 5;
      i++;
    }
    if(june.getBooleanValue())
    {
      includedMonths[i] = 6;
      i++;
    }
    if(july.getBooleanValue())
    {
      includedMonths[i] = 7;
      i++;
    }
    if(august.getBooleanValue())
    {
      includedMonths[i] = 8;
      i++;
    }
    if(september.getBooleanValue())
    {
      includedMonths[i] = 9;
      i++;
    }
    if(october.getBooleanValue())
    {
      includedMonths[i] = 10;
      i++;
    }
    if(november.getBooleanValue())
    {
      includedMonths[i] = 11;
      i++;
    }
    if(december.getBooleanValue())
    {
      includedMonths[i] = 12;
      i++;
    }
    float[] maxAngles = pie.getAnglesForMax(data, includedMonths, (i - 1), currentStartYear, currentEndYear);
    float[] minAngles = pie.getAnglesForMin(data, includedMonths, (i - 1), currentStartYear, currentEndYear);
    if(showMax.getBooleanValue())
    {
      pie.drawPieChart(600.0, maxAngles, true);
    }
    if(showMin.getBooleanValue())
    {
      pie.drawPieChart(600.0, minAngles, false);
    }
    pie.pieChartLegend();
    plot.displayLegendMaxMin();
    plot.drawTitle("Pie Charts of Average Max and Min Temperatures");
}

void drawSnowFallGraph()
{
    plot.displayLegendMaxMin();
    snow.drawSnowFallAxis(1800, 900);
    if(january.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 1, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(february.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 2, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(march.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 3, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(april.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 4, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(may.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 5, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(june.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 6, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(july.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 7, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(august.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 8, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(september.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 9, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(october.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 10, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(november.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 11, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    if(december.getBooleanValue())
    {
      snow.drawSnowFallChart(data, 12, showMax.getBooleanValue(), showMin.getBooleanValue(), currentStartYear, currentEndYear);
    }
    snow.drawSnowFallPlot();
    plot.drawTitle("Snow Fall vs Temperature Graph"); 
}

void barChartButtonPressed()
{
  if(!barChartBState)
  {
    barChartBState = true;
    scatterPointPlotBState = false;
    pieChartBState = false;
    snowFallBState = false;
  }
  else
  {
    barChartBState = false;
  }
}

void scatterPointPlotButtonPressed()
{
  if(!scatterPointPlotBState)
  {
    scatterPointPlotBState = true;
    barChartBState = false;
    pieChartBState = false;
    snowFallBState = false;
  }
  else
  {
    scatterPointPlotBState = false;
  }
}

void pieChartButtonPressed()
{
  if(!pieChartBState)
  {
    pieChartBState = true;
    barChartBState = false;
    scatterPointPlotBState = false;
    snowFallBState = false;
  }
  else
  {
    pieChartBState = false;
  }
}

void snowFallButtonPressed()
{
  if(!snowFallBState)
  {
    snowFallBState = true;
    barChartBState = false;
    scatterPointPlotBState = false;
    pieChartBState = false;
  }
  else
  {
    snowFallBState = false;
  }
}

void goButtonPressed()
{
  String startS = textFStart.getText();
  String endS = textFEnd.getText();
  if(!(this.validBounds(startS, endS)))
  {
    validValues.setVisible(true);
  }
  else
  {
    validValues.setVisible(false);
    currentStartYear = Integer.parseInt(startS);
    currentEndYear = Integer.parseInt(endS);
  }
}

boolean validBounds(String startS, String endS)
{
  boolean valid = true;
  if (startS.matches("\\d+") && endS.matches("\\d+"))
  {
    int start = Integer.parseInt(startS);
    int end = Integer.parseInt(endS);
    if(start > end)
    {
      valid = false;
    }
    else if((start < 1990) || (end > 2019))
    {
      valid = false;
    }
  }
  else
  {
    valid = false;
  }
  return valid;
}
