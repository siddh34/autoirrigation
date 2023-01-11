class GraphData {
  GraphData(
      {required this.date,
      required this.humidity,
      required this.motorState,
      required this.pirValue,
      required this.rainPercentage,
      required this.rainValue,
      required this.soilMoisturePercentage,
      required this.soilMoistureValue,
      required this.temp,
      required this.time});

  var date;
  double humidity;
  int motorState;
  int pirValue;
  double rainPercentage;
  int rainValue;
  double soilMoisturePercentage;
  int soilMoistureValue;
  double temp;
  var time;

  // adding directly through this method
  factory GraphData.fromJson(Map json) {
    return GraphData(
        date: json["date"].toString(),
        humidity: double.parse(json["humidity"]),
        motorState: int.parse(json["motor_state"]),
        pirValue: int.parse(json["pir_value"]),
        rainPercentage: double.parse(json["rain_percentage"]),
        rainValue: int.parse(json["rain_value"]),
        soilMoisturePercentage: double.parse(json["soil_moisture_percentage"]),
        soilMoistureValue: int.parse(json["soil_moisture_value"]),
        temp: double.parse(json["temp"]),
        time: json["time"].toString());
  }
}
