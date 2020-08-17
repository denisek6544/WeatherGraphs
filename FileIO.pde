class FileIO
{
  String filePath;
  Table dataTable;
  TemperatureData[] dataArr;
  
  FileIO()
  {
    filePath = "CalgaryWeather.csv";
    dataTable = loadTable(filePath, "header");
    dataArr = null;
  }
  
  TemperatureData[] getDataArray()
  {
    if(dataArr == null)
    {
      dataArr = new TemperatureData[dataTable.getRowCount()];
      int i = 0;
      for(TableRow currentRow : dataTable.rows())
      {
        TemperatureData d = new TemperatureData (new Date(currentRow.getInt("Month"), currentRow.getInt("Year")), currentRow.getDouble("Max Temperature"), currentRow.getDouble("Min Temperature"), currentRow.getDouble("Snow Fall"));
        dataArr[i] = d;
        i++;
      } 
    }
    return dataArr;
  }
  
  void printData ()
  {
    for(int i = 0; i < dataArr.length; i++)
    {
      println(dataArr[i].date.year + ", " + dataArr[i].date.month + ", " + dataArr[i].maxT + ", " + dataArr[i].minT + ", " + dataArr[i].snowFall);
    }
  }  
}
