import 'package:flutter/material.dart';
import 'package:news_app/screens/run_app.dart';
void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RunApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

