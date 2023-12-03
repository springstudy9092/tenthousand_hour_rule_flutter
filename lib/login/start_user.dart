import 'dart:async';
import 'package:flutter/material.dart';



class GoalDetail extends StatefulWidget {
  @override
  _GoalDetail createState() => _GoalDetail();
}

class _GoalDetail extends State<GoalDetail> {
  static const int tt = 10;
  int totalSeconds = tt;
  bool isRunning = false;

  late Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //공통화 필요
          Container(
            child: Text('시작하기'),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 22),
                Text("사용자 이름"),
                Text("인풀"),
                SizedBox(height: 22),
              ]
            ),
            width: 500,
            height: 300,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          IconButton(onPressed: null, icon: Icon(Icons.check_box, weight: 15))
        ],
      ),
    );
  }
}