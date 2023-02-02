// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HumidityTempGraph extends StatefulWidget {
  final List<GraphData> data;
  const HumidityTempGraph({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<HumidityTempGraph> createState() => _HumidityTempGraphState();
}

class _HumidityTempGraphState extends State<HumidityTempGraph> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: "Humidity vs Temp"),
      series: <ChartSeries>[
        SplineSeries<GraphData, double>(
            dataSource: widget.data,
            xValueMapper: (GraphData GD, _) => GD.temp,
            yValueMapper: (GraphData GD, _) => GD.humidity),
      ],
    );
  }
}
