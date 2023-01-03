import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class DataManager {
  // function or variables

  Future<void> getData() async {
    try {
      await Firebase.initializeApp();
      
      DatabaseReference reference = FirebaseDatabase.instance.ref();

      var snapshot = await reference.get();

      if (snapshot.exists) {
        print(snapshot.value);
      }
      else{
        print("Data not found");
      }
    } catch (e) {
      print(e);
    }
  }
}
