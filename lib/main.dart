import 'package:flutter/material.dart';
import 'package:myirrigation/Screens/LoginScreen.dart';
import 'Screens/UserScreen.dart';

void main() {
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
