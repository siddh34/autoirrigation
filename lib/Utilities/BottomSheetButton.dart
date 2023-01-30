import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  final String text;
  final Color color;

  BottomSheetButton({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          '$text',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
