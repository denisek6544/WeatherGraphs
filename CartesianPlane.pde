class CartesianPlane
{
  void drawAxis()
  {
    strokeWeight(3);
    stroke(200, 0, 250);
    line(100, 200, 100, 850);
    line(100, 525, 1750, 525);
  }
  void drawChart()
  {
    strokeWeight(1);
    stroke(0);
    fill(0);
    text("25", 55, 205);
    line(95, 200, 105, 200);
    text("20", 55, 270);
    line(95, 265, 105, 265);
    text("15", 55, 335);
    line(95, 330, 105, 330);
    text("10", 55, 395);
    line(95, 395, 105, 395);
    text("5", 55, 460);
    line(95, 460, 105, 460);
    text("0", 55, 525);
    line(95, 525, 105, 525);
    text("-5", 55, 590);
    line(95, 590, 105, 590);
    text("-10", 55, 655);
    line(95, 655, 105, 655);
    text("-15", 55, 720);
    line(95, 720, 105, 720);
    text("-20", 55, 785);
    line(95, 785, 105, 785);
    text("-25", 55, 850);
    line(95, 850, 105, 850);
    
    textSize(18);
    fill(255);
    text("year", 1760, 525);
    fill(0);
    text("temperature (C)", 40, 880);
  }
  
  void drawYearLabelXAxis(int startYear, int endYear)
  {
    float xValue = 100.0 + (((1650.0 / (endYear - startYear + 1)) / 2) - 20);
    for(int i = startYear; i <= endYear; i++)
    {
      fill(255);
      text(Integer.toString(i), xValue, 550);
      xValue += (1650.0 / (endYear - startYear + 1));
    }
    fill(0);
  }
  
  void displayLegendMaxMin()
  {
    textSize(16);
    fill(255, 0, 0);
    text("Average Maximim Temperature", 1500, 140);
    fill(0, 0, 255);
    text("Average Minimum Temperature", 1500, 180);
  }
  
  void drawTitle(String title)
  {
    fill(0);
    textSize(20);
    text(title, 500, 150);
  }
}
