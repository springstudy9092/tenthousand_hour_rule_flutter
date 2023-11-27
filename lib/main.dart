import 'package:flutter/material.dart';
import 'package:sample_project/login/splash.dart';

import 'goal_datail/goal_detail_main.dart';
import 'goal_datail/goal_detail_main_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}