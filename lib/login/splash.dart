import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample_project/goal_datail/goal_detail_main.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GoalDetail()), // 페이지 호출
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("1만\n시간의\n법칙", style: TextStyle(fontSize: 90),),
        ),
      ),
    );
  }
}