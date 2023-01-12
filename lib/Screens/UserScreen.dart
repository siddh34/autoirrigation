import 'package:flutter/material.dart';
import 'package:myirrigation/Utilities/DataManager.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // functions and variables
  DataManager myDataManager = new DataManager();
  List<GraphData> data = [];

  @override
  void initState() {
    // getting the data

    getData();

    super.initState();
  }

  void getData() async {
    data = await myDataManager.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              series: <ChartSeries>[
                LineSeries<GraphData, DateTime>(
                    dataSource: data,
                    xValueMapper: (GraphData GD, _) => GD.datetime,
                    yValueMapper: (GraphData GD, _) => GD.temp)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
