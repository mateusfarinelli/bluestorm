import 'package:flutter/material.dart';
import 'package:bluestorm/pages/login.dart';

Color blueA = const Color(0XFF2F9ABB);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}