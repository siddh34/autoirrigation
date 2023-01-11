import 'package:flutter/material.dart';
import 'package:myirrigation/Utilities/DataManager.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';

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
    Future.delayed(Duration(seconds: 10), () async {
      data = await myDataManager.getData();
    });

    super.initState();
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
            Padding(
              padding: const EdgeInsets.all(140),
              child: TextButton(
                  onPressed: (() {
                    myDataManager.getData();
                  }),
                  child: Text('Press')),
            )
          ],
        ),
      ),
    );
  }
}
