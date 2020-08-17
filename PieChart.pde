class PieChart
{ 
  float[] getAnglesForMax(TemperatureData[] data, int[] includedMonths, int lastIndex, int startYear, int endYear)
  {
    int rangeneg20toneg15 = 0;
    int rangeneg15toneg10 = 0;
    int rangeneg10toneg5 = 0;
    int rangeneg5to0 = 0;
    int range0to5 = 0;
    int range5to10 = 0;
    int range10to15 = 0;
    int range15to20 = 0;
    int range20to25 = 0;
    float tot = 0;
    
    for(TemperatureData currentData : data)
    {
      boolean includeMonth = false;
      for(int i = 0; i <= lastIndex; i++)
      {
        if(currentData.date.month == includedMonths[i])
        {
          includeMonth = true;
        }
      }
      if(includeMonth && currentData.date.year >= startYear && currentData.date.year <= endYear)
      {
        if(currentData.maxT > -20 && currentData.maxT <= -15)
        {
          rangeneg20toneg15++;
          tot++;
        }
        else if(currentData.maxT > -15 && currentData.maxT <= -10)
        {
          rangeneg15toneg10++;
          tot++;
        }
        else if(currentData.maxT > -10 && currentData.maxT <= -5)
        {
          rangeneg10toneg5++;
          tot++;
        }
        else if(currentData.maxT > -5 && currentData.maxT <= 0)
        {
          rangeneg5to0++;
          tot++;
        }
        else if(currentData.maxT > 0 && currentData.maxT <= 5)
        {
          range0to5++;
          tot++;
        }
        else if(currentData.maxT > 5 && currentData.maxT <= 10)
        {
          range5to10++;
          tot++;
        }
        else if(currentData.maxT > 10 && currentData.maxT <= 15)
        {
          range10to15++;
          tot++;
        }
        else if(currentData.maxT > 15 && currentData.maxT <= 20)
        {
          range15to20++;
          tot++;
        }
        else if(currentData.maxT > 20 && currentData.maxT <= 25)
        {
          range20to25++;
          tot++;
        }
      }
    }
    float[] angles = new float[9];
    if(tot != 0)
    {
      angles[0] = (rangeneg20toneg15 / tot) * 360;
      angles[1] = (rangeneg15toneg10 / tot) * 360;
      angles[2] = (rangeneg10toneg5 / tot) * 360;
      angles[3] = (rangeneg5to0 / tot) * 360;
      angles[4] = (range0to5 / tot) * 360;
      angles[5] = (range5to10 / tot) * 360;
      angles[6] = (range10to15 / tot) * 360;
      angles[7] = (range15to20 / tot) * 360;
      angles[8] = (range20to25 / tot) * 360;
    }
    return angles;
  }
  
  float[] getAnglesForMin(TemperatureData[] data, int[] includedMonths, int lastIndex, int startYear, int endYear)
  {
    int rangeneg20toneg15 = 0;
    int rangeneg15toneg10 = 0;
    int rangeneg10toneg5 = 0;
    int rangeneg5to0 = 0;
    int range0to5 = 0;
    int range5to10 = 0;
    int range10to15 = 0;
    int range15to20 = 0;
    int range20to25 = 0;
    float tot = 0;
    
    for(TemperatureData currentData : data)
    {
      boolean includeMonth = false;
      for(int i = 0; i <= lastIndex; i++)
      {
        if(currentData.date.month == includedMonths[i])
        {
          includeMonth = true;
        }
      }
      if(includeMonth && currentData.date.year >= startYear && currentData.date.year <= endYear)
      {
        if(currentData.minT > -20 && currentData.minT <= -15)
        {
          rangeneg20toneg15++;
          tot++;
        }
        else if(currentData.minT > -15 && currentData.minT <= -10)
        {
          rangeneg15toneg10++;
          tot++;
        }
        else if(currentData.minT > -10 && currentData.minT <= -5)
        {
          rangeneg10toneg5++;
          tot++;
        }
        else if(currentData.minT > -5 && currentData.minT <= 0)
        {
          rangeneg5to0++;
          tot++;
        }
        else if(currentData.minT > 0 && currentData.minT <= 5)
        {
          range0to5++;
          tot++;
        }
        else if(currentData.minT > 5 && currentData.minT <= 10)
        {
          range5to10++;
          tot++;
        }
        else if(currentData.minT > 10 && currentData.minT <= 15)
        {
          range10to15++;
          tot++;
        }
        else if(currentData.minT > 15 && currentData.minT <= 20)
        {
          range15to20++;
          tot++;
        }
        else if(currentData.minT > 20 && currentData.minT <= 25)
        {
          range20to25++;
          tot++;
        }
      }
    }
    float[] angles = new float[9];
    if(tot != 0)
    {
      angles[0] = (rangeneg20toneg15 / tot) * 360;
      angles[1] = (rangeneg15toneg10 / tot) * 360;
      angles[2] = (rangeneg10toneg5 / tot) * 360;
      angles[3] = (rangeneg5to0 / tot) * 360;
      angles[4] = (range0to5 / tot) * 360;
      angles[5] = (range5to10 / tot) * 360;
      angles[6] = (range10to15 / tot) * 360;
      angles[7] = (range15to20 / tot) * 360;
      angles[8] = (range20to25 / tot) * 360;
    }
    return angles;
  }
  
  void drawPieChart(float diameter, float[] angles, boolean max)
  {
    float lastAngle = 0;
    for (int i = 0; i < angles.length; i++)
    {
      float colour = map(i, 0, angles.length, 0, 255);
      if(max)
      {
        fill(colour, 0, 0);
        arc(425, 525, diameter, diameter, lastAngle, lastAngle + radians(angles[i]));
      }
      else
      {
        fill(0, 0, colour);
        arc(1075, 525, diameter, diameter, lastAngle, lastAngle + radians(angles[i]));
      }
      lastAngle += radians(angles[i]);
    }
  }
  
  void pieChartLegend()
  {
    fill(255);
    rect(1400, 250, 300, 600);
    fill(0);
    textSize(30);
    text("Legend", 1500, 284);
    textSize(20);
    int height = 50;
    for (int i = 0; i <= 8; i++)
    {
      float colour = map(i, 0, 9, 0, 255);
      fill(colour, 0, 0);
      rect(1625, 275 + height - 20, 20, 20);
      fill(0, 0, colour);
      rect(1675, 275 + height - 20, 20, 20);
      height += 50;
    }
    fill(0);
    text("-20 to -15 degrees", 1425, 325);
    text("-15 to -10 degrees", 1425, 375);
    text("-10 to -5 degrees", 1425, 425);
    text("-5 to 0 degrees", 1425, 475);
    text("0 to 5 degrees", 1425, 525);
    text("5 to 10 degrees", 1425, 575);
    text("10 to 15 degrees", 1425, 625);
    text("15 to 20 degrees", 1425, 675);
    text("20 to 25 degrees", 1425, 725);
  }
}
