class BarChart
{
  void drawBarChart(TemperatureData[] data, int month, boolean max, boolean min, int startYear, int endYear)
  {
    float xScale = (1650.0 / ((endYear - startYear + 1) * 12.0)); //1 month gets this many pixels
    float yScale = 13; //5 degrees C gets 65 pixels so 1 degree gets 13 pixels because 65/5=13

    float x = 100.0;
    for(TemperatureData temp : data)
    {
      if(temp.date.year >= startYear && temp.date.year <= endYear)
      {
        if(temp.date.month == month)
        {
          if(max)
          {
            fill(255, 0, 0);
            rect(x, (525.0 - (float) (temp.maxT * yScale)), xScale, (float) (temp.maxT * yScale));
          }
          if(min)
          {
            fill(0, 0, 255);
            rect(x, (525.0 - (float) (temp.minT * yScale)), xScale, (float) (temp.minT * yScale));
          }
          if((temp.maxT < 0) && max)
          {
            fill(255, 0, 0);
            rect(x, (525.0 - (float) (temp.maxT * yScale)), xScale, (float) (temp.maxT * yScale));
          } 
        }
        x = x + xScale;
      }
    }
  }
}
