// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../Utilities/Graphdata.dart';
import '../Utilities/TimeTempLineChart.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    Key? key,
    required this.chart,
  }) : super(key: key);

  final CartesianLineChart chart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: chart,
    );
  }
}
