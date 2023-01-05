class GraphData {
  GraphData(
      this.data,
      this.humidity,
      this.motorState,
      this.pirValue,
      this.rainPercentage,
      this.rainValue,
      this.soilMoisturePercentage,
      this.soiMoistureValue,
      this.temp,
      this.time){
        this.data = data;
        this.humidity = humidity;
        this.motorState = motorState;
        this.pirValue = pirValue;
        this.rainPercentage = rainPercentage;
        this.rainValue = rainValue;
        this.soilMoisturePercentage = soilMoisturePercentage;
        this.soiMoistureValue = soiMoistureValue;
        this.temp = temp;
        this.time = time;
      }

  var data;
  var humidity;
  var motorState;
  var pirValue;
  var rainPercentage;
  var rainValue;
  var soilMoisturePercentage;
  var soiMoistureValue;
  var temp;
  var time;
}
