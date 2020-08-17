class ScatterPointPlot
{
  void drawScatterPointPlot(TemperatureData[] data, int month, boolean max, boolean min, int startYear, int endYear)
  {
    float xScale = (1650.0 / ((endYear - startYear + 1) * 12.0)); //1 month gets this many pixels
    float yScale = 13.0; //5 degrees C gets 65 pixels so 1 degree gets 13 pixels because 65/5=13
    
    float x = 100.0;
    for(TemperatureData temp : data)
    {
      if(temp.date.year >= startYear && temp.date.year <= endYear)
      {
        if(temp.date.month == month)
        {
          if (max)
          {
            fill(255, 0, 0);
            circle(x + (xScale / 2), (525.0 - (float) (temp.maxT * yScale)), 4.6);
          }
          if (min)
          {
            fill(0, 0, 255);
            circle(x + (xScale / 2), (525.0 - (float) (temp.minT * yScale)), 4.6);
          }
        }
        x += xScale;
      }
    }
  }
}
