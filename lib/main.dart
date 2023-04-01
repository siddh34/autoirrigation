import 'package:flutter/material.dart';
import 'package:myirrigation/Screens/LoginScreen.dart';
import 'Screens/UserScreen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Irrigation",
      initialRoute: "/",
      routes: {
        '/':(context) => LoginScreen(),
        '/userScreen':(context) => UserScreen()
      },
    );
  }
}
