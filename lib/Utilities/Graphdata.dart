class GraphData {
  GraphData(
      {required this.datetime,
      required this.humidity,
      required this.motorState,
      required this.pirValue,
      required this.rainPercentage,
      required this.rainValue,
      required this.soilMoisturePercentage,
      required this.soilMoistureValue,
      required this.temp});

  DateTime datetime;
  double humidity;
  int motorState;
  int pirValue;
  double rainPercentage;
  int rainValue;
  double soilMoisturePercentage;
  int soilMoistureValue;
  double temp;

  // adding directly through this method
  factory GraphData.fromJson(Map json) {
    return GraphData(
        datetime: getDatetimeFromString(json['date'], json['time']),
        humidity: double.parse(json["humidity"]),
        motorState: int.parse(json["motor_state"]),
        pirValue: int.parse(json["pir_value"]),
        rainPercentage: double.parse(json["rain_percentage"]),
        rainValue: int.parse(json["rain_value"]),
        soilMoisturePercentage: double.parse(json["soil_moisture_percentage"]),
        soilMoistureValue: int.parse(json["soil_moisture_value"]),
        temp: double.parse(json["temp"]));
  }

  static DateTime getDatetimeFromString(String date, String time) {
    var list1 = date.split("/");
    var list2 = time.split(":");

    return DateTime(
      int.parse(list1.last),
        int.parse(list1[1]),
        int.parse(list1[0]),
        int.parse(list2[0]),
        int.parse(list2[1]),
        int.parse(list2[2])
    );
  }
}
