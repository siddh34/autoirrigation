import 'package:flutter/material.dart';
import '../Utilities/BottomSheetButton.dart';

class FindDeviceScreen {
  Future<dynamic> ConnectDeviceSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        builder: (context) {
          return Container(
            height: 350,
            child: Row(
              children: [
                BottomSheetButton(
                    color: Colors.greenAccent, text: 'Connect Devices'),
                Container(),
              ],
            ),
          );
        });
  }
}
