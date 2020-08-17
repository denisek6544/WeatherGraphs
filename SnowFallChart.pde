class SnowFallChart
{
  void drawSnowFallChart(TemperatureData[] data, int month, boolean max, boolean min, int startYear, int endYear)
  {
    for(TemperatureData temp : data)
    {
      if(temp.date.month == month && temp.date.year >= startYear && temp.date.year <= endYear)
      {
        if (max)
        {
          stroke(255, 0, 0);
          circle((float)(925 + (temp.maxT * 33) + 2.3), (float) (850 - (temp.snowFall * 26)), 4.6);
        }
        if (min)
        {
          stroke(0, 0, 255);
          circle((float)(925 + (temp.minT * 33) + 2.3), (float) (850 - (temp.snowFall * 26)), 4.6);
        }
      }
    }
  }
  
  void drawSnowFallPlot()
  {
    strokeWeight(1);
    stroke(0);
    fill(0);
    text("25", 1740, 870);
    line(1750, 845, 1750, 855);
    text("20", 1575, 870);
    line(1585, 845, 1585, 855);
    text("15", 1415, 870);
    line(1420, 845, 1420, 855);
    text("10", 1250, 870);
    line(1255, 845, 1255, 855);
    text("5", 1085, 870);
    line(1090, 845, 1090, 855);
    text("0", 920, 870);
    line(925, 845, 925, 855);
    text("-5", 750, 870);
    line(760, 845, 760, 855);
    text("-10", 585, 870);
    line(595, 845, 595, 855);
    text("-15", 420, 870);
    line(430, 845, 430, 855);
    text("-20", 255, 870);
    line(265, 845, 265, 855);
    text("-25", 90, 870);
    line(100, 845, 100, 855);
    
    textSize(18);
    text("temperature (C)", 1660, 885);
    text("snow fall", 960, 200);
    
    strokeWeight(1);
    stroke(0);
    text("5", 935, 720);
    line(920, 720, 930, 720);
    text("10", 935, 590);
    line(920, 590, 930, 590);
    text("15", 935, 460);
    line(920, 460, 930, 460);
    text("20", 935, 330);
    line(920, 330, 930, 330);
    text("25", 935, 200);
    line(920, 200, 930, 200);
  }
  
  void drawSnowFallAxis(int sizeX, int sizeY)
  {
    strokeWeight(3);
    stroke(200, 0, 250);
    line(925, 200, 925, sizeY - 50);
    line(100, 850, sizeX - 50, 850);
  }
}
