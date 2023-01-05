import 'package:flutter/material.dart';
import 'package:myirrigation/Utilities/DataManager.dart';


class UserScreen extends StatefulWidget {
  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // functions
  DataManager myDataManager = new DataManager();

  @override
  void initState(){
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
