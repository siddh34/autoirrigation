import 'package:flutter/material.dart';
import '../Utilities/BottomSheetButton.dart';

class DeviceControlScreen {
  Future<dynamic> DeviceControlSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        elevation: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        builder: (context) {
          return Container(
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomSheetButton(color: Colors.green, text: 'On'),
                BottomSheetButton(color: Colors.red, text: 'Off')
              ],
            ),
          );
        });
  }
}
