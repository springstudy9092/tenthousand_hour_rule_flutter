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
    final Size size = MediaQuery.of(context).size; // 추후 전역화

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //공통화 필요
          Container(
            child: Text('영어마스터', textAlign: TextAlign.center,),
            width: size.width * 0.8,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          Container(
            child: Text('미드 1만시간 보기', textAlign: TextAlign.center,),
            width: size.width * 0.8,
            height: size.height * 0.07,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          Container(
            child: Text('여기다 시간 뽑기 : ' + totalSeconds.toString(), textAlign: TextAlign.center,),
            width: size.width * 0.8,
            height: size.height * 0.3,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          SizedBox(height: size.height * 0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit_note_outlined, size: 50),
              SizedBox(width: size.width * 0.02,),
              //Icon(Icons.play_arrow, size: 25,),
              IconButton(onPressed: isRunning ? onPausePressed : onStartPressed, icon: isRunning ? Icon(Icons.pause, size: 25,) : Icon(Icons.play_arrow, size: 50,)),
              SizedBox(width: size.width * 0.02,),
              Icon(Icons.mode_edit_outlined, size: 50),
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