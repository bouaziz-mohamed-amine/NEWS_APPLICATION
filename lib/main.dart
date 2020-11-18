import 'package:flutter/material.dart';
import 'file:///C:/Users/DELL/AndroidStudioProjects/news_app/lib/screens/run_app.dart';


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

