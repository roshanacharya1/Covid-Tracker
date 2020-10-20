import 'package:flutter/material.dart';
import 'package:covid_tracker_beta/Views/StatesView.dart';
import 'test.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home:  StatesView(),
    );
  }
}
