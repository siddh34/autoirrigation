// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GraphWidget extends StatelessWidget {
  const GraphWidget({
    Key? key,
    required this.chart,
  }) : super(key: key);

  final Widget chart;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      child: chart,
    );
  }
}
