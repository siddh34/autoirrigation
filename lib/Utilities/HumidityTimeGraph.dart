// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:myirrigation/Utilities/Graphdata.dart';

class HumidityTimeGraph extends StatefulWidget {
  final List<GraphData> data;
  const HumidityTimeGraph({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<HumidityTimeGraph> createState() => _HumidityTimeGraphState();
}

class _HumidityTimeGraphState extends State<HumidityTimeGraph> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: "Humidity vs Time"),
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries>[
        SplineSeries<GraphData, DateTime>(
            dataSource: widget.data,
            xValueMapper: (GraphData GD, _) => GD.datetime,
            yValueMapper: (GraphData GD, _) => GD.humidity),
      ],
    );
  }
}
