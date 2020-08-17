class TemperatureData
{
  Date date;
  double minT;
  double maxT;
  double snowFall;
  
  TemperatureData(Date date, double maxT, double minT, double snowFall)
  {
    this.date = date;
    this.minT = minT;
    this.maxT = maxT;
    this.snowFall = snowFall;
  }
}
