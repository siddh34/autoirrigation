import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myirrigation/Utilities/Graphdata.dart';
import 'dart:convert';

class DataManager {
  // function or variables
  List<GraphData> useableGraphData = [];

  Future<void> getData() async {
    try {
      await Firebase.initializeApp();

      DatabaseReference reference = FirebaseDatabase.instance.ref();

      var snapshot = await reference.get();

      if (snapshot.exists) {
        var data = json.encode(snapshot.value.toString());

        print(data);
        
        // getting data via json
        // for(var myData in  data as List){

        // }

      } else {
        print("Data not found");
      }
    } catch (e) {
      print(e);
    }
  }
}
