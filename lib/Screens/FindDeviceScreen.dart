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
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomSheetButton(
                    color: Colors.greenAccent, text: 'Connect Devices'),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  width: 200,
                  height: 300,
                  child: Text(
                    "Available devices",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
