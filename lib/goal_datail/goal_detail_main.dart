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
            child: Text('영어마스터'),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          Container(
            child: Text('미드 1만시간 보기'),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          Container(
            child: Text('여기다 시간 뽑기 : ' + totalSeconds.toString()),
          ),
          Row(
            children: [
              Icon(Icons.edit_note_outlined),
              //Icon(Icons.play_arrow, size: 25,),
              IconButton(onPressed: isRunning ? onPausePressed : onStartPressed, icon: isRunning ? Icon(Icons.pause, size: 25,) : Icon(Icons.play_arrow, size: 25,)),
              Icon(Icons.mode_edit_outlined),
            ],
          )
        ],
      ),
    );
  }

  void onPausePressed(){
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }
  void onStartPressed(){
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onTick(timer);
    });
    setState(() {
      isRunning = true;
    });
  }

  void onTick(Timer timer){
    if(totalSeconds == 0){
      setState(() {
        isRunning = false;
        totalSeconds = tt;
      });
      timer.cancel();
    }
    else{
      setState(() {
        totalSeconds -= 1;
      });
    }
  }
}