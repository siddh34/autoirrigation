import 'package:flutter/cupertino.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianLineChart extends StatefulWidget {
  const CartesianLineChart({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<GraphData> data;

  @override
  State<CartesianLineChart> createState() => _CartesianLineChartState();
}

class _CartesianLineChartState extends State<CartesianLineChart> {
  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      title: ChartTitle(text: "Temp vs Time"),
      primaryXAxis: DateTimeAxis(),
      series: <ChartSeries>[
        LineSeries<GraphData, DateTime>(
            dataSource: widget.data,
            xValueMapper: (GraphData GD, _) => GD.datetime,
            yValueMapper: (GraphData GD, _) => GD.temp)
      ],
    );
  }
}