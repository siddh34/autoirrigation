import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';
// import 'dart:convert';

class DataManager {
  // function or variables
  List<GraphData> useableGraphData = [];

  Future<List<GraphData>> getData() async {
    try {
      await Firebase.initializeApp();

      DatabaseReference reference =
          FirebaseDatabase.instance.ref().child("smart-I-test ");

      var snapshot = await reference.get();

      List<Map> dataList = [];

      // checking whether data collection exists on firebase
      if (snapshot.exists) {
        //Return list of children as Map<String,dynamic>
        dataList = snapshot.children.map((e) => e.value as Map).toList();

        // for debugging
        // print(dataList[0]['humidity']);

        for (var i in dataList) {
          useableGraphData.add(GraphData.fromJson(i));
        }

        // for debugging
        // print(useableGraphData[0].humidity);

      } else {
        print("Data not found");
      }
    } catch (e) {
      print(e);
    }

    return useableGraphData;
  }
}
